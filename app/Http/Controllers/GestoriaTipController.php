<?php

namespace App\Http\Controllers;

use App\Models\GestoriaTip;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GestoriaTipController extends Controller
{
    public $validacion = [
        'titulo' => 'required|min:1',
        'descripcion' => 'required|min:1',
    ];

    public $mensajes = [
        'titulo.required' => 'Este campo es obligatorio',
        'titulo.min' => 'Debes ingresar al menos :min caracteres',
        'descripcion.required' => 'Este campo es obligatorio',
        'descripcion.min' => 'Debes ingresar al menos :min caracteres',
    ];

    public function index(Request $request)
    {
        $gestoria_tips = GestoriaTip::orderBy("id", "desc")->get();
        return response()->JSON(['gestoria_tips' => $gestoria_tips, 'total' => count($gestoria_tips)], 200);
    }

    public function tipPrincipal(Request $request)
    {
        $gestoria_tip = GestoriaTip::where("titulo", 1)->get()->first();
        if (!$gestoria_tip) {
            $gestoria_tip = GestoriaTip::get()->first();
        }
        return response()->JSON(['gestoria_tip' => $gestoria_tip], 200);
    }


    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // validar minimo de slides
            $gestoria_tips_existentes = GestoriaTip::all();
            if (count($gestoria_tips_existentes) >= 5) {
                throw new Exception("Se alcanzó el limite maximo de imagénes para mostrar en el portal");
            }

            // crear el GestoriaTip
            $descripcionMayuscula = nl2br(mb_strtoupper($request->descripcion));
            $descripcionMayuscula = str_replace(['<BR/>', '<BR />'], '<br/>', $request->descripcion);
            $nuevo_gestoria_tip = GestoriaTip::create(array_map('mb_strtoupper', [
                "titulo" => mb_strtoupper($request->titulo),
                "descripcion" => $descripcionMayuscula,
            ]));

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_gestoria_tip, "gestoria_tips");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UN TIP DE GESTORÍA',
                'datos_original' => $datos_original,
                'modulo' => 'GESTORÍA TIPS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'gestoria_tip' => $nuevo_gestoria_tip,
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

    public function update(Request $request, GestoriaTip $gestoria_tip)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($gestoria_tip, "gestoria_tips");
            $request["mostrar_boton"] = (int)$request["mostrar_boton"];
            $descripcionMayuscula = nl2br(mb_strtoupper($request->descripcion));
            $descripcionMayuscula = str_replace(['<BR/>', '<BR />'], '<br/>', $request->descripcion);
            $gestoria_tip->update(array_map('mb_strtoupper', [
                "titulo" => mb_strtoupper($request->titulo),
                "descripcion" => $descripcionMayuscula,
            ]));

            $datos_nuevo = HistorialAccion::getDetalleRegistro($gestoria_tip, "gestoria_tips");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN TIP DE GESTORÍA',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'GESTORÍA TIPS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'gestoria_tip' => $gestoria_tip,
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
    public function destroy(GestoriaTip $gestoria_tip)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($gestoria_tip, "gestoria_tips");
            $gestoria_tip->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UN TIP DE GESTORÍA',
                'datos_original' => $datos_original,
                'modulo' => 'GESTORÍA TIPS',
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
