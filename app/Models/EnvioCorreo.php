<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EnvioCorreo extends Model
{
    use HasFactory;

    protected $fillable = [
        "host",
        "puerto",
        "encryptado",
        "correo",
        "nombre",
        "password",
        "driver"
    ];
}
