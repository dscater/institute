<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\InformacionPago;
use App\Models\PlanPago;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PlanPagoController extends Controller
{

    public $validacion = [
        'titulo_mensual' => 'required',
        'costo_mensual' => 'required',
        'detalles_mensual' => 'required',
        'titulo_trimestral' => 'required',
        'costo_trimestral' => 'required',
        'detalles_trimestral' => 'required',
        'titulo_anual' => 'required',
        'costo_anual' => 'required',
        'detalles_anual' => 'required',
        'descripcion_zelle' => 'required',
        'descripcion_western' => 'required',
        'descripcion_deposito' => 'required',
        'descripcion_mercado' => 'required',
        'descripcion_otros' => 'required',
    ];

    public $mensajes = [
        'titulo_mensual.required' => 'Debes completar el titulo del plan 1',
        'costo_mensual.required' => 'Debes ingresar el costo del plan 1',
        'detalles_mensual.required' => 'Debes ingresar los detalles del plan 1',
        'titulo_trimestral.required' => 'Debes completar el titulo del plan 2',
        'costo_trimestral.required' => 'Debes ingresar el costo del plan 2',
        'detalles_trimestral.required' => 'Debes ingresar los detalles del plan 2',
        'titulo_anual.required' => 'Debes completar el titulo del plan 3',
        'costo_anual.required' => 'Debes ingresar el costo del plan 3',
        'detalles_anual.required' => 'Debes ingresar los detalles del plan 3',
        'descripcion_zelle.required' => 'Debes ingresar la descripción de la forma de pago Zelle',
        'descripcion_western.required' => 'Debes ingresar la descripción de la forma de pago Western Union',
        'descripcion_deposito.required' => 'Debes ingresar la descripción de la forma de pago Depósito Bancario',
        'descripcion_mercado.required' => 'Debes ingresar la descripción de la forma de pago Mercado Pago',
        'descripcion_otros.required' => 'Debes ingresar la descripción de la forma de pago Otras formas de pago',
        "archivo_zelle.max" => "El archivo seleccionado en forma de pago Zelle supera el maximo permitido de :max KB",
        "archivo_western.max" => "El archivo seleccionado en forma de pago Western Union supera el maximo permitido de :max KB",
        "archivo_deposito.max" => "El archivo seleccionado en forma de pago Depósito Bancario supera el maximo permitido de :max KB",
        "archivo_mercado.max" => "El archivo seleccionado en forma de pago Mercado Pago supera el maximo permitido de :max KB",
    ];

    public function index(Request $request)
    {
        $plan_mensual = PlanPago::where("id", 1)->get()->first();
        $plan_trimestral = PlanPago::where("id", 2)->get()->first();
        $plan_anual = PlanPago::where("id", 3)->get()->first();

        $informacion_zelle = InformacionPago::where("forma_pago", "ZELLE")->get()->first();
        $informacion_western = InformacionPago::where("forma_pago", "WESTERN UNION")->get()->first();
        $informacion_deposito = InformacionPago::where("forma_pago", "DEPÓSITO BANCARIO")->get()->first();
        $informacion_mercado = InformacionPago::where("forma_pago", "MERCADO PAGO")->get()->first();
        $informacion_otros = InformacionPago::where("forma_pago", "OTRAS FORMAS DE PAGO")->get()->first();
        return response()->JSON([
            'plan_mensual' => $plan_mensual,
            'plan_trimestral' => $plan_trimestral,
            'plan_anual' => $plan_anual,
            'informacion_zelle' => $informacion_zelle,
            'informacion_western' => $informacion_western,
            'informacion_deposito' => $informacion_deposito,
            'informacion_mercado' => $informacion_mercado,
            'informacion_otros' => $informacion_otros,
        ], 200);
    }

    public function store(Request $request)
    {
        $planMensualDetalles = nl2br($request["detalles_mensual"]);
        $planTrimestralDetalles = nl2br($request["detalles_trimestral"]);
        $planAnualDetalles = nl2br($request["detalles_anual"]);
        $descripcion_zelle = nl2br($request["descripcion_zelle"]);
        $descripcion_western = nl2br($request["descripcion_western"]);
        $descripcion_deposito = nl2br($request["descripcion_deposito"]);
        $descripcion_mercado = nl2br($request["descripcion_mercado"]);
        $descripcion_otros = nl2br($request["descripcion_otros"]);
        // validar archivos formas de pago
        if ($request->hasFile("archivo_zelle")) {
            $this->validacion["archivo_zelle"] = "required|file|max:4096";
        }
        if ($request->hasFile("archivo_western")) {
            $this->validacion["archivo_western"] = "required|file|max:4096";
        }
        if ($request->hasFile("archivo_deposito")) {
            $this->validacion["archivo_deposito"] = "required|file|max:4096";
        }
        if ($request->hasFile("archivo_mercado")) {
            $this->validacion["archivo_mercado"] = "required|file|max:4096";
        }

        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el Plan de Pago
            $plan_mensual = PlanPago::where("id", 1)->get()->first();
            $plan_trimestral = PlanPago::where("id", 2)->get()->first();
            $plan_anual = PlanPago::where("id", 3)->get()->first();

            $informacion_zelle = InformacionPago::where("forma_pago", "ZELLE")->get()->first();
            $informacion_western = InformacionPago::where("forma_pago", "WESTERN UNION")->get()->first();
            $informacion_deposito = InformacionPago::where("forma_pago", "DEPÓSITO BANCARIO")->get()->first();
            $informacion_mercado = InformacionPago::where("forma_pago", "MERCADO PAGO")->get()->first();
            $informacion_otros = InformacionPago::where("forma_pago", "OTRAS FORMAS DE PAGO")->get()->first();

            // MENSUAL
            $datos_mensual = [
                "titulo" => $request["titulo_mensual"],
                "costo" => $request["costo_mensual"],
                "detalles" => $planMensualDetalles,
            ];
            if (!$plan_mensual) {
                $plan_mensual = PlanPago::create($datos_mensual);
            } else {
                $plan_mensual->update($datos_mensual);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($plan_mensual, "plan_pagos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ACTUALIZÓ EL PLAN DE PAGOS MENSUAL',
                'datos_original' => $datos_original,
                'modulo' => 'PLAN DE PAGOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            // TRIMESTRAL
            $datos_trimestral = [
                "titulo" => $request["titulo_trimestral"],
                "costo" => $request["costo_trimestral"],
                "detalles" => $planTrimestralDetalles,
            ];
            if (!$plan_trimestral) {
                $plan_trimestral = PlanPago::create($datos_trimestral);
            } else {
                $plan_trimestral->update($datos_trimestral);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($plan_trimestral, "plan_pagos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ACTUALIZÓ EL PLAN DE PAGOS TRIMESTRAL',
                'datos_original' => $datos_original,
                'modulo' => 'PLAN DE PAGOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            // ANUAL
            $datos_anual = [
                "titulo" => $request["titulo_anual"],
                "costo" => $request["costo_anual"],
                "detalles" => $planAnualDetalles,
            ];
            if (!$plan_anual) {
                $plan_anual = PlanPago::create($datos_anual);
            } else {
                $plan_anual->update($datos_anual);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($plan_anual, "plan_pagos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ACTUALIZÓ EL PLAN DE PAGOS ANUAL',
                'datos_original' => $datos_original,
                'modulo' => 'PLAN DE PAGOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            // INFORMACION DE PAGO zelle
            if (!$informacion_zelle) {
                $informacion_zelle = InformacionPago::create([
                    'forma_pago' => 'ZELLE',
                    "descripcion" => $descripcion_zelle,
                ]);
            } else {
                $informacion_zelle->update([
                    "descripcion" => $descripcion_zelle,
                ]);
            }

            if ($request->hasFile("archivo_zelle")) {

                $file = $request->file("archivo_zelle");
                $extension = $file->getClientOriginalExtension();
                $tipo = self::getTipoArchivo($extension);
                // validar tipo
                if ($tipo == 'otro') {
                    throw new Exception("El archivo que seleccionaste no esta permitido", 400);
                }

                $antiguo = $informacion_zelle->archivo;
                if ($antiguo && $antiguo != 'qr_institute.png') {
                    \File::delete(public_path() . "/files/" . $antiguo);
                }

                $nom_archivo = time() . '_' . $informacion_zelle->id . '.' . $file->getClientOriginalExtension();
                $informacion_zelle->archivo = $nom_archivo;
                $informacion_zelle->tipo_archivo = $tipo;
                $file->move(public_path() . '/files/', $nom_archivo);
            }
            $informacion_zelle->save();

            // INFORMACION DE PAGO western
            if (!$informacion_western) {
                $informacion_western = InformacionPago::create([
                    'forma_pago' => 'WESTERN UNION',
                    "descripcion" => $descripcion_western,
                ]);
            } else {
                $informacion_western->update([
                    "descripcion" => $descripcion_western,
                ]);
            }

            if ($request->hasFile("archivo_western")) {

                $file = $request->file("archivo_western");
                $extension = $file->getClientOriginalExtension();
                $tipo = self::getTipoArchivo($extension);
                // validar tipo
                if ($tipo == 'otro') {
                    throw new Exception("El archivo que seleccionaste no esta permitido", 400);
                }

                $antiguo = $informacion_western->archivo;
                if ($antiguo && $antiguo != 'qr_institute.png') {
                    \File::delete(public_path() . "/files/" . $antiguo);
                }

                $nom_archivo = time() . '_' . $informacion_western->id . '.' . $file->getClientOriginalExtension();
                $informacion_western->archivo = $nom_archivo;
                $informacion_western->tipo_archivo = $tipo;
                $file->move(public_path() . '/files/', $nom_archivo);
            }
            $informacion_western->save();

            // INFORMACION DE PAGO deposito
            if (!$informacion_deposito) {
                $informacion_deposito = InformacionPago::create([
                    'forma_pago' => 'DEPÓSITO BANCARIO',
                    "descripcion" => $descripcion_deposito,
                ]);
            } else {
                $informacion_deposito->update([
                    "descripcion" => $descripcion_deposito,
                ]);
            }

            if ($request->hasFile("archivo_deposito")) {

                $file = $request->file("archivo_deposito");
                $extension = $file->getClientOriginalExtension();
                $tipo = self::getTipoArchivo($extension);
                // validar tipo
                if ($tipo == 'otro') {
                    throw new Exception("El archivo que seleccionaste no esta permitido", 400);
                }

                $antiguo = $informacion_deposito->archivo;
                if ($antiguo && $antiguo != 'qr_institute.png') {
                    \File::delete(public_path() . "/files/" . $antiguo);
                }

                $nom_archivo = time() . '_' . $informacion_deposito->id . '.' . $file->getClientOriginalExtension();
                $informacion_deposito->archivo = $nom_archivo;
                $informacion_deposito->tipo_archivo = $tipo;
                $file->move(public_path() . '/files/', $nom_archivo);
            }
            $informacion_deposito->save();

            // INFORMACION DE PAGO mercado
            if (!$informacion_mercado) {
                $informacion_mercado = InformacionPago::create([
                    'forma_pago' => 'MERCADO PAGO',
                    "descripcion" => $descripcion_mercado,
                ]);
            } else {
                $informacion_mercado->update([
                    "descripcion" => $descripcion_mercado,
                ]);
            }

            if ($request->hasFile("archivo_mercado")) {

                $file = $request->file("archivo_mercado");
                $extension = $file->getClientOriginalExtension();
                $tipo = self::getTipoArchivo($extension);
                // validar tipo
                if ($tipo == 'otro') {
                    throw new Exception("El archivo que seleccionaste no esta permitido", 400);
                }

                $antiguo = $informacion_mercado->archivo;
                if ($antiguo && $antiguo != 'qr_institute.png') {
                    \File::delete(public_path() . "/files/" . $antiguo);
                }

                $nom_archivo = time() . '_' . $informacion_mercado->id . '.' . $file->getClientOriginalExtension();
                $informacion_mercado->archivo = $nom_archivo;
                $informacion_mercado->tipo_archivo = $tipo;
                $file->move(public_path() . '/files/', $nom_archivo);
            }
            $informacion_mercado->save();

            // INFORMACION DE PAGO otros
            if (!$informacion_otros) {
                $informacion_otros = InformacionPago::create([
                    'forma_pago' => 'OTRAS FORMAS DE PAGO',
                    "descripcion" => $descripcion_otros,
                ]);
            } else {
                $informacion_otros->update([
                    "descripcion" => $descripcion_otros,
                ]);
            }

            $datos_original = HistorialAccion::getDetalleRegistro($plan_anual, "informacion_pagos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICAICÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ACTUALIZÓ LA INFORMACIÓN DE FORMA DE PAGOS',
                'datos_original' => $datos_original,
                'modulo' => 'INFORMACIÓN PAGOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'plan_mensual' => $plan_mensual,
                'plan_trimestral' => $plan_trimestral,
                'plan_anual' => $plan_anual,
                'informacion_zelle' => $informacion_zelle,
                'informacion_western' => $informacion_western,
                'informacion_deposito' => $informacion_deposito,
                'informacion_mercado' => $informacion_mercado,
                'informacion_otros' => $informacion_otros,
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

    public static function getTipoArchivo($extension)
    {
        $audio = ["mp3", "wav", "ogg"];
        $video = ["mp4", "avi", "mkv"];
        $imagen = ["jpg", "jpeg", "png", "webp", "gif"];
        $archivo = ["docx", "doc", "pdf", "xls", "xlsx", "csv", "rar", "zip"];

        if (in_array($extension, $imagen)) {
            return "imagen";
        }
        if (in_array($extension, $archivo)) {
            return "archivo";
        }
        return "otro";
    }
}
