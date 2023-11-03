<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Grupo extends Model
{
    use HasFactory;

    protected $fillable = ["nombre", "descripcion", "link_reunion", "estado"];

    protected $appends = ['fecha_registro_t'];

    public function getFechaRegistroTAttribute()
    {
        return date("d/m/Y", strtotime($this->created_at));
    }
}
