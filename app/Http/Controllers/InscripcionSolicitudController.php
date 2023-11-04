<?php

namespace App\Http\Controllers;

use App\Models\InscripcionSolicitud;
use Illuminate\Http\Request;

class InscripcionSolicitudController extends Controller
{
    public function show(InscripcionSolicitud $inscripcion_solicitud)
    {
        return response()->JSON([
            "inscripcion_solicitud" => $inscripcion_solicitud
        ], 200);
    }
    public function update(InscripcionSolicitud $inscripcion_solicitud, Request $request)
    {
        return $request;
        return response()->JSON([
            "inscripcion_solicitud" => $inscripcion_solicitud
        ], 200);
    }
}
