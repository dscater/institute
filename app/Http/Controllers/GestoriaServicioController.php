<?php

namespace App\Http\Controllers;

use App\Models\GestoriaServicio;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GestoriaServicioController extends Controller
{
    public $validacion = [
        "trabajo" => "required",
        "turismo" => "required",
        "estudiantes" => "required",
        "renovacion" => "required",
    ];

    public $mensajes = [
        "trabajo.required" => "Este campo es obligatorio",
        "turismo.required" => "Este campo es obligatorio",
        "estudiantes.required" => "Este campo es obligatorio",
        "renovacion.required" => "Este campo es obligatorio",
    ];

    public function index(Request $request)
    {
        $gestoria_servicio = GestoriaServicio::get()->first();
        return response()->JSON(['gestoria_servicio' => $gestoria_servicio, 200]);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el GestoriaServicio
            $gestoria_servicio = GestoriaServicio::get()->first();
            if (!$gestoria_servicio) {
                $gestoria_servicio = GestoriaServicio::create($request->all());
            } else {
                $gestoria_servicio->update($request->all());
            }
            $datos_original = HistorialAccion::getDetalleRegistro($gestoria_servicio, "gestoria_servicios");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ACTUALIZÓ LA INFORMACIÓN DE GESTORÍA SERVICIOS',
                'datos_original' => $datos_original,
                'modulo' => 'GESTORÍA SERVICIOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'gestoria_servicio' => $gestoria_servicio,
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
