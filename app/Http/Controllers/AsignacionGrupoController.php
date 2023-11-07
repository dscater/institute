<?php

namespace App\Http\Controllers;

use App\Models\AsignacionGrupo;
use App\Models\HistorialAccion;
use App\Models\Inscripcion;
use App\Models\InscripcionSolicitud;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AsignacionGrupoController extends Controller
{
    public $validacion = [
        'grupo_id' => 'required',
        'inscripcion_solicitud_id' => 'required',
        'curso_id' => 'required',
    ];

    public $mensajes = [
        'grupo_id.required' => 'Este campo es obligatorio',
        'inscripcion_solicitud_id.required' => 'Este campo es obligatorio',
        'curso_id.required' => 'Este campo es obligatorio',
    ];

    public function index(Request $request)
    {
        $asignacion_grupos = AsignacionGrupo::with(["grupo", "curso", "inscripcion", "inscripcion_solicitud"])->orderBy("id", "desc")->get();
        return response()->JSON(['asignacion_grupos' => $asignacion_grupos, 'total' => count($asignacion_grupos)], 200);
    }

    public function asignaciones_estudiante(Request $request)
    {
        $asignacion_grupos = [];
        $user = Auth::user();
        $inscripcion = Inscripcion::where("user_id", $user->id)->get()->first();
        $per_page = 10;
        $asignacion_grupos = AsignacionGrupo::with(["inscripcion", "inscripcion_solicitud.inscripcion_examen", "curso", "grupo.horario"])
            ->where("inscripcion_id", $inscripcion->id)
            ->paginate($per_page);
        return response()->JSON([
            'asignacion_grupos' => $asignacion_grupos,
            'inscripcion' => $inscripcion,
            'total' => count($asignacion_grupos)
        ], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $inscripcion_solicitud = InscripcionSolicitud::findOrFail($request->inscripcion_solicitud_id);
            // crear el AsignacionGrupo
            $request["fecha_registro"] = date("Y-m-d");
            $inscripcion = $inscripcion_solicitud->inscripcion;
            $request["inscripcion_id"] = $inscripcion->id;
            $nueva_asignacion_grupo = AsignacionGrupo::create(array_map('mb_strtoupper', $request->all()));

            $inscripcion_solicitud->estado_asignado = "SI";
            $inscripcion_solicitud->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nueva_asignacion_grupo, "asignacion_grupos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UNA ASIGNACIÓN DE GRUPO',
                'datos_original' => $datos_original,
                'modulo' => 'ASIGNACIÓN DE GRUPOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'asignacion_grupo' => $nueva_asignacion_grupo,
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

    public function show(AsignacionGrupo $asignacion_grupo)
    {
        return response()->JSON([
            "asignacion_grupo" => $asignacion_grupo
        ], 200);
    }

    public function update(Request $request, AsignacionGrupo $asignacion_grupo)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($asignacion_grupo, "asignacion_grupos");
            $asignacion_grupo->update(array_map('mb_strtoupper', $request->except("inscripcion_id", "inscripcion_solicitud_id")));

            $datos_nuevo = HistorialAccion::getDetalleRegistro($asignacion_grupo, "asignacion_grupos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UNA ASIGNACIÓN DE GRUPO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'ASIGNACIÓN DE GRUPOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'asignacion_grupo' => $asignacion_grupo,
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
    public function destroy(AsignacionGrupo $asignacion_grupo)
    {
        DB::beginTransaction();
        try {
            $inscripcion_solicitud = InscripcionSolicitud::findOrFail($asignacion_grupo->inscripcion_solicitud_id);
            $inscripcion_solicitud->estado_asignado = "NO";
            $inscripcion_solicitud->save();

            $datos_original = HistorialAccion::getDetalleRegistro($asignacion_grupo, "asignacion_grupos");
            $asignacion_grupo->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UNA ASIGNACIÓN DE GRUPO',
                'datos_original' => $datos_original,
                'modulo' => 'ASIGNACIÓN DE GRUPOS',
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
