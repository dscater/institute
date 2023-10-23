<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\HistorialAccion;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class BannerController extends Controller
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
        $banners = Banner::orderBy("posicion", "asc")->get();
        return response()->JSON(['banners' => $banners, 'total' => count($banners)], 200);
    }

    public function bannerPrincipal(Request $request)
    {
        $banner = Banner::where("posicion", 1)->get()->first();
        if (!$banner) {
            $banner = Banner::get()->first();
        }
        return response()->JSON(['banner' => $banner], 200);
    }


    public function store(Request $request)
    {
        $this->validacion['img'] = 'required|mimes:jpeg,jpg,png,webp|max:4096';
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // validar minimo de slides
            $banners_existentes = Banner::all();
            if (count($banners_existentes) >= 5) {
                throw new Exception("Se alcanzó el limite maximo de imagénes para mostrar en el portal");
            }

            // crear el Banner
            $file_img = $request->img;
            $request["img"] = "default.png";
            $request["mostrar_boton"] = (int)$request["mostrar_boton"];
            $nuevo_banner = Banner::create(array_map('mb_strtoupper', $request->all()));
            // cargando imagen
            $nom_img = time() . '_' . $nuevo_banner->id . '.' . $file_img->getClientOriginalExtension();
            $nuevo_banner->img = $nom_img;
            $file_img->move(public_path() . '/imgs/banners/', $nom_img);
            $nuevo_banner->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_banner, "banners");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UN BANNER',
                'datos_original' => $datos_original,
                'modulo' => 'BANNERS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'banner' => $nuevo_banner,
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

    public function update(Request $request, Banner $banner)
    {
        if ($request->hasFile("img")) {
            $this->validacion['img'] = 'required|mimes:jpeg,jpg,png,webp|max:4096';
        }
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($banner, "banners");
            $request["mostrar_boton"] = (int)$request["mostrar_boton"];
            $banner->update(array_map('mb_strtoupper', $request->except("img")));

            if ($request->hasFile("img")) {
                $antiguo = $banner->img;
                if ($antiguo != 'default.png') {
                    \File::delete(public_path() . '/imgs/banners/' . $antiguo);
                }
                $file_img = $request->img;
                $nom_img = time() . '_' . $banner->id . '.' . $file_img->getClientOriginalExtension();
                $banner->img = $nom_img;
                $file_img->move(public_path() . '/imgs/banners/', $nom_img);
            }
            $banner->save();

            $datos_nuevo = HistorialAccion::getDetalleRegistro($banner, "banners");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN BANNER',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'BANNERS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'banner' => $banner,
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
    public function destroy(Banner $banner)
    {
        DB::beginTransaction();
        try {
            $antiguo = $banner->img;
            if ($antiguo != 'default.png') {
                \File::delete(public_path() . '/imgs/banners/' . $antiguo);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($banner, "banners");
            $banner->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UN BANNER',
                'datos_original' => $datos_original,
                'modulo' => 'BANNERS',
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
