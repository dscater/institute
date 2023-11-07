<?php

namespace App\Http\Controllers;

use App\Models\GestoriaSolicitud;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GestoriaSolicitudController extends Controller
{


    public function registrar_solicitud(Request $request)
    {
        $gestoria_validate = [
            "nombres" => "required|min:4",
            "apellidos" => "required|min:4",
            "fecha_nac" => "required|date",
            "edad" => "required|numeric",
            "nacionalidad" => "required|min:4",
            "sexo" => "required",
            "fono" => "required",
            "familiares_eeuu" => "required",
            "familiar_deportado" => "required",
            "deportado_otro_pais" => "required",
            "antecedentes_penales" => "required",
            "estudios" => "required",
            "trabajo_actual" => "required",
            "solicito_visa" => "required",
            "cuenta_bancaria" => "required",
            "gana_aproximadamente" => "required|numeric|min:0",
            "redes_sociales" => "required",
            "correo" => "required|email|unique:inscripcions,correo",
            "recomendado_por" => "required",
        ];

        $mensajes = [
            "nombres.required" => "Debes ingresar tu Nombre",
            "nombres.min" => "Tu Nombre debe tener al menos :min caracteres",
            "apellidos.required" => "Debes ingresar tus Apellidos",
            "apellidos.min" => "Tu Apellido debe tener al menos :min caracteres",
            "fecha_nac.required" => "Debes ingresar una fecha de nacimiento",
            "fecha_nac.date" => "Debes ingresar una fecha de nacimiento valida",
            "nacionalidad.required" => "Debes ingresar una nacionalidad",
            "nacionalidad.min" => "El campo nacionalidad debe tener al menos :min caracteres",
            "fono.required" => "Debes ingresar un número de celular",
            "familiares_eeuu.required" => "Debes indicar si tienes un familiar en Estados Unidos",
            "familiar_deportado.required" => "Debes indicar si algun familiar fue deportado de Estados Unidos",
            "deportado_otro_pais.required" => "Debes indicar si fue deportado de otro país",
            "antecedentes_penales.required" => "Debes indicar si tiene antecedentes penales",
            "estudios.required" => "Debes indicar tus estudios",
            "trabajo_actual.required" => "Debes indicar tu trabajo actual",
            "solicito_visa.required" => "Debes indicar si alguna vez solicito la visa de Estados Unidos",
            "cuenta_bancaria.required" => "Debes indicar si tienes una cuenta bancaria",
            "gana_aproximadamente.required" => "Debes indicar cuanto ganas aproximadamente",
            "gana_aproximadamente.numeric" => "Debes ingresar un valor númerico valido de cuanto ganas aproximadamente",
            "gana_aproximadamente.min" => "Debes ingresar un valor mayor a :min de cuanto ganas aproximadamente",
            "redes_sociales.required" => "Debes indicar tus redes sociales",
            "fono.required" => "Debes ingresar un número de celular",
            "correo.required" => "Debes ingresar un Email",
            "correo.email" => "El Email que ingresaste no es un correo valido",
            "correo.unique" => "El correo que ingreasaste ya se encuentra registrado",
            "recomendado_por.required" => "Debes indicar quién le recomendo nuestro servicio de gestoría",
            "parentesco.required" => "Debes indicar el parentesco del familiar",
            "motivo.required" => "Debes indicar el motivo por el que fue deportado de Estados Unidos",
            "motivo_otro_pais.required" => "Debes indicar el motivo por el que fue deportado de otro país",
            "desc_antecedentes.required" => "Debes indicar describir el antecedente penal(OTRO)",
            "motivo_rechazo.required" => "Debes indicar el motivo de rechazo de la anterior solicitud",
        ];


        if ($request->familiares_eeuu == "SI") {
            $gestoria_validate['parentesco'] = 'required';
        }

        if ($request->familiar_deportado == "SI") {
            $gestoria_validate['motivo'] = 'required';
        }

        if ($request->deportado_otro_pais == "SI") {
            $gestoria_validate['motivo_otro_pais'] = 'required';
        }

        if ($request->antecedentes_penales == "OTRO") {
            $gestoria_validate['desc_antecedentes'] = 'required';
        }

        if ($request->solicito_visa == "SI") {
            $gestoria_validate['motivo_rechazo'] = 'required';
        }

        $request->validate($gestoria_validate, $mensajes);


        DB::beginTransaction();
        try {
            $nueva_solicitud = GestoriaSolicitud::create([
                "nombres" => mb_strtoupper($request->nombres),
                "apellidos" => mb_strtoupper($request->apellidos),
                "fecha_nac" => $request->fecha_nac,
                "edad" => $request->edad,
                "nacionalidad" => mb_strtoupper($request->nacionalidad),
                "estado" => mb_strtoupper($request->estado),
                "sexo" => mb_strtoupper($request->sexo),
                "fono" => $request->fono,
                "familiares_eeuu" => $request->familiares_eeuu,
                "parentesco" => mb_strtoupper($request->parentesco),
                "familiar_deportado" => $request->familiar_deportado,
                "motivo" => mb_strtoupper($request->motivo),
                "deportado_otro_pais" => $request->deportado_otro_pais,
                "motivo_otro_pais" => mb_strtoupper($request->motivo_otro_pais),
                "antecedentes_penales" => $request->antecedentes_penales,
                "desc_antecedentes" => mb_strtoupper($request->desc_antecedentes),
                "estudios" => nl2br(mb_strtoupper($request->estudios)),
                "trabajo_actual" => nl2br(mb_strtoupper($request->trabajo_actual)),
                "solicito_visa" => $request->solicito_visa,
                "motivo_rechazo" => nl2br(mb_strtoupper($request->motivo_rechazo)),
                "cuenta_bancaria" => mb_strtoupper($request->cuenta_bancaria),
                "gana_aproximadamente" => $request->gana_aproximadamente,
                "redes_sociales" => nl2br(mb_strtoupper($request->redes_sociales)),
                "correo" => $request->correo,
                "recomendado_por" => nl2br(mb_strtoupper($request->recomendado_por)),
                "estado_solicitud" => "PENDIENTE"
            ]);

            $nueva_solicitud->codigo = "S." . $nueva_solicitud->id;
            $nueva_solicitud->save();
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

    public function index(Request $request)
    {
        $gestoria_solicituds = GestoriaSolicitud::orderBy("id", "desc")->get();
        return response()->JSON(['gestoria_solicituds' => $gestoria_solicituds, 'total' => count($gestoria_solicituds)], 200);
    }

    public function show(GestoriaSolicitud $gestoria_solicitud)
    {
        return response()->JSON([
            "gestoria_solicitud" => $gestoria_solicitud
        ], 200);
    }

    public function update(GestoriaSolicitud $gestoria_solicitud, Request $request)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($gestoria_solicitud, "gestoria_solicituds");
            $gestoria_solicitud->update(array_map('mb_strtoupper', $request->all()));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($gestoria_solicitud, "gestoria_solicituds");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' CAMBIO EL ESTADO DE UNA SOLICITUD DE GESTORÍA',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'GESTORÍA SOLICITUDES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'gestoria_solicitud' => $gestoria_solicitud,
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
}
