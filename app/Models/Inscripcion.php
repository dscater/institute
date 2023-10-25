<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Inscripcion extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id",
        "nombres",
        "apellidos",
        "nro_iden",
        "fecha_nac",
        "edad",
        "pais_residencia",
        "nacionalidad",
        "prov_dpto",
        "sexo",
        "fono",
        "correo",
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
