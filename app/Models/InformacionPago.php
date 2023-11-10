<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InformacionPago extends Model
{
    use HasFactory;

    protected $fillable = [
        "forma_pago",
        "archivo",
        "tipo_archivo",
        "descripcion",
    ];

    protected $appends = ["url_archivo"];

    public function getUrlArchivoAttribute()
    {
        if ($this->archivo) {
            return asset("/files/" . $this->archivo);
        }
        return "";
    }
}
