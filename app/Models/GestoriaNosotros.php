<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GestoriaNosotros extends Model
{
    use HasFactory;

    protected $fillable = [
        "descripcion",
        "imagen",
    ];

    protected $appends = ["url_imagen"];
    public function getUrlImagenAttribute()
    {
        return asset("imgs/" . $this->imagen);
    }
}
