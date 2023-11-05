<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profesor extends Model
{
    use HasFactory;

    protected $fillable = [
        "nombres",
        "apellidos",
        "ci",
        "nacionalidad",
        "pais_residencia",
        "dir",
        "fono",
        "especialidad",
        "correo",
        "user_id"
    ];

    protected $appends = ['full_name'];

    public function getFullNameAttribute()
    {
        return $this->nombres . ' ' . $this->apellidos;
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
