<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    use HasFactory;

    protected $fillable = [
        "img",
        "posicion",
        "desc1",
        "desc2",
        "muestra_boton",
    ];

    protected $appends = ["url_img"];
    public function getUrlImgAttribute()
    {
        return asset("imgs/banners/" . $this->img);
    }
}
