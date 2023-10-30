<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InscripcionSolicitud extends Model
{
    use HasFactory;
    protected $fillable = [
        "inscripcion_id",
        "curso_id",
        "nivel",
        "se_entero",
        "desc_se_entero",
        "plan_pago",
        "forma_pago",
        "archivo_pago",
        "desc_pago",
        "desc_otro_pago",
        "estado_asignado",
        "estado",
    ];

    public function inscripcion()
    {
        return $this->belongsTo(Inscripcion::class, 'inscripcion_id');
    }
    public function curso()
    {
        return $this->belongsTo(Curso::class, 'curso_id');
    }
}
