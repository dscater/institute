<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Grupo extends Model
{
    use HasFactory;

    protected $fillable = ["nombre", "descripcion", "link_reunion", "estado"];

    protected $appends = ['fecha_registro_t', 'existe_asignaciones'];

    public function getExisteAsignacionesAttribute()
    {
        $asignacion_grupos = AsignacionGrupo::where("grupo_id", $this->id)->get();
        if (count($asignacion_grupos) > 0) {
            return true;
        }
        return false;
    }

    public function getFechaRegistroTAttribute()
    {
        return date("d/m/Y", strtotime($this->created_at));
    }

    public function horario()
    {
        return $this->hasOne(Horario::class, 'grupo_id');
    }
}
