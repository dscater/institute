<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AsignacionGrupo extends Model
{
    use HasFactory;

    protected $fillable = [
        "grupo_id",
        "inscripcion_id",
        "inscripcion_solicitud_id",
        "curso_id",
        "calificacion",
        "estado"
    ];

    protected $appends = ["abandono"];

    public function getAbandonoAttribute()
    {
        $grupo = $this->grupo;
        if ($grupo->horario) {
            $fecha_actual = date("Y-m-d");
            $inscripcion_solicitud = $this->inscripcion_solicitud;
            if ($grupo->horario->fecha_fin < $fecha_actual) {
                if (!$inscripcion_solicitud->inscripcion_examen) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public function grupo()
    {
        return $this->belongsTo(Grupo::class, 'grupo_id');
    }

    public function inscripcion()
    {
        return $this->belongsTo(Inscripcion::class, 'inscripcion_id');
    }

    public function inscripcion_solicitud()
    {
        return $this->belongsTo(InscripcionSolicitud::class, 'inscripcion_solicitud_id');
    }

    public function curso()
    {
        return $this->belongsTo(Curso::class, 'curso_id');
    }
}
