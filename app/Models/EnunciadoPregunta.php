<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EnunciadoPregunta extends Model
{
    use HasFactory;

    protected $fillable = [
        "examen_enunciado_id",
        "pregunta",
        "tipo",
        "opciones",
    ];

    protected $appends = ["array_opciones"];

    public function getArrayOpcionesAttribute()
    {
        if ($this->opciones != null && !empty($this->opciones)) {
            return explode(",", $this->opciones);
        }
        return [];
    }

    public function examen_enunciado()
    {
        return $this->belongsTo(ExamenEnunciado::class, 'examen_enunciado_id');
    }
}
