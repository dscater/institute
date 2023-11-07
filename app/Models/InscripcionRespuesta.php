<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InscripcionRespuesta extends Model
{
    use HasFactory;

    protected $fillable = [
        "inscripcion_examen_id",
        "examen_enunciado_id",
        "enunciado_pregunta_id",
        "respuesta",
        "calificacion",
    ];

    public function inscripcion_examen()
    {
        return $this->belongsTo(InscripcionExamen::class, 'inscripcion_examen_id');
    }

    public function examen_enunciado()
    {
        return $this->belongsTo(ExamenEnunciado::class, 'examen_enunciado_id');
    }

    public function enunciado_pregunta()
    {
        return $this->belongsTo(EnunciadoPregunta::class, 'enunciado_pregunta_id');
    }
}
