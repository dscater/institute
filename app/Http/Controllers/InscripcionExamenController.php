<?php

namespace App\Http\Controllers;

use App\Models\AsignacionGrupo;
use App\Models\GrupoProfesor;
use App\Models\HistorialAccion;
use App\Models\InscripcionExamen;
use App\Models\InscripcionRespuesta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class InscripcionExamenController extends Controller
{
    public function index(Request $request)
    {
        $per_page = 10;
        $inscripcion_examens = InscripcionExamen::with(["examen_nivelacion", "inscripcion", "inscripcion_solicitud.curso"])
            ->orderby("id", "desc")
            ->paginate($per_page);

        if (Auth::user()->tipo == 'PROFESOR') {
            $user = Auth::user();
            $id_grupos_user = GrupoProfesor::where("user_id", $user->id)->pluck("grupo_id");
            $id_cursos_asignaciones = AsignacionGrupo::whereIn("grupo_id", $id_grupos_user)->pluck("curso_id");
            $inscripcion_examens = InscripcionExamen::select("inscripcion_examens.*")
                ->with(["examen_nivelacion", "inscripcion", "inscripcion_solicitud.curso"])
                ->join("inscripcion_solicituds", "inscripcion_solicituds.id", "=", "inscripcion_examens.inscripcion_solicitud_id")
                ->whereIn("inscripcion_solicituds.curso_id", $id_cursos_asignaciones)
                ->orderby("id", "desc")
                ->paginate($per_page);
        }
        return response()->JSON([
            'inscripcion_examens' => $inscripcion_examens, 'total' => count($inscripcion_examens),
            'per_page' => $per_page
        ], 200);
    }

    public function show(InscripcionExamen $inscripcion_examen)
    {
        return response()->JSON([
            "inscripcion_examen" => $inscripcion_examen->load(["inscripcion_respuestas", "examen_nivelacion.examen_enunciados.enunciado_preguntas", "examen_nivelacion.curso", "inscripcion", "inscripcion_solicitud.curso"])
        ], 200);
    }

    public function registrar_calificacion(InscripcionExamen $inscripcion_examen, Request $request)
    {
        $errors = self::validaCalificacionExamen($request->puntaje, $request->respuestas);

        if (count($errors) > 0) {
            return response()->JSON([
                "errors" => $errors
            ], 422);
        }

        DB::beginTransaction();
        try {
            $respuestas = $request->respuestas;
            foreach ($respuestas as $r) {
                $i_r = InscripcionRespuesta::findOrFail($r["id"]);
                $i_r->update([
                    "calificacion" => $r["calificacion"]
                ]);
            }

            $inscripcion_examen->update([
                "puntaje" => $request->puntaje,
                "estado" => "REVISADO",
            ]);

            $datos_original = HistorialAccion::getDetalleRegistro($inscripcion_examen, "inscripcion_examens");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' CALIFICÓ UN EXAMEN DE NIVELACION',
                'datos_original' => $datos_original,
                'modulo' => 'INSCRIPCIÓN EXAMENES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);


            DB::commit();
            return response()->JSON([
                'sw' => true,
                'inscripcion_examen' => $inscripcion_examen,
                'msj' => 'La calificación se registro de forma correcta',
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }
    public static function validaCalificacionExamen($puntaje, $respuestas)
    {
        $errors = [];
        if (!isset($puntaje) || $puntaje == '') {
            $errors["puntaje"] = ["Debes ingresar un puntaje"];
        }

        foreach ($respuestas as $r) {
            if (!$r["calificacion"] || trim($r["calificacion"]) == '') {
                $errors["incompleto"] = ["Debes calificar todas las preguntas"];
                break;
            }
        }

        return $errors;
    }
}
