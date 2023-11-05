<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\Profesor;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class ProfesorController extends Controller
{
    public $validacion = [
        'nombres' => 'required|min:4',
        'apellidos' => 'required|min:4',
        'fono' => 'required',
        'especialidad' => 'required',
    ];

    public $mensajes = [
        'nombre.required' => 'Este campo es obligatorio',
        'nombre.min' => 'Debes ingressar al menos 4 carácteres',
        'apellidos.required' => 'Este campo es obligatorio',
        'apellidos.min' => 'Debes ingresar al menos 4 carácteres',
        'fono.required' => 'Este campo es obligatorio',
        'ci.required' => 'Este campo es obligatorio',
        'ci.numeric' => 'Debes ingresar un valor númerico',
        'ci.unique' => 'Este número de C.I. ya fue registrado',
        'ci_exp.required' => 'Este campo es obligatorio',
        'dir.required' => 'Este campo es obligatorio',
        'dir.min' => 'Debes ingresar al menos 4 carácteres',
        'tipo.required' => 'Este campo es obligatorio',
        'correo.required' => 'Este campo es obligatorio',
        'correo.unique' => 'Este correo no esta disponible',
        'password.required' => 'Este campo es obligatorio',
        'password.min' => 'Debes ingresar al menos :min carácteres',
    ];
    public function index(Request $request)
    {
        $profesors = Profesor::with(["user"])->get();
        return response()->JSON(['profesors' => $profesors, 'total' => count($profesors)], 200);
    }

    public function store(Request $request)
    {
        if ($request->hasFile('foto')) {
            $this->validacion['foto'] = 'image|mimes:jpeg,jpg,png|max:2048';
        }

        $this->validacion['correo'] = 'required|unique:users,correo';
        $this->validacion['password'] = 'required|min:6';

        $request->validate($this->validacion, $this->mensajes);

        $request['fecha_registro'] = date('Y-m-d');
        DB::beginTransaction();
        try {
            // crear usuario
            $nuevo_usuario = User::create([
                "usuario" => $request->correo,
                "nombre" => $request->nombres,
                "paterno" => $request->apellidos,
                "dir" => $request->dir ? $request->dir : "",
                "correo" => $request->correo,
                "fono" => $request->fono,
                "password" => Hash::make($request->password),
                "tipo" => "PROFESOR",
                "acceso" => $request->acceso,
                "fecha_registro" => date("Y-m-d")
            ]);
            if ($request->hasFile('foto')) {
                $file = $request->foto;
                $nom_foto = time() . '_' . $nuevo_usuario->id . '.' . $file->getClientOriginalExtension();
                $nuevo_usuario->foto = $nom_foto;
                $file->move(public_path() . '/imgs/users/', $nom_foto);
            }
            $nuevo_usuario->save();

            // crear el Profesor
            $request['user_id'] = $nuevo_usuario->id;
            $nuevo_profesor = Profesor::create(array_map('mb_strtoupper', $request->except('foto')));
            $nuevo_profesor->correo = $request->correo;
            $nuevo_profesor->save();
            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_profesor, "profesors");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->profesor . ' REGISTRO UN PROFESOR',
                'datos_original' => $datos_original,
                'modulo' => 'PROFESORES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'profesor' => $nuevo_profesor,
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

    public function update(Request $request, Profesor $profesor)
    {
        if ($request->hasFile('foto')) {
            $this->validacion['foto'] = 'image|mimes:jpeg,jpg,png|max:2048';
        }
        $this->validacion['correo'] = 'required|unique:users,correo,' . $profesor->user->id;

        if (trim($request->password) != '') {
            $this->validacion['password'] = 'required|min:6';
        } else {
            unset($request["password"]);
        }
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // modificar usuario
            $usuario = User::findOrFail($profesor->user_id);
            $usuario->usuario = $request->correo;
            $usuario->correo = $request->correo;
            if (trim($request->password) != '') {
                $usuario->password = Hash::make($usuario->password);
            }

            if ($request->hasFile('foto')) {
                $antiguo = $usuario->foto;
                if ($antiguo != 'default.png') {
                    \File::delete(public_path() . '/imgs/users/' . $antiguo);
                }
                $file = $request->foto;
                $nom_foto = time() . '_' . $usuario->id . '.' . $file->getClientOriginalExtension();
                $usuario->foto = $nom_foto;
                $file->move(public_path() . '/imgs/users/', $nom_foto);
            }
            $usuario->save();

            // MODIFICAR PROFESOR
            $datos_original = HistorialAccion::getDetalleRegistro($profesor, "profesors");
            $profesor->update(array_map('mb_strtoupper', $request->except('foto')));
            $profesor->correo = $request->correo;
            $profesor->save();
            $datos_nuevo = HistorialAccion::getDetalleRegistro($profesor, "profesors");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->profesor . ' MODIFICÓ UN PROFESOR',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'PROFESORES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'profesor' => $profesor,
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

    public function show(Profesor $profesor)
    {
        return response()->JSON([
            'sw' => true,
            'profesor' => $profesor
        ], 200);
    }
    public function destroy(Profesor $profesor)
    {
        DB::beginTransaction();
        try {
            $usuario = User::findOrFail($profesor->user_id);
            // elimianr el profesor
            $datos_original = HistorialAccion::getDetalleRegistro($profesor, "profesors");
            $profesor->delete();

            // eliminar el usuario 
            $antiguo = $usuario->foto;
            if ($antiguo != 'default.png') {
                \File::delete(public_path() . '/imgs/users/' . $antiguo);
            }
            $usuario->delete();

            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->profesor . ' ELIMINÓ UN PROFESOR',
                'datos_original' => $datos_original,
                'modulo' => 'PROFESORES',
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
