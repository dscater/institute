<?php

namespace App\Http\Controllers;

use App\Models\GestoriaBanner;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GestoriaBannerController extends Controller
{
    public $validacion = [
        'posicion' => 'required|numeric|min:1',
    ];

    public $mensajes = [
        'img.required' => 'Debes seleccionar una imagen',
        'img.mimes' => 'Debes seleccionar una imagen con un formato :mimes',
        'img.max' => 'Debes seleccionar una imagen que no pese mas de :max',
        'posicion.required' => 'Este campo es obligatorio',
        'posicion.numeric' => 'Debes ingresar un valor númerico',
        'posicion.min' => 'Debes ingresar un valor mayor o igual a :min',
    ];

    public function index(Request $request)
    {
        $gestoria_banners = GestoriaBanner::orderBy("posicion", "asc")->get();
        return response()->JSON(['gestoria_banners' => $gestoria_banners, 'total' => count($gestoria_banners)], 200);
    }

    public function bannerPrincipal(Request $request)
    {
        $gestoria_banner = GestoriaBanner::where("posicion", 1)->get()->first();
        if (!$gestoria_banner) {
            $gestoria_banner = GestoriaBanner::get()->first();
        }
        return response()->JSON(['gestoria_banner' => $gestoria_banner], 200);
    }


    public function store(Request $request)
    {
        $this->validacion['img'] = 'required|mimes:jpeg,jpg,png,webp|max:4096';
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // validar minimo de slides
            $gestoria_banners_existentes = GestoriaBanner::all();
            if (count($gestoria_banners_existentes) >= 5) {
                throw new Exception("Se alcanzó el limite maximo de imagénes para mostrar en el portal");
            }

            // crear el GestoriaBanner
            $file_img = $request->img;
            $request["img"] = "default.png";
            $request["mostrar_boton"] = (int)$request["mostrar_boton"];
            $nuevo_gestoria_banner = GestoriaBanner::create(array_map('mb_strtoupper', $request->all()));
            // cargando imagen
            $nom_img = time() . '_' . $nuevo_gestoria_banner->id . '.' . $file_img->getClientOriginalExtension();
            $nuevo_gestoria_banner->img = $nom_img;
            $file_img->move(public_path() . '/imgs/gestoria_banners/', $nom_img);
            $nuevo_gestoria_banner->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_gestoria_banner, "gestoria_banners");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UN BANNER DE GESTORÍA',
                'datos_original' => $datos_original,
                'modulo' => 'GESTORÍA BANNERS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'gestoria_banner' => $nuevo_gestoria_banner,
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

    public function update(Request $request, GestoriaBanner $gestoria_banner)
    {
        if ($request->hasFile("img")) {
            $this->validacion['img'] = 'required|mimes:jpeg,jpg,png,webp|max:4096';
        }
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($gestoria_banner, "gestoria_banners");
            $request["mostrar_boton"] = (int)$request["mostrar_boton"];
            $gestoria_banner->update(array_map('mb_strtoupper', $request->except("img")));

            if ($request->hasFile("img")) {
                $antiguo = $gestoria_banner->img;
                if ($antiguo != 'default.png') {
                    \File::delete(public_path() . '/imgs/gestoria_banners/' . $antiguo);
                }
                $file_img = $request->img;
                $nom_img = time() . '_' . $gestoria_banner->id . '.' . $file_img->getClientOriginalExtension();
                $gestoria_banner->img = $nom_img;
                $file_img->move(public_path() . '/imgs/gestoria_banners/', $nom_img);
            }
            $gestoria_banner->save();

            $datos_nuevo = HistorialAccion::getDetalleRegistro($gestoria_banner, "gestoria_banners");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN BANNER DE GESTORÍA',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'GESTORÍA BANNERS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'gestoria_banner' => $gestoria_banner,
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
    public function destroy(GestoriaBanner $gestoria_banner)
    {
        DB::beginTransaction();
        try {
            $antiguo = $gestoria_banner->img;
            if ($antiguo != 'default.png') {
                \File::delete(public_path() . '/imgs/gestoria_banners/' . $antiguo);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($gestoria_banner, "gestoria_banners");
            $gestoria_banner->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UN BANNER DE GESTORÍA',
                'datos_original' => $datos_original,
                'modulo' => 'GESTORÍA BANNERS',
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
