<?php

namespace App\Http\Controllers;

use App\Models\Curso;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CursoController extends Controller
{
    public $validacion = [
        'nombre' => 'required',
        'descripcion' => 'required',
    ];

    public $mensajes = [
        'nombre.required' => 'Este campo es obligatorio',
        'descripcion.required' => 'Este campo es obligatorio',
    ];

    public function index(Request $request)
    {
        $cursos = Curso::orderBy("id", "desc")->get();
        return response()->JSON(['cursos' => $cursos, 'total' => count($cursos)], 200);
    }


    public function listaCursos(Request $request)
    {
        $texto = $request->texto;
        $per_page = 4;
        $cursos = Curso::orderBy("id", "desc")->paginate($per_page);
        return response()->JSON(['cursos' => $cursos, 'per_page' => $per_page, 'total' => count($cursos)], 200);
    }

    public function getCursosDestacados()
    {
        // FILTRAR LOS CURSOS CON MAS GRUPOS ASIGNADOS
        $cursos = Curso::orderBy("id", "desc")->get()->take(6); //pendiente
        return response()->JSON(['cursos' => $cursos, 'total' => count($cursos)], 200);
    }

    public function store(Request $request)
    {
        if ($request->hasFile('imagen')) {
            $this->validacion['imagen'] = 'image|mimes:jpeg,jpg,png|max:4096';
        }
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el Curso
            $request["fecha_registro"] = date("Y-m-d");
            $nuevo_curso = Curso::create(array_map('mb_strtoupper', $request->except("imagen")));
            if ($request->hasFile('imagen')) {
                $file = $request->imagen;
                $nom_imagen = time() . '_' . $nuevo_curso->id . '.' . $file->getClientOriginalExtension();
                $nuevo_curso->imagen = $nom_imagen;
                $file->move(public_path() . '/imgs/cursos/', $nom_imagen);
            }
            $nuevo_curso->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_curso, "cursos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UN CURSO',
                'datos_original' => $datos_original,
                'modulo' => 'CURSOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'curso' => $nuevo_curso,
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

    public function update(Request $request, Curso $curso)
    {
        if ($request->hasFile('imagen')) {
            $this->validacion['imagen'] = 'image|mimes:jpeg,jpg,png|max:4096';
        }
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($curso, "cursos");
            $curso->update(array_map('mb_strtoupper', $request->except("imagen")));
            if ($request->hasFile('imagen')) {
                $antiguo = $curso->imagen;
                if ($antiguo != 'default.png') {
                    \File::delete(public_path() . '/imgs/cursos/' . $antiguo);
                }
                $file = $request->imagen;
                $nom_imagen = time() . '_' . $curso->id . '.' . $file->getClientOriginalExtension();
                $curso->imagen = $nom_imagen;
                $file->move(public_path() . '/imgs/cursos/', $nom_imagen);
            }
            $curso->save();
            $datos_nuevo = HistorialAccion::getDetalleRegistro($curso, "cursos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN CURSO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'CURSOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'curso' => $curso,
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
    public function destroy(Curso $curso)
    {
        DB::beginTransaction();
        try {
            $antiguo = $curso->imagen;
            if ($antiguo != 'default.jpg') {
                \File::delete(public_path() . '/imgs/cursos/' . $antiguo);
            }

            $datos_original = HistorialAccion::getDetalleRegistro($curso, "cursos");
            $curso->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UN CURSO',
                'datos_original' => $datos_original,
                'modulo' => 'CURSOS',
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
