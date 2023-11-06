<?php

namespace App\Http\Controllers;

use App\Models\EnunciadoPregunta;
use App\Models\ExamenEnunciado;
use App\Models\ExamenNivelacion;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ExamenNivelacionController extends Controller
{
    public function index(Request $request)
    {
        $examen_nivelacions = ExamenNivelacion::with(["curso"])->orderBy("id", "desc")->get();
        return response()->JSON(['examen_nivelacions' => $examen_nivelacions, 'total' => count($examen_nivelacions)], 200);
    }
    public function store(Request $request)
    {
        // validar formulario
        $curso_id = $request->curso_id;
        $examen_enunciados = $request->examen_enunciados;
        $errors = self::validacionFormulario($curso_id, $examen_enunciados);

        if (count($errors) > 0) {
            return response()->JSON([
                "errors" => $errors
            ], 422);
        }
        DB::beginTransaction();
        try {
            // crear el ExamenNivelacion
            $request["fecha_registro"] = date("Y-m-d");
            $nuevo_examen_nivelacion = ExamenNivelacion::create([
                "curso_id" => $request->curso_id
            ]);

            // registrar los enunciados
            foreach ($examen_enunciados as $ee) {
                $nuevo_examen_enunciado = ExamenEnunciado::create([
                    "examen_nivelacion_id" => $nuevo_examen_nivelacion->id,
                    "enunciado" => $ee["enunciado"],
                    "tipo" => $ee["tipo"]
                ]);

                // registrar las preguntas
                foreach ($ee["enunciado_preguntas"] as $ep) {
                    if ($ee["tipo"] == "SELECCIÓN" || $ee["tipo"] == "LLENADO INTERMEDIO CON OPCIONES" || $ee["tipo"] == "ELIGE UNA OPCIÓN" || $ee["tipo"] == "LLENADO DOBLE INTERMEDIO CON OPCIONES") {
                        EnunciadoPregunta::create([
                            "examen_enunciado_id" => $nuevo_examen_enunciado->id,
                            "pregunta" => $ep["pregunta"],
                            "tipo" => $nuevo_examen_enunciado->tipo,
                            "opciones" => implode(", ", $ep["array_opciones"]),
                        ]);
                    } else {
                        EnunciadoPregunta::create([
                            "examen_enunciado_id" => $nuevo_examen_enunciado->id,
                            "pregunta" => $ep["pregunta"],
                            "tipo" => $nuevo_examen_enunciado->tipo,
                        ]);
                    }
                }
            }

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_examen_nivelacion, "examen_nivelacions");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UN EXAMEN DE NIVELACION',
                'datos_original' => $datos_original,
                'modulo' => 'EXAMEN DE NIVELACION',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'examen_nivelacion' => $nuevo_examen_nivelacion,
                'msj' => 'El registro se realizó de forma correcta',
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function show(ExamenNivelacion $examen_nivelacion)
    {
        return response()->JSON([
            "examen_nivelacion" => $examen_nivelacion->load(["examen_enunciados.enunciado_preguntas"])
        ], 200);
    }

    public function update(Request $request, ExamenNivelacion $examen_nivelacion)
    {       // validar formulario
        $curso_id = $request->curso_id;
        $examen_enunciados = $request->examen_enunciados;
        $errors = self::validacionFormulario($curso_id, $examen_enunciados);

        if (count($errors) > 0) {
            return response()->JSON([
                "errors" => $errors
            ], 422);
        }
        DB::beginTransaction();
        try {
            // ELIMINAR ENUNCIADOS
            $eliminados_enunciados  = $request->eliminados_enunciados;
            if (isset($eliminados_enunciados) && !empty($eliminados_enunciados)) {
                foreach ($eliminados_enunciados as $ee) {
                    $examen_enunciado = ExamenEnunciado::findOrFail($ee);
                    $examen_enunciado->enunciado_preguntas()->delete();
                    $examen_enunciado->delete();
                }
            }

            $eliminados_preguntas  = $request->eliminados_preguntas;

            if (isset($eliminados_preguntas) && !empty($eliminados_preguntas)) {
                foreach ($eliminados_preguntas as $ep) {
                    $enunciado_pregunta = EnunciadoPregunta::find($ep);
                    if ($enunciado_pregunta) {
                        $enunciado_pregunta->delete();
                    }
                }
            }

            $datos_original = HistorialAccion::getDetalleRegistro($examen_nivelacion, "examen_nivelacions");

            // actualizar curso
            $examen_nivelacion->update([
                "curso_id" => $request->curso_id
            ]);

            // registrar los enunciados
            foreach ($examen_enunciados as $ee) {
                if ($ee["id"] == 0) {
                    // nuevo enunciado
                    $nuevo_examen_enunciado = ExamenEnunciado::create([
                        "examen_nivelacion_id" => $examen_nivelacion->id,
                        "enunciado" => $ee["enunciado"],
                        "tipo" => $ee["tipo"]
                    ]);
                } else {
                    //actualizar enunciado
                    $nuevo_examen_enunciado = ExamenEnunciado::find($ee["id"]);
                    $nuevo_examen_enunciado->update([
                        "enunciado" => $ee["enunciado"],
                        "tipo" => $ee["tipo"]
                    ]);
                }

                // registrar las preguntas
                foreach ($ee["enunciado_preguntas"] as $ep) {

                    if ($ep["id"] == 0) {
                        // nueva pregunta
                        if ($ee["tipo"] == "SELECCIÓN" || $ee["tipo"] == "LLENADO INTERMEDIO CON OPCIONES" || $ee["tipo"] == "ELIGE UNA OPCIÓN" || $ee["tipo"] == "LLENADO DOBLE INTERMEDIO CON OPCIONES") {
                            EnunciadoPregunta::create([
                                "examen_enunciado_id" => $nuevo_examen_enunciado->id,
                                "pregunta" => $ep["pregunta"],
                                "tipo" => $nuevo_examen_enunciado->tipo,
                                "opciones" => implode(", ", $ep["array_opciones"]),
                            ]);
                        } else {
                            EnunciadoPregunta::create([
                                "examen_enunciado_id" => $nuevo_examen_enunciado->id,
                                "pregunta" => $ep["pregunta"],
                                "tipo" => $nuevo_examen_enunciado->tipo,
                            ]);
                        }
                    } else {
                        // actualizar pregunta
                        $enunciado_pregunta = EnunciadoPregunta::findOrFail($ep["id"]);
                        if ($ee["tipo"] == "SELECCIÓN" || $ee["tipo"] == "LLENADO INTERMEDIO CON OPCIONES" || $ee["tipo"] == "ELIGE UNA OPCIÓN" || $ee["tipo"] == "LLENADO DOBLE INTERMEDIO CON OPCIONES") {
                            $enunciado_pregunta->update([
                                "examen_enunciado_id" => $nuevo_examen_enunciado->id,
                                "pregunta" => $ep["pregunta"],
                                "tipo" => $nuevo_examen_enunciado->tipo,
                                "opciones" => implode(", ", $ep["array_opciones"]),
                            ]);
                        } else {
                            $enunciado_pregunta->update([
                                "examen_enunciado_id" => $nuevo_examen_enunciado->id,
                                "pregunta" => $ep["pregunta"],
                                "tipo" => $nuevo_examen_enunciado->tipo,
                            ]);
                            $enunciado_pregunta->opciones = null;
                            $enunciado_pregunta->save();
                        }
                    }
                }
            }

            $datos_nuevo = HistorialAccion::getDetalleRegistro($examen_nivelacion, "examen_nivelacions");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN EXAMEN DE NIVELACION',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'EXAMEN DE NIVELACION',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'examen_nivelacion' => $examen_nivelacion,
                'msj' => 'El registro se actualizó de forma correcta'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }
    public function destroy(ExamenNivelacion $examen_nivelacion)
    {
        DB::beginTransaction();
        try {
            $examen_enunciados  = $examen_nivelacion->examen_enunciados;
            foreach ($examen_enunciados as $ee) {
                $examen_enunciado = ExamenEnunciado::findOrFail($ee->id);
                $examen_enunciado->enunciado_preguntas()->delete();
                $examen_enunciado->delete();
            }

            $datos_original = HistorialAccion::getDetalleRegistro($examen_nivelacion, "examen_nivelacions");
            $examen_nivelacion->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UN EXAMEN DE NIVELACION',
                'datos_original' => $datos_original,
                'modulo' => 'EXAMEN DE NIVELACION',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'msj' => 'El registro se eliminó correctamente'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public static function validacionFormulario($curso_id, $examen_enunciados = [])
    {
        $errors = [];
        if (empty($curso_id)) {
            $errors["curso_id"] = ["Debes seleccionar un curso"];
        }

        if (isset($examen_enunciados) && count($examen_enunciados) > 0) {
            foreach ($examen_enunciados as $key => $ee) {
                if (empty($ee["enunciado"])) {
                    // validar titulo del enunciado
                    $errors["examen_enunciados_" . $key] = ["Debes ingresar el título del enunciado <b>" . ($key + 1) . "</b>"];
                }
                if (empty($ee["enunciado_preguntas"])) {
                    // validar la cantidad de preguntas del enunciado
                    $errors["examen_enunciados_" . $key . "_enunciado_preguntas"] = ["Debes ingresar al menos una pregunta en el enunciado <b>" . ($key + 1) . "</b>"];
                } else {
                    foreach ($ee["enunciado_preguntas"] as $key_pregunta => $ep) {
                        if (empty($ep["pregunta"])) {
                            // validar texto de la pregunta de un enunciado
                            $errors["examen_enunciados_" . $key . "_enunciado_preguntas_" . $key_pregunta . "_pregunta"] = ["Debes completar la pregunta <b>" . ($key_pregunta + 1) . "</b> del enunciado <b>" . ($key + 1) . "</b>"];
                        }
                        if ($ee["tipo"] == "SELECCIÓN" || $ee["tipo"] == "LLENADO INTERMEDIO" || $ee["tipo"] == "LLENADO INTERMEDIO CON OPCIONES" || $ee["tipo"] == "ELIGE UNA OPCIÓN" || $ee["tipo"] == "LLENADO DOBLE INTERMEDIO CON OPCIONES") {
                            // validar barras bajas
                            if ($ee["tipo"] == "SELECCIÓN") {
                                // 1 barra
                                $conteo = substr_count($ep["pregunta"], "_");
                                if ($conteo != 1) {
                                    $errors["examen_enunciados_" . $key . "_enunciado_preguntas_" . $key_pregunta . "_pregunta"] = ["El tipo SELECCIÓN de la pregunta <b>" . ($key_pregunta + 1) . "</b> del enunciado <b>" . ($key + 1) . "</b> debe tener una sola barra baja \"_\""];
                                }
                            }
                            if ($ee["tipo"] == "LLENADO INTERMEDIO") {
                                // 1 barra
                                $conteo = substr_count($ep["pregunta"], "_");
                                if ($conteo != 1) {
                                    $errors["examen_enunciados_" . $key . "_enunciado_preguntas_" . $key_pregunta . "_pregunta"] = ["El tipo LLENADO INTERMEDIO de la pregunta <b>" . ($key_pregunta + 1) . "</b> del enunciado <b>" . ($key + 1) . "</b> debe tener una sola barra baja \"_\""];
                                }
                            }
                            if ($ee["tipo"] == "LLENADO INTERMEDIO CON OPCIONES") {
                                // 1 barra
                                $conteo = substr_count($ep["pregunta"], "_");
                                if ($conteo != 1) {
                                    $errors["examen_enunciados_" . $key . "_enunciado_preguntas_" . $key_pregunta . "_pregunta"] = ["El tipo LLENADO INTERMEDIO CON OPCIONES de la pregunta <b>" . ($key_pregunta + 1) . "</b> del enunciado <b>" . ($key + 1) . "</b> debe tener una sola barra baja \"_\""];
                                }
                            }
                            if ($ee["tipo"] == "LLENADO DOBLE INTERMEDIO CON OPCIONES") {
                                // 1 barra
                                $conteo = substr_count($ep["pregunta"], "_");
                                if ($conteo != 2) {
                                    $errors["examen_enunciados_" . $key . "_enunciado_preguntas_" . $key_pregunta . "_pregunta"] = ["El tipo LLENADO DOBLE INTERMEDIO CON OPCIONES de la pregunta <b>" . ($key_pregunta + 1) . "</b> del enunciado <b>" . ($key + 1) . "</b> debe contener dos barras bajas \"_\" \"_\""];
                                }
                            }

                            if (empty($ep["array_opciones"]) && $ee["tipo"] != "LLENADO INTERMEDIO") {
                                // validar opciones
                                $errors["examen_enunciados_" . $key . "_enunciado_preguntas_" . $key_pregunta . "_opciones"] = ["Debes ingresar por lo menos una opción en la pregunta <b>" . ($key_pregunta + 1) . "</b> del enunciado <b>" . ($key + 1) . "</b>"];
                            }
                        }
                    }
                }
            }
        } else {
            // validar cantidad de enunciados
            $errors["examen_enunciados"] = ["Debes crear por lo menos 1 enunciado"];
        }

        return $errors;
    }
}
