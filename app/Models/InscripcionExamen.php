<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InscripcionExamen extends Model
{
    use HasFactory;

    protected $fillable = [
        "inscripcion_id",
        "inscripcion_solicitud_id",
        "examen_nivelacion_id",
        "puntaje",
        "estado",
    ];

    protected $appends = ["c_correctos", "c_incorrectos"];

    public function getCCorrectosAttribute()
    {
        $correctos = InscripcionRespuesta::where("inscripcion_examen_id", $this->id)->where("calificacion", "CORRECTO")->get();
        return count($correctos);
    }
    public function getCIncorrectosAttribute()
    {
        $incorrectos = InscripcionRespuesta::where("inscripcion_examen_id", $this->id)->where("calificacion", "!=", "CORRECTO")->get();
        return count($incorrectos);
    }

    public function inscripcion_respuestas()
    {
        return $this->hasMany(InscripcionRespuesta::class, 'inscripcion_examen_id');
    }

    public function inscripcion()
    {
        return $this->belongsTo(Inscripcion::class, 'inscripcion_id');
    }

    public function inscripcion_solicitud()
    {
        return $this->belongsTo(InscripcionSolicitud::class, 'inscripcion_solicitud_id');
    }

    public function examen_nivelacion()
    {
        return $this->belongsTo(ExamenNivelacion::class, 'examen_nivelacion_id');
    }
}
