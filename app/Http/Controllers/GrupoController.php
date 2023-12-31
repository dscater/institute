<?php

namespace App\Http\Controllers;

use App\Models\AsignacionGrupo;
use App\Models\Comunicado;
use App\Models\Grupo;
use App\Models\GrupoProfesor;
use App\Models\GrupoRecurso;
use App\Models\HistorialAccion;
use App\Models\Horario;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GrupoController extends Controller
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
        $grupos = Grupo::orderBy("id", "desc")->get();
        return response()->JSON(['grupos' => $grupos, 'total' => count($grupos)], 200);
    }

    public function activos()
    {
        $grupos = Grupo::where("estado", "ACTIVO")->orderBy("id", "desc")->get();
        return response()->JSON(['grupos' => $grupos, 'total' => count($grupos)], 200);
    }

    public function grupo_users()
    {
        $grupos = [];
        $user = Auth::user();
        $tipo_user = $user->tipo;
        if ($tipo_user == 'ADMINISTRADOR') {
            $grupos = Grupo::where("estado", "ACTIVO")->orderBy("id", "desc")->get();
        }
        if ($tipo_user == 'PROFESOR') {
            $id_grupos_user = GrupoProfesor::where("user_id", $user->id)->pluck("grupo_id");
            $grupos = Grupo::whereIn("id", $id_grupos_user)->where("estado", "ACTIVO")->orderBy("id", "desc")->get();
        }

        if ($tipo_user == 'ESTUDIANTE') {
        }
        return response()->JSON(['grupos' => $grupos, 'total' => count($grupos)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el Grupo
            $request["fecha_registro"] = date("Y-m-d");
            $nuevo_grupo = Grupo::create(array_map('mb_strtoupper', $request->all()));

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_grupo, "grupos");
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
                'grupo' => $nuevo_grupo,
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

    public function show(Grupo $grupo)
    {
        return response()->JSON([
            "grupo" => $grupo->load(["asignacion_grupos.inscripcion", "asignacion_grupos.inscripcion_solicitud.inscripcion_examen.examen_nivelacion", "asignacion_grupos.inscripcion_solicitud.curso", "grupo_profesor.profesor.user"])
        ], 200);
    }

    public function update(Request $request, Grupo $grupo)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($grupo, "grupos");
            $grupo->update(array_map('mb_strtoupper', $request->all()));

            $datos_nuevo = HistorialAccion::getDetalleRegistro($grupo, "grupos");
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
                'grupo' => $grupo,
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

    public function actualiza_link(Request $request, Grupo $grupo)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($grupo, "grupos");
            $grupo->update([
                "link_reunion" => $request->link_reunion
            ]);

            $datos_nuevo = HistorialAccion::getDetalleRegistro($grupo, "grupos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ACTUALIZÓ EL LINK DE UN GRUPO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'GRUPOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'grupo' => $grupo,
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
    public function destroy(Grupo $grupo)
    {
        DB::beginTransaction();
        try {
            $existe_registros = AsignacionGrupo::where("grupo_id", $grupo->id)->get();
            if (count($existe_registros) > 0) {
                throw new Exception("No es posible eliminar el grupo porque tiene registros en Asignaciones de Grupos");
            }
            $existe_registros = Comunicado::where("grupo_id", $grupo->id)->get();
            if (count($existe_registros) > 0) {
                throw new Exception("No es posible eliminar el grupo porque tiene comunicados");
            }
            $existe_registros = GrupoProfesor::where("grupo_id", $grupo->id)->get();
            if (count($existe_registros) > 0) {
                throw new Exception("No es posible eliminar el grupo porque existen profesores asignados a este");
            }
            $existe_registros = GrupoRecurso::where("grupo_id", $grupo->id)->get();
            if (count($existe_registros) > 0) {
                throw new Exception("No es posible eliminar el grupo porque tiene recursos existentes");
            }
            $existe_registros = Horario::where("grupo_id", $grupo->id)->get();
            if (count($existe_registros) > 0) {
                throw new Exception("No es posible eliminar el grupo porque tiene un horario registrado");
            }

            $datos_original = HistorialAccion::getDetalleRegistro($grupo, "grupos");
            $grupo->delete();
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
