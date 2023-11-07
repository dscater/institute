<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GestoriaSolicitud extends Model
{
    use HasFactory;

    protected $fillable = [
        "codigo",
        "nombres",
        "apellidos",
        "fecha_nac",
        "edad",
        "nacionalidad",
        "estado",
        "sexo",
        "fono",
        "familiares_eeuu",
        "parentesco",
        "familiar_deportado",
        "motivo",
        "deportado_otro_pais",
        "motivo_otro_pais",
        "antecedentes_penales",
        "desc_antecedentes",
        "estudios",
        "trabajo_actual",
        "solicito_visa",
        "motivo_rechazo",
        "cuenta_bancaria",
        "gana_aproximadamente",
        "redes_sociales",
        "correo",
        "recomendado_por",
        "estado_solicitud",
    ];

    protected $appends = ['full_name'];
    public function getFullNameAttribute()
    {
        return $this->nombres . ' ' . $this->apellidos;
    }
}
