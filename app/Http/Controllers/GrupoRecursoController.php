<?php

namespace App\Http\Controllers;

use App\Models\GrupoProfesor;
use App\Models\GrupoRecurso;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GrupoRecursoController extends Controller
{
    public $validacion = [
        'grupo_id' => 'required',
        'titulo' => 'required',
        'link' => 'required',
    ];

    public $mensajes = [
        'grupo_id.required' => 'Este campo es obligatorio',
        'titulo.required' => 'Este campo es obligatorio',
        'link.required' => 'Este campo es obligatorio',
    ];

    public function index(Request $request)
    {

        $grupo_recursos = [];
        $user = Auth::user();
        $tipo_user = $user->tipo;
        if ($tipo_user == 'ADMINISTRADOR') {
            $grupo_recursos = GrupoRecurso::with(["grupo"])->orderBy("id", "desc")->get();
        }
        if ($tipo_user == 'PROFESOR') {
            $id_grupos_user = GrupoProfesor::where("user_id", $user->id)->pluck("grupo_id");
            $grupo_recursos = GrupoRecurso::with(["grupo"])->whereIn("id", $id_grupos_user)->orderBy("id", "desc")->get();
        }

        if ($tipo_user == 'ESTUDIANTE') {
        }
        return response()->JSON(['grupo_recursos' => $grupo_recursos, 'total' => count($grupo_recursos)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $request["fecha"] = date("Y-m-d");
            $request["hora"] = date("H:i");
            $nuevo_grupo_recurso = GrupoRecurso::create(array_map('mb_strtoupper', $request->all()));
            $nuevo_grupo_recurso->link = $request->link;
            $nuevo_grupo_recurso->save();
            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_grupo_recurso, "grupo_recursos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO RECURSO',
                'datos_original' => $datos_original,
                'modulo' => 'RECURSOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'grupo_recurso' => $nuevo_grupo_recurso,
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

    public function show(GrupoRecurso $grupo_recurso)
    {
        return response()->JSON([
            "grupo_recurso" => $grupo_recurso
        ], 200);
    }

    public function update(Request $request, GrupoRecurso $grupo_recurso)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($grupo_recurso, "grupo_recursos");
            $grupo_recurso->update(array_map('mb_strtoupper', $request->all()));
            $grupo_recurso->link = $request->link;
            $grupo_recurso->save();

            $datos_nuevo = HistorialAccion::getDetalleRegistro($grupo_recurso, "grupo_recursos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ RECURSO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'RECURSOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'grupo_recurso' => $grupo_recurso,
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
    public function destroy(GrupoRecurso $grupo_recurso)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($grupo_recurso, "grupo_recursos");
            $grupo_recurso->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ RECURSO',
                'datos_original' => $datos_original,
                'modulo' => 'RECURSOS',
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
