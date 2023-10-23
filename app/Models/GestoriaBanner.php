<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GestoriaBanner extends Model
{
    use HasFactory;
    protected $fillable = [
        "img",
        "posicion",
    ];

    protected $appends = ["url_img"];
    public function getUrlImgAttribute()
    {
        return asset("imgs/gestoria_banners/" . $this->img);
    }
}
