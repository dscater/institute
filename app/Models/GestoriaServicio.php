<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GestoriaServicio extends Model
{
    use HasFactory;

    protected $fillable = [
        "turismo",
        "trabajo",
        "estudiantes",
        "renovacion",
        "mensaje_servicio"
    ];
}
