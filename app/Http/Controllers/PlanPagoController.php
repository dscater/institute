<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\PlanPago;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PlanPagoController extends Controller
{

    public $validacion = [
        'plan_mensual' => 'required',
        'plan_mensual.titulo' => 'required',
        'plan_mensual.costo' => 'required',
        'plan_mensual.detalles' => 'required',
        'plan_trimestral' => 'required',
        'plan_trimestral.titulo' => 'required',
        'plan_trimestral.costo' => 'required',
        'plan_trimestral.detalles' => 'required',
        'plan_anual' => 'required',
        'plan_anual.titulo' => 'required',
        'plan_anual.costo' => 'required',
        'plan_anual.detalles' => 'required',
    ];

    public $mensajes = [
        'plan_mensual.required' => 'Este campo es obligatorio',
        'plan_mensual.titulo.required' => 'Este campo es obligatorio',
        'plan_mensual.costo.required' => 'Este campo es obligatorio',
        'plan_mensual.detalles.required' => 'Este campo es obligatorio',
        'plan_trimestral.required' => 'Este campo es obligatorio',
        'plan_trimestral.titulo.required' => 'Este campo es obligatorio',
        'plan_trimestral.costo.required' => 'Este campo es obligatorio',
        'plan_trimestral.detalles.required' => 'Este campo es obligatorio',
        'plan_anual.required' => 'Este campo es obligatorio',
        'plan_anual.titulo.required' => 'Este campo es obligatorio',
        'plan_anual.costo.required' => 'Este campo es obligatorio',
        'plan_anual.detalles.required' => 'Este campo es obligatorio',
    ];

    public function index(Request $request)
    {
        $plan_mensual = PlanPago::where("id", 1)->get()->first();
        $plan_trimestral = PlanPago::where("id", 2)->get()->first();
        $plan_anual = PlanPago::where("id", 3)->get()->first();
        return response()->JSON(['plan_mensual' => $plan_mensual, 'plan_trimestral' => $plan_trimestral, 'plan_anual' => $plan_anual], 200);
    }

    public function store(Request $request)
    {
        $planMensualDetalles = nl2br($request["plan_mensual"]["detalles"]);
        $planTrimestralDetalles = nl2br($request["plan_trimestral"]["detalles"]);
        $planAnualDetalles = nl2br($request["plan_anual"]["detalles"]);

        $request->merge([
            'plan_mensual' => array_merge($request->get('plan_mensual'), ['detalles' => $planMensualDetalles]),
            'plan_trimestral' => array_merge($request->get('plan_trimestral'), ['detalles' => $planTrimestralDetalles]),
            'plan_anual' => array_merge($request->get('plan_anual'), ['detalles' => $planAnualDetalles]),
        ]);
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el Plan de Pago
            $plan_mensual = PlanPago::where("id", 1)->get()->first();
            $plan_trimestral = PlanPago::where("id", 2)->get()->first();
            $plan_anual = PlanPago::where("id", 3)->get()->first();

            // MENSUAL
            if (!$plan_mensual) {
                $plan_mensual = PlanPago::create($request->plan_mensual);
            } else {
                $plan_mensual->update($request->plan_mensual);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($plan_mensual, "plan_pagos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ACTUALIZÓ EL PLAN DE PAGOS MENSUAL',
                'datos_original' => $datos_original,
                'modulo' => 'PLAN DE PAGOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            // TRIMESTRAL
            if (!$plan_trimestral) {
                $plan_trimestral = PlanPago::create($request->plan_trimestral);
            } else {
                $plan_trimestral->update($request->plan_trimestral);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($plan_trimestral, "plan_pagos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL',
                'datos_original' => $datos_original,
                'modulo' => 'PLAN DE PAGOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            // ANUAL
            if (!$plan_anual) {
                $plan_anual = PlanPago::create($request->plan_anual);
            } else {
                $plan_anual->update($request->plan_anual);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($plan_anual, "plan_pagos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ACTUALIZÓ EL PLAN DE PAGOS ANUAL',
                'datos_original' => $datos_original,
                'modulo' => 'PLAN DE PAGOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'plan_mensual' => $plan_mensual,
                'plan_trimestral' => $plan_trimestral,
                'plan_anual' => $plan_anual,
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
