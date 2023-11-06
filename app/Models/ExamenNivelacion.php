<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExamenNivelacion extends Model
{
    use HasFactory;

    protected $fillable = ["curso_id"];


    protected $appends = ["total_enunciados", "total_preguntas"];

    public function getTotalEnunciadosAttribute()
    {
        return count($this->examen_enunciados);
    }
    public function getTotalPreguntasAttribute()
    {
        $total = 0;
        foreach ($this->examen_enunciados as $ee) {
            $total += count($ee->enunciado_preguntas);
        }
        return $total;
    }

    public function curso()
    {
        return $this->belongsTo(Curso::class, "curso_id");
    }

    public function examen_enunciados()
    {
        return $this->hasMany(ExamenEnunciado::class, "examen_nivelacion_id");
    }
}
