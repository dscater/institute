<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GrupoRecurso extends Model
{
    use HasFactory;

    protected $fillable = [
        "grupo_id",
        "titulo",
        "link",
        "fecha",
        "hora",
    ];

    protected $appends = ["fecha_txt"];

    public function getFechaTxtAttribute()
    {
        return "Hora " . date("H:i", strtotime($this->hora)) . " de " . date("d/m/Y", strtotime($this->fecha));
    }

    public function grupo()
    {
        return $this->belongsTo(Grupo::class, 'grupo_id');
    }
}
