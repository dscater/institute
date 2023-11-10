<?php

namespace App\Http\Controllers;

use App\Models\Comunicado;
use App\Models\Grupo;
use App\Models\GrupoProfesor;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ComunicadoController extends Controller
{
    public $validacion = [
        'grupo_id' => 'required',
        'titulo' => 'required',
        'descripcion' => 'required',
    ];

    public $mensajes = [
        'grupo_id.required' => 'Este campo es obligatorio',
        'titulo.required' => 'Este campo es obligatorio',
        'descripcion.required' => 'Este campo es obligatorio',
    ];

    public function index(Request $request)
    {
        $comunicados = Comunicado::with(["grupo"])->orderBy("id", "desc")->get();
        $user = Auth::user();
        $tipo_user = $user->tipo;
        if ($tipo_user == 'PROFESOR') {
            $id_grupos_user = GrupoProfesor::where("user_id", $user->id)->pluck("grupo_id");
            $comunicados = Comunicado::with(["grupo"])->whereIn("grupo_id", $id_grupos_user)->orderBy("id", "desc")->get();
        }
        if ($tipo_user == 'ESTUDIANTE') {
        }

        return response()->JSON(['comunicados' => $comunicados, 'total' => count($comunicados)], 200);
    }

    public function getComunicadosGrupo(Grupo $grupo)
    {
        return response()->JSON($grupo->comunicados);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el Comunicado
            $request["fecha"] = date("Y-m-d");
            $request["hora"] = date("H:i");
            $nuevo_comunicado = Comunicado::create(array_map('mb_strtoupper', $request->all()));

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_comunicado, "comunicados");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UN GRUPO',
                'datos_original' => $datos_original,
                'modulo' => 'GRUPOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'comunicado' => $nuevo_comunicado,
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

    public function show(Comunicado $comunicado)
    {
        return response()->JSON([
            "comunicado" => $comunicado
        ], 200);
    }

    public function update(Request $request, Comunicado $comunicado)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($comunicado, "comunicados");
            $comunicado->update(array_map('mb_strtoupper', $request->all()));

            $datos_nuevo = HistorialAccion::getDetalleRegistro($comunicado, "comunicados");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN GRUPO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'GRUPOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'comunicado' => $comunicado,
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
    public function destroy(Comunicado $comunicado)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($comunicado, "comunicados");
            $comunicado->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UN GRUPO',
                'datos_original' => $datos_original,
                'modulo' => 'GRUPOS',
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
