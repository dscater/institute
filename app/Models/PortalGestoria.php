<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PortalGestoria extends Model
{
    use HasFactory;

    protected $fillable = [
        "imagen_inicio",
        "titulo_inicio",
        "descripcion_inicio",
    ];


    protected $appends = ["url_imagen"];
    public function getUrlImagenAttribute()
    {
        return asset("imgs/" . $this->imagen_inicio);
    }
}
