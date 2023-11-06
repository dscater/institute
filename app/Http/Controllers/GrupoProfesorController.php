<?php

namespace App\Http\Controllers;

use App\Models\Grupo;
use App\Models\GrupoProfesor;
use App\Models\HistorialAccion;
use App\Models\Profesor;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GrupoProfesorController extends Controller
{
    public $validacion = [
        'grupo_id' => 'required',
        'profesor_id' => 'required',
    ];

    public $mensajes = [
        'grupo_id.required' => 'Este campo es obligatorio',
        'profesor_id.required' => 'Este campo es obligatorio',
    ];

    public function index(Request $request)
    {
        $grupo_profesors = GrupoProfesor::with(["grupo", "user", "profesor"])->orderBy("id", "desc")->get();
        return response()->JSON(['grupo_profesors' => $grupo_profesors, 'total' => count($grupo_profesors)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // VALIDAR ASIGNACION DEL PROFESOR EN EL MISMO GRUPO
            $profesor = Profesor::findOrFail($request->profesor_id);
            $grupo = Grupo::findOrFail($request->grupo_id);
            $existe_asignacion_grupo = GrupoProfesor::where("profesor_id", $request->profesor_id)->where("grupo_id", $request->grupo_id)->get()->first();
            if ($existe_asignacion_grupo) {
                throw new Exception("El profesor " . $profesor->full_name . " ya fue asignado al grupo " . $grupo->nombre);
            }
            // crear el GrupoProfesor
            $request["fecha_registro"] = date("Y-m-d");
            $request["user_id"] = $profesor->user_id;
            $nuevo_grupo_profesor = GrupoProfesor::create(array_map('mb_strtoupper', $request->all()));
            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_grupo_profesor, "grupo_profesors");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UNA ASIGNACIÓN DE PROFESOR',
                'datos_original' => $datos_original,
                'modulo' => 'GRUPO PROFESOR',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'grupo_profesor' => $nuevo_grupo_profesor,
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

    public function show(GrupoProfesor $grupo_profesor)
    {
        return response()->JSON([
            "grupo_profesor" => $grupo_profesor
        ], 200);
    }

    public function update(Request $request, GrupoProfesor $grupo_profesor)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $profesor = Profesor::findOrFail($request->profesor_id);
            $grupo = Grupo::findOrFail($request->grupo_id);
            $existe_asignacion_grupo = GrupoProfesor::where("profesor_id", $request->profesor_id)->where("grupo_id", $request->grupo_id)
                ->where("id", "!=", $grupo_profesor->id)->get()->first();
            if ($existe_asignacion_grupo) {
                throw new Exception("El profesor " . $profesor->full_name . " ya fue asignado al grupo " . $grupo->nombre);
            }

            $request["user_id"] = $profesor->user_id;
            $datos_original = HistorialAccion::getDetalleRegistro($grupo_profesor, "grupo_profesors");
            $grupo_profesor->update(array_map('mb_strtoupper', $request->all()));

            $datos_nuevo = HistorialAccion::getDetalleRegistro($grupo_profesor, "grupo_profesors");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UNA ASIGNACIÓN DE PROFESOR',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'GRUPO PROFESOR',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'grupo_profesor' => $grupo_profesor,
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
    public function destroy(GrupoProfesor $grupo_profesor)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($grupo_profesor, "grupo_profesors");
            $grupo_profesor->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UNA ASIGNACIÓN DE PROFESOR',
                'datos_original' => $datos_original,
                'modulo' => 'GRUPO PROFESOR',
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
