<?php

namespace App\Http\Controllers;

use App\Models\GestoriaNosotros;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GestoriaNosotrosController extends Controller
{
    public $validacion = [
        "descripcion" => "required",
    ];

    public $mensajes = [
        "descripcion.required" => "Este campo es obligatorio",
    ];

    public function index(Request $request)
    {
        $gestoria_nosotros = GestoriaNosotros::get()->first();
        return response()->JSON(['gestoria_nosotros' => $gestoria_nosotros, 200]);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);

        if ($request->hasFile("imagen")) {
            $this->validacion['imagen'] = 'required|mimes:jpeg,jpg,png,webp|max:4096';
        }

        DB::beginTransaction();
        try {
            // crear el GestoriaNosotros
            $gestoria_nosotros = GestoriaNosotros::get()->first();
            if (!$gestoria_nosotros) {
                $gestoria_nosotros = GestoriaNosotros::create($request->except("imagen"));
            } else {
                $gestoria_nosotros->update($request->except("imagen"));
            }
            $gestoria_nosotros->descripcion = nl2br($request->descripcion);
            if ($request->hasFile("imagen")) {
                $antiguo = $gestoria_nosotros->imagen;
                if ($antiguo != 'default.png' && $antiguo) {
                    \File::delete(public_path() . '/imgs/' . $antiguo);
                }
                $file_imagen = $request->imagen;
                $nom_imagen = time() . '_' . $gestoria_nosotros->id . '.' . $file_imagen->getClientOriginalExtension();
                $gestoria_nosotros->imagen = $nom_imagen;
                $file_imagen->move(public_path() . '/imgs/', $nom_imagen);
            }
            $gestoria_nosotros->save();

            $datos_original = HistorialAccion::getDetalleRegistro($gestoria_nosotros, "gestoria_nosotros");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ LA DESCRIPCIÓN ¿QUIENES SOMOS? DE GESTORÍA',
                'datos_original' => $datos_original,
                'modulo' => 'GESTORÍA NOSOTROS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'gestoria_nosotros' => $gestoria_nosotros,
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
