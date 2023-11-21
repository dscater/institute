<?php

namespace App\Http\Controllers;

use App\Mail\CorreoContrasena;
use App\Models\Configuracion;
use App\Models\EnvioCorreo;
use App\Models\HistorialAccion;
use App\Models\Recuperacion;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Hash;

class ConfiguracionController extends Controller
{
    public function getConfiguracion()
    {
        $configuracion = Configuracion::first();
        if ($configuracion) {
            return response()->JSON([
                'sw' => true,
                'configuracion' => $configuracion
            ]);
        }
        return response()->JSON([
            'sw' => false,
            'msj' => 'No se encontró ninguna configuración'
        ], 200);
    }

    public function getLogo()
    {
        $configuracion = Configuracion::first();
        return response()->JSON($configuracion ? $configuracion->path_image : "");
    }

    public function update(Request $request)
    {
        $validacion = [
            'nombre_sistema' => 'required|min:4',
            'alias' => 'required|min:1',
            'actividad' => 'required|min:4',
        ];
        $mensajes =  [
            'nombre_sistema.required' => 'Este campo es obligatorio',
            'nombre_sistema.min' => 'Debes ingresar al menos 4 carácteres',
            'razon_social.required' => 'Este campo es obligatorio',
            'razon_social.min' => 'Debes ingresar al menos 4 carácteres',
            'nit.required' => 'Este campo es obligatorio',
            'ciudad.required' => 'Este campo es obligatorio',
            'ciudad.min' => 'Debes ingresar al menos 4 carácteres',
            'dir.required' => 'Este campo es obligatorio',
            'dir.min' => 'Debes ingresar al menos 4 carácteres',
            'fono.required' => 'Este campo es obligatorio',
            'fono.min' => 'Debes ingresar al menos 4 carácteres',
            'actividad.required' => 'Este campo es obligatorio',
            'actividad.min' => 'Debes ingresar al menos 4 carácteres',
        ];

        if ($request->hasFile('logo')) {
            $validacion['logo'] = 'image|mimes:jpeg,jpg,png,webp|max:4096';
        }
        $request->validate($validacion, $mensajes);

        $configuracion = Configuracion::first();
        if ($configuracion) {
            DB::beginTransaction();
            try {
                $datos_original = HistorialAccion::getDetalleRegistro($configuracion, "configuracions");
                $configuracion->update(array_map('mb_strtoupper', $request->except('logo')));
                $configuracion->save();
                if ($request->hasFile('logo')) {
                    $antiguo = $configuracion->logo;
                    \File::delete(public_path() . '/imgs/' . $antiguo);
                    $file = $request->logo;
                    $nombre = time() . '_logo.' . $file->getClientOriginalExtension();
                    $file->move(public_path() . '/imgs/', $nombre);
                    $configuracion->logo = $nombre;
                    $configuracion->save();
                }
                $datos_nuevo = HistorialAccion::getDetalleRegistro($configuracion, "configuracions");
                HistorialAccion::create([
                    'user_id' => Auth::user()->id,
                    'accion' => 'MODIFICACIÓN',
                    'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ LA CONFIGURACIÓN',
                    'datos_original' => $datos_original,
                    'datos_nuevo' => $datos_nuevo,
                    'modulo' => 'CONFIGURACIÓN',
                    'fecha' => date('Y-m-d'),
                    'hora' => date('H:i:s')
                ]);

                DB::commit();
                return response()->JSON([
                    'sw' => true,
                    'msj' => 'Los datos se actualizarón de forma correcta',
                    'configuracion' => $configuracion
                ], 200);
            } catch (\Exception $e) {
                DB::rollBack();
                return response()->JSON([
                    'sw' => false,
                    'message' => $e->getMessage(),
                ], 500);
            }
        }
        return response()->JSON([
            'sw' => false,
            'msj' => 'No se encontró ninguna configuración'
        ], 200);
    }

    public function url_asset()
    {
        return asset("");
    }

    public function recuperar_contrasena()
    {
        return view("recuperar_contrasena");
    }

    public function envia_correo(Request $request)
    {
        $request->validate([
            "correo" => "required|email"
        ], [
            "correo.required" => "Debes ingresar un correo",
            "correo.email" => "Debes ingresar un correo valido"
        ]);

        DB::beginTransaction();
        try {
            $envio_correo = EnvioCorreo::first();

            if ($envio_correo) {
                $host = $envio_correo->host;
                $puerto = $envio_correo->puerto;
                $encryptado = $envio_correo->encryptado;
                $name = $envio_correo->nombre;
                $correo_envio = $envio_correo->correo;
                $password = $envio_correo->password;
                // Configurar el servicio de correo con la configuración de Gmail dinámicamente
                Config::set([
                    'mail.mailers.smtp.host' => $host,
                    'mail.mailers.smtp.port' => $puerto,
                    'mail.mailers.smtp.encryption' => $encryptado,
                    'mail.mailers.smtp.username' => $correo_envio,
                    'mail.mailers.smtp.password' => $password,
                    'mail.from.address' => $correo_envio,
                    'mail.from.name' => $name,
                ]);


                $correo_usuario = $request->correo;
                // buscar usuario correo
                $user = User::where("correo", $correo_usuario)->where("acceso", 1)->get()->first();
                if ($user) {
                    // crear recuperacion
                    $nueva_recuperacion = Recuperacion::create([
                        "user_id" => $user->id,
                        "correo" => $correo_usuario,
                        "estado" => 0,
                    ]);

                    $url_recuperacion = route('contrasena.form_nueva_contrasena', $nueva_recuperacion->id);

                    Mail::to($correo_usuario)
                        ->send(new CorreoContrasena($user->full_name, $url_recuperacion));

                    DB::commit();
                    return redirect()->route('contrasena.recuperar_contrasena')->with("success", "Te enviamos un link de recuperación a tu correo.");
                } else {
                    throw new Exception("Error, el correo ingresado no se encuentra o esta inhabilitado");
                }
            } else {
                throw new Exception("Error del sistema. No se pudo realizar el envío del correo, contactese con un administrador. Error correo no registrado.");
            }
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->with("error", $e->getMessage());
        }
    }

    public function form_nueva_contrasena(Recuperacion $recuperacion)
    {
        return view("form_nueva_contrasena", compact("recuperacion"));
    }

    public function actualiza_contrasena(Request $request, Recuperacion $recuperacion)
    {
        $request->validate([
            'password' => 'required|min:8|confirmed',
        ], [
            "password.required" => "Debes ingresar una contraseña",
            "password.min" => "La contraseña debe tener al menos :min caracteres",
            'password.confirmed' => 'La confirmación de la contraseña no coincide',
        ]);

        DB::beginTransaction();
        try {
            if ($recuperacion->estado == 1) {
                throw new Exception("Este link de recuperación ya fue usado, por favor vuelve a solicitar la recuperación de tu contraseña");
            }

            $user = User::findOrFail($recuperacion->user_id);
            $user->password = Hash::make($request->password);
            $user->save();

            $recuperacion->estado = 1;
            $recuperacion->save();
            DB::commit();
            return redirect()->route('contrasena.form_nueva_contrasena', $recuperacion->id)->with("success", "Contraseña restablecida correctamente");
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->with("error", $e->getMessage());
        }
    }
}
