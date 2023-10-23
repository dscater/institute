<?php

namespace App\Http\Controllers;

use App\Models\ConfiguracionGestoria;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ConfiguracionGestoriaController extends Controller
{
    public $validacion = [
        "direccion" => "required",
        "fono1" => "required",
        "correo" => "required|email",
        "mapa" => "required",
    ];

    public $mensajes = [
        "direccion.required" => "Este campo es obligatorio",
        "fono1.required" => "Este campo es obligatorio",
        "correo.required" => "Este campo es obligatorio",
        "correo.email" => "Debes ingresar un correo valido",
    ];

    public function index(Request $request)
    {
        $configuracion_gestoria = ConfiguracionGestoria::get()->first();
        return response()->JSON(['configuracion_gestoria' => $configuracion_gestoria, 200]);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el ConfiguracionGestoria
            $configuracion_gestoria = ConfiguracionGestoria::get()->first();
            if (!$configuracion_gestoria) {
                $configuracion_gestoria = ConfiguracionGestoria::create(array_map('mb_strtoupper', $request->except("mapa")));
            } else {
                $configuracion_gestoria->update(array_map('mb_strtoupper', $request->except("mapa")));
            }
            $configuracion_gestoria->mapa = $request->mapa;
            $configuracion_gestoria->correo = mb_strtolower($configuracion_gestoria->correo);
            $configuracion_gestoria->save();
            $datos_original = HistorialAccion::getDetalleRegistro($configuracion_gestoria, "configuracion_gestorias");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ LA INFORMACIÓN DE GESTORÍA',
                'datos_original' => $datos_original,
                'modulo' => 'CONFIGURACIÓN GESTORÍA',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'configuracion_gestoria' => $configuracion_gestoria,
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
