<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\Inscripcion;
use App\Models\InscripcionSolicitud;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class InscripcionSolicitudController extends Controller
{
    public function aceptados_sin_asignar()
    {
        $inscripcion_solicituds = InscripcionSolicitud::with(["inscripcion", "curso"])->where("estado", "ACEPTADO")->where("estado_asignado", "NO")->get();
        return response()->JSON(['inscripcion_solicituds' => $inscripcion_solicituds, 'total' => count($inscripcion_solicituds)], 200);
    }

    public function solicitudes_estudiante(Request $request)
    {
        $inscripcion_solicituds = [];
        $user = Auth::user();
        $inscripcion = Inscripcion::where("user_id", $user->id)->get()->first();
        $per_page = 10;
        $inscripcion_solicituds = InscripcionSolicitud::with(["inscripcion", "curso"])
            ->where("inscripcion_id", $inscripcion->id)
            ->paginate($per_page);
        return response()->JSON(['inscripcion_solicituds' => $inscripcion_solicituds, 'total' => count($inscripcion_solicituds)], 200);
    }

    public function show(InscripcionSolicitud $inscripcion_solicitud)
    {
        return response()->JSON([
            "inscripcion_solicitud" => $inscripcion_solicitud
        ], 200);
    }
    public function update(InscripcionSolicitud $inscripcion_solicitud, Request $request)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($inscripcion_solicitud, "inscripcion_solicituds");
            $inscripcion_solicitud->update(array_map('mb_strtoupper', $request->all()));

            $inscripcion = $inscripcion_solicitud->inscripcion;
            $inscripcion->estado_ultima_solicitud = $request->estado;
            $inscripcion->save();

            $datos_nuevo = HistorialAccion::getDetalleRegistro($inscripcion_solicitud, "inscripcion_solicituds");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' CAMBIO EL ESTADO DE UNA SOLICITUD',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'INSCRIPCION SOLICITUD',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'inscripcion_solicitud' => $inscripcion_solicitud,
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
}
