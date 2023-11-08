<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Inscripcion extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id",
        "nombres",
        "apellidos",
        "nro_iden",
        "fecha_nac",
        "edad",
        "pais_residencia",
        "nacionalidad",
        "prov_dpto",
        "sexo",
        "fono",
        "estado_ultima_solicitud",
        "correo",
    ];

    protected $appends = ['full_name', 'fecha_registro_t', 'cantidad_solicitudes', 'cantidad_solicitudes_pendientes'];

    public function getCantidadSolicitudesPendientesAttribute()
    {
        $pendientes = InscripcionSolicitud::where("inscripcion_id", $this->id)->where("estado", "PENDIENTE")->get();
        return count($pendientes);
    }

    public function getCantidadSolicitudesAttribute()
    {
        return count($this->inscripcion_solicituds);
    }

    public function getFullNameAttribute()
    {
        return $this->nombres . ' ' . $this->apellidos;
    }

    public function getFechaRegistroTAttribute()
    {
        return date("d/m/Y", strtotime($this->created_at));
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function inscripcion_solicituds()
    {
        return $this->hasMany(InscripcionSolicitud::class, 'inscripcion_id')->orderBy('id', 'desc');
    }
}
