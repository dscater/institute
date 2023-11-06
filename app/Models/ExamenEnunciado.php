<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExamenEnunciado extends Model
{
    use HasFactory;

    protected $fillable = [
        "examen_nivelacion_id",
        "enunciado",
        "tipo",
    ];

    public function examen_nivelacion()
    {
        return $this->belongsTo(ExamenNivelacion::class, 'examen_nivelacion_id');
    }

    public function enunciado_preguntas()
    {
        return $this->hasMany(EnunciadoPregunta::class, 'examen_enunciado_id');
    }
}
