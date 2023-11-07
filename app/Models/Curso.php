<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Curso extends Model
{
    use HasFactory;

    protected $fillable = [
        "nombre", "imagen", "descripcion", "fecha_registro"
    ];

    protected $appends = ['fecha_registro_t', 'url_imagen', 'texto_corto'];

    public function getFechaRegistroTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_registro));
    }
    public function getUrlImagenAttribute()
    {
        if ($this->imagen) {
            return asset("imgs/cursos/" . $this->imagen);
        }
        return asset("imgs/cursos/default.jpg");
    }
    public function getTextoCortoAttribute()
    {
        if (strlen($this->descripcion) > 100) {
            return substr($this->descripcion, 0, 99) . '...';
        }
    }

    public function examen_nivelacions()
    {
        return $this->hasMany(ExamenNivelacion::class, 'curso_id')->orderBy("id", "desc");
    }
}
