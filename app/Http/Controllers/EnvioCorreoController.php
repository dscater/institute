<?php

namespace App\Http\Controllers;

use App\Models\EnvioCorreo;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class EnvioCorreoController extends Controller
{
    public $validacion = [
        "correo" => "required|email",
        "nombre" => "required|min:4",
        "password" => "required|min:4",
    ];

    public $mensajes = [
        "correo.required" => "Este campo es obligatorio",
        "correo.email" => "Debes ingresar un correo valido",
        "nombre.required" => "Este campo es obligatorio",
        "nombre.min" => "Debes ingresar al menos :min carácteres",
        "password.required" => "Este campo es obligatorio",
        "password.min" => "Debes ingresar al menos :min carácteres",
    ];

    public function index(Request $request)
    {
        $envio_correo = EnvioCorreo::get()->first();
        return response()->JSON(['envio_correo' => $envio_correo, 200]);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el EnvioCorreo
            $envio_correo = EnvioCorreo::get()->first();
            if (!$envio_correo) {
                $envio_correo = EnvioCorreo::create($request->all());
            } else {
                $envio_correo->update($request->all());
            }
            $datos_original = HistorialAccion::getDetalleRegistro($envio_correo, "envio_correos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ACTUALIZÓ LAS CREDENCIALES DE ENVIO DE CORREOS',
                'datos_original' => $datos_original,
                'modulo' => 'ENVIO DE CORREOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'envio_correo' => $envio_correo,
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
