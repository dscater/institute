<?php

namespace App\Http\Controllers;

use App\Models\AsignacionGrupo;
use App\Models\Curso;
use App\Models\HistorialAccion;
use App\Models\Horario;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class HorarioController extends Controller
{
    public $validacion = [
        'grupo_id' => 'required',
        'modalidad' => 'required',
        'fecha_inicio' => 'required|date',
        'fecha_fin' => 'required|date',
        'hora_inicio' => 'required',
        'hora_fin' => 'required',
    ];

    public $mensajes = [
        'grupo_id.required' => 'Este campo es obligatorio',
        'modalidad.required' => 'Este campo es obligatorio',
        'fecha_inicio.required' => 'Este campo es obligatorio',
        'fecha_inicio.date' => 'Debes ingresar una fecha valida',
        'fecha_fin.required' => 'Este campo es obligatorio',
        'fecha_fin.date' => 'Debes ingresar una fecha valida',
        'hora_inicio.required' => 'Este campo es obligatorio',
        'hora_fin.required' => 'Este campo es obligatorio',
        'array_dias.required' => 'Debes seleccionar al menos un día de la semana',
    ];

    public function index(Request $request)
    {
        $horarios = Horario::with(["grupo"])->orderBy("id", "desc")->get();
        return response()->JSON(['horarios' => $horarios, 'total' => count($horarios)], 200);
    }

    public function horarios()
    {
        $fecha_actual = date("Y-m-d");
        $horarios = Horario::where("fecha_fin", ">=", $fecha_actual)->orderBY("hora_inicio", "asc")->get();

        $dias = [0, 1, 2, 3, 4, 5, 6];
        $dias_txt = ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sábado'];

        $array_horas = [];
        $array_fechas = [];
        $array_fecha_fin_aux = [];

        $tabla_horarios = [];
        $tabla_fechas = [];
        foreach ($horarios  as $h) {

            // buscar cursos del grupo
            $id_cursos = AsignacionGrupo::where("grupo_id", $h->grupo_id)->pluck("curso_id");
            $cursos = Curso::whereIn("id", $id_cursos)->get();

            // asignar indices de los arrays para validaciones
            $hora_string = $h->hora_inicio_t . ' - ' . $h->hora_fin_t;
            $fecha_string = $h->fecha_inicio_t . ' al ' . $h->fecha_fin_t;

            // ****************************************************
            // armar el array para recorrer la tabla de horarios
            // *************************************************
            if (!in_array($hora_string, $array_horas)) {
                $array_horas[] = $hora_string;
            }
            // inicializar array
            if (!isset($tabla_horarios[$hora_string])) {
                $tabla_horarios[$hora_string] = [
                    1 => [],
                    2 => [],
                    3 => [],
                    4 => [],
                    5 => [],
                    6 => [],
                    0 => [],
                ];
            }
            // recorrer y asignar los dias
            foreach ($tabla_horarios[$hora_string] as $key_dia => $th) {
                if ($h->array_dias[$key_dia] == 1) {
                    // asignar cursos del grupo
                    $tabla_horarios[$hora_string][$key_dia] = $cursos; //asignar el dia
                }
            }

            // *************************************************
            // armar el array para recorrer la tabla de fechas
            // *************************************************
            if (!in_array($fecha_string, $array_fechas)) {
                $array_fechas[] = $fecha_string;
                $array_fecha_fin_aux[] = $h->fecha_fin;
                // agregar horario a la fecha
                $tabla_fechas[$fecha_string] = $cursos;
            }
        }

        $html = view("parcial.horarios", compact("tabla_horarios", "tabla_fechas", "array_horas", "array_fechas"))->render();

        return response()->JSON(['html' => $html, 'horarios' => $horarios, 'total' => count($horarios)], 200);
    }

    public function store(Request $request)
    {
        $this->validacion['array_dias'] = [
            'required',
            function ($attribute, $value, $fail) {
                $value = explode(",", $value);
                if (!in_array(1, $value)) {
                    $fail("Debes seleccionar al menos uno de los días de la semana ");
                }
            },
        ];
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // validar que no exista un registor del grupo
            $existe_horario = Horario::where("grupo_id", $request->grupo_id)->get()->first();
            if ($existe_horario) {
                throw new Exception("El grupo " . $existe_horario->grupo->nombre . " ya tiene un horario registrado");
            }

            // crear el Horario
            $request["fecha_registro"] = date("Y-m-d");
            $request["dias"] = $request["array_dias"];
            $nuevo_horario = Horario::create(array_map('mb_strtoupper', $request->all()));

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_horario, "horarios");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UN HORARIO',
                'datos_original' => $datos_original,
                'modulo' => 'HORARIOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'horario' => $nuevo_horario,
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

    public function show(Horario $horario)
    {
        return response()->JSON([
            "horario" => $horario
        ], 200);
    }

    public function update(Request $request, Horario $horario)
    {
        $this->validacion['array_dias'] = [
            'required',
            function ($attribute, $value, $fail) {
                $value = explode(",", $value);
                if (!in_array(1, $value)) {
                    $fail("Debes seleccionar al menos uno de los días de la semana ");
                }
            },
        ];
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // validar que no exista un registor del grupo
            $existe_horario = Horario::where("grupo_id", $request->grupo_id)->where("id", "!=", $horario->id)->get()->first();
            if ($existe_horario) {
                throw new Exception("El grupo " . $existe_horario->grupo->nombre . " ya tiene un horario registrado");
            }

            $datos_original = HistorialAccion::getDetalleRegistro($horario, "horarios");
            $request["dias"] = $request["array_dias"];
            $horario->update(array_map('mb_strtoupper', $request->all()));

            $datos_nuevo = HistorialAccion::getDetalleRegistro($horario, "horarios");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN HORARIO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'HORARIOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'horario' => $horario,
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
    public function destroy(Horario $horario)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($horario, "horarios");
            $horario->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UN HORARIO',
                'datos_original' => $datos_original,
                'modulo' => 'HORARIOS',
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
}
