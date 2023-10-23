<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ConfiguracionGestoria extends Model
{
    use HasFactory;

    protected $fillable = [
        "direccion",
        "fono1",
        "fono2",
        "correo",
        "mapa",
    ];
}
