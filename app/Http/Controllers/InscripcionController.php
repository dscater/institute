<?php

namespace App\Http\Controllers;

use App\Models\Inscripcion;
use App\Models\InscripcionSolicitud;
use App\Models\PlanPago;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class InscripcionController extends Controller
{

    public function registrar_inscripcion(Request $request)
    {
        $inscripcion_validate = [
            'password' => 'required|min:8|confirmed',
            "nombres" => "required|min:4",
            "apellidos" => "required|min:4",
            "nro_iden" => "required|min:4",
            "fecha_nac" => "required|date",
            "edad" => "required|numeric",
            "pais_residencia" => "required|min:4",
            "nacionalidad" => "required|min:4",
            "prov_dpto" => "required|min:4",
            "sexo" => "required",
            "fono" => "required",
            "correo" => "required|email|unique:inscripcions,correo",
            "curso_id" => "required",
            "nivel" => "required",
            "se_entero" => "required",
            "plan_pago_id" => "required",
            "forma_pago" => "required",
            "desc_pago" => "required|min:4",
        ];

        $mensajes = [
            "nombres.required" => "Debes ingresar tu Nombre",
            "nombres.min" => "Tu Nombre debe tener al menos :min caracteres",
            "apellidos.required" => "Debes ingresar tus Apellidos",
            "apellidos.min" => "Tu Apellido debe tener al menos :min caracteres",
            "nro_iden.required" => "Debes ingresar tu Nro. Identificación(CI/DNI)",
            "nro_iden.min" => "El Nro. Identificación(CI/DNI) debe tener al menos :min caracteres",
            "password.required" => "Debes ingresar una contraseña",
            "password.min" => "La contraseña debe tener al menos :min caracteres",
            'password.confirmed' => 'La confirmación de la contraseña no coincide',
            "nro_iden.min" => "Debes ingresar al menos :min caracteres",
            "fecha_nac.required" => "Debes ingresar una fecha de nacimiento",
            "fecha_nac.date" => "Debes ingresar una fecha de nacimiento valida",
            "pais_residencia.required" => "Debes ingresar un País de residencia",
            "pais_residencia.min" => "El país de residencia debe tener al menos :min caracteres",
            "nacionalidad.required" => "Debes ingresar una nacionalidad",
            "nacionalidad.min" => "El campo nacionalidad debe tener al menos :min caracteres",
            "prov_dpto.required" => "Debes ingresar una Provincia/Departamento",
            "prov_dpto.min" => "El campo Provincia/Departamento debe tener al menos :min caracteres",
            "fono.required" => "Debes ingresar un número de celular",
            "correo.required" => "Debes ingresar un Email",
            "correo.email" => "El Email que ingresaste no es un correo valido",
            "correo.unique" => "El correo que ingreasaste ya se encuentra registrado",
            "curso_id.required" => "Debes seleccionar un curso",
            "nivel.required" => "Debes seleccionar el nivel en el que te encuentras",
            "se_entero.required" => "Debes seleccionar una opción de como te enteraste",
            "desc_se_entero.required" => "Debes complentar el campo Describir otro (Como se entero del Curso)",
            "desc_se_entero.min" => "El campo Describir otro (Como se entero del Curso) debe tener al menos :min caracteres",
            "plan_pago_id.required" => "Debes seleccionar un plan de pago",
            "forma_pago.required" => "Debes seleccionar una forma de pago",
            "archivo_pago.max" => "El peso maximo permitido del archivo es de 4096 KB",
            "desc_pago.required" => "Debes completar la descripción de la forma de pago",
            "desc_pago.min" => "La descripción de la forma de pago debe tener al menos :min caracteres",
            "desc_otro_pago.required" => "Tienes que describir la forma de pago(OTRO)",
            "desc_otro_pago.min" => "La descripción de forma de pago(OTRO) debe tener al menos :min caracteres",
        ];

        if ($request->hasFile("archivo_pago")) {
            $inscripcion_validate['archivo_pago'] = 'file|max:4096';
        }

        if ($request->se_entero == "OTRO") {
            $inscripcion_validate['desc_se_entero'] = 'required|min:4';
        }

        if ($request->forma_pago == "OTRO") {
            $inscripcion_validate['desc_otro_pago'] = 'required|min:4';
        }

        $request->validate($inscripcion_validate, $mensajes);


        DB::beginTransaction();
        try {

            $nuevo_usuario = User::create([
                "usuario" => $request->correo,
                "nombre" => mb_strtoupper($request->nombres),
                "paterno" => mb_strtoupper($request->apellidos),
                "dir" => mb_strtoupper($request->prov_dpto . ' - ' . $request->pais_residencia),
                "correo" => $request->correo,
                "fono" => $request->fono,
                "password" => Hash::make($request->password),
                "tipo" => "ESTUDIANTE",
                "acceso" => 1,
                "fecha_registro" => date("Y-m-d")
            ]);

            $nueva_inscripcion = Inscripcion::create([
                "user_id" => $nuevo_usuario->id,
                "nombres" => mb_strtoupper($request->nombres),
                "apellidos" => mb_strtoupper($request->apellidos),
                "nro_iden" => mb_strtoupper($request->nro_iden),
                "fecha_nac" => $request->fecha_nac,
                "edad" => $request->edad,
                "pais_residencia" => mb_strtoupper($request->pais_residencia),
                "nacionalidad" => mb_strtoupper($request->nacionalidad),
                "prov_dpto" => mb_strtoupper($request->prov_dpto),
                "sexo" => mb_strtoupper($request->sexo),
                "fono" => $request->fono,
                "correo" => $request->correo,
            ]);

            $plan_pago = PlanPago::findOrFail($request->plan_pago_id);

            $nueva_solicitud = InscripcionSolicitud::create([
                "inscripcion_id" => $nueva_inscripcion->id,
                "curso_id" => $request->curso_id,
                "nivel" => $request->nivel,
                "se_entero" => mb_strtoupper($request->se_entero),
                "desc_se_entero" => mb_strtoupper($request->desc_se_entero),
                "plan_pago_id" => $request->plan_pago_id,
                "plan_costo" => $plan_pago->costo,
                "forma_pago" => mb_strtoupper($request->forma_pago),
                "estado_asignado" => "NO",
                "estado" => "PENDIENTE"
            ]);

            if ($request->hasFile("archivo_pago")) {
                $file = $request->archivo_pago;
                $nom_archivo_pago = time() . '_' . $nueva_solicitud->id . '.' . $file->getClientOriginalExtension();
                $nueva_solicitud->archivo_pago = $nom_archivo_pago;
                $file->move(public_path() . '/files/', $nom_archivo_pago);
            }

            DB::commit();
            return response()->JSON([
                'sw' => true,
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
