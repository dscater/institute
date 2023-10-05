<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\RedSocial;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class RedSocialController extends Controller
{
    public function index(Request $request)
    {
        $red_social = RedSocial::get()->first();
        return response()->JSON(['red_social' => $red_social, 200]);
    }

    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            // crear el RedSocial
            $red_social = RedSocial::get()->first();
            if (!$red_social) {
                $red_social = RedSocial::create($request->all());
            } else {
                $red_social->update($request->all());
            }
            $datos_original = HistorialAccion::getDetalleRegistro($red_social, "red_socials");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ACTUALIZÓ LA SECCIÓN REDES SOCIALES',
                'datos_original' => $datos_original,
                'modulo' => 'REDES SOCIALES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'red_social' => $red_social,
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
