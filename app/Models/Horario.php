<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Horario extends Model
{
    use HasFactory;

    protected $fillable = [
        "grupo_id",
        "modalidad",
        "dias",
        "fecha_inicio",
        "fecha_fin",
        "hora_inicio",
        "hora_fin",
    ];

    protected $appends = ["dias_txt", "array_dias", "fecha_inicio_t", "fecha_fin_t", "hora_inicio_t", "hora_fin_t"];

    public function getHoraInicioTAttribute()
    {
        return date("H:i a", strtotime($this->hora_inicio));
    }
    public function getHoraFinTAttribute()
    {
        return date("H:i a", strtotime($this->hora_fin));
    }

    public function getFechaInicioTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_inicio));
    }
    public function getFechaFinTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_fin));
    }

    public function getArrayDiasAttribute()
    {
        return explode(",", $this->dias);
    }

    public function getDiasTxtAttribute()
    {
        $array_dias = explode(",", $this->dias);
        $dias_txt = "";
        if ($array_dias[0] == 1) {
            $dias_txt .= "Domingo, ";
        }
        if ($array_dias[1] == 1) {
            $dias_txt .= "Lunes, ";
        }
        if ($array_dias[2] == 1) {
            $dias_txt .= "Martes, ";
        }
        if ($array_dias[3] == 1) {
            $dias_txt .= "Miercoles, ";
        }
        if ($array_dias[4] == 1) {
            $dias_txt .= "Jueves, ";
        }
        if ($array_dias[5] == 1) {
            $dias_txt .= "Viernes, ";
        }
        if ($array_dias[6] == 1) {
            $dias_txt .= "Sábado, ";
        }
        return substr($dias_txt, 0, strlen($dias_txt) - 2);
    }

    public function grupo()
    {
        return $this->belongsTo(Grupo::class, 'grupo_id');
    }
}
