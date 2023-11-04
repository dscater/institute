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
    ];

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
