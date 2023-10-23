<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\PortalComunicado;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PortalComunicadoController extends Controller
{
    public $validacion = [
        "descripcion" => "required",
    ];

    public $mensajes = [
        "descripcion.required" => "Este campo es obligatorio",
    ];

    public function index(Request $request)
    {
        $portal_comunicado = PortalComunicado::get()->first();
        return response()->JSON(['portal_comunicado' => $portal_comunicado, 200]);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el PortalComunicado
            $portal_comunicado = PortalComunicado::get()->first();
            if (!$portal_comunicado) {
                $portal_comunicado = PortalComunicado::create(
                    [
                        "descripcion" => nl2br($request->descripcion),
                    ]
                );
            } else {
                $portal_comunicado->update(
                    [
                        "descripcion" => nl2br($request->descripcion),
                    ]
                );
            }
            $datos_original = HistorialAccion::getDetalleRegistro($portal_comunicado, "portal_comunicados");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ EL COMUNICADO DE LA PÁGINA DE INICIO DEL PORTAL',
                'datos_original' => $datos_original,
                'modulo' => 'COMUNICADO PORTAL',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'portal_comunicado' => $portal_comunicado,
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
}
