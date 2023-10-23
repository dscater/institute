<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\PortalGestoria;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PortalGestoriaController extends Controller
{
    public $validacion = [
        "titulo_inicio" => "required",
        "descripcion_inicio" => "required",
    ];

    public $mensajes = [
        "titulo_inicio.required" => "Este campo es obligatorio",
        "descripcion_inicio.required" => "Este campo es obligatorio",
    ];

    public function index(Request $request)
    {
        $portal_gestoria = PortalGestoria::get()->first();
        return response()->JSON(['portal_gestoria' => $portal_gestoria], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);

        if ($request->hasFile("imagen_inicio")) {
            $this->validacion['imagen_inicio'] = 'required|mimes:jpeg,jpg,png,webp|max:4096';
        }

        DB::beginTransaction();
        try {
            // crear el PortalGestoria
            $portal_gestoria = PortalGestoria::get()->first();
            if (!$portal_gestoria) {
                $portal_gestoria = PortalGestoria::create($request->except("imagen_inicio"));
            } else {
                $portal_gestoria->update($request->except("imagen_inicio"));
            }
            if ($request->hasFile("imagen_inicio")) {
                $antiguo = $portal_gestoria->imagen_inicio;
                if ($antiguo != 'default.png' && $antiguo) {
                    \File::delete(public_path() . '/imgs/' . $antiguo);
                }
                $file_imagen_inicio = $request->imagen_inicio;
                $nom_imagen_inicio = time() . '_' . $portal_gestoria->id . '.' . $file_imagen_inicio->getClientOriginalExtension();
                $portal_gestoria->imagen_inicio = $nom_imagen_inicio;
                $file_imagen_inicio->move(public_path() . '/imgs/', $nom_imagen_inicio);
            }
            $portal_gestoria->save();

            $datos_original = HistorialAccion::getDetalleRegistro($portal_gestoria, "portal_gestorias");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ LA DESCRIPCIÓN DE GESTORÍA DE LA PÁGINA INICIAL',
                'datos_original' => $datos_original,
                'modulo' => 'PORTAL GESTORÍA',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'portal_gestoria' => $portal_gestoria,
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
