<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Grupo extends Model
{
    use HasFactory;

    protected $fillable = ["nombre", "descripcion", "link_reunion", "estado"];

    protected $appends = ['fecha_registro_t', 'existe_asignaciones', 'curso'];

    public function getCursoAttribute()
    {
        $asignacion_grupo = AsignacionGrupo::where("grupo_id", $this->id)->get()->first();
        if ($asignacion_grupo) {
            return $asignacion_grupo->curso;
        }
        return null;
    }


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

    public function grupo_recursos()
    {
        return $this->hasMany(GrupoRecurso::class, 'grupo_id')->orderBy("id", "desc");
    }

    public function comunicados()
    {
        return $this->hasMany(Comunicado::class, 'grupo_id')->orderBy("id", "desc");
    }

    public function asignacion_grupos()
    {
        return $this->hasMany(AsignacionGrupo::class, 'grupo_id')->orderBy("id", "desc");
    }

    public function grupo_profesor()
    {
        return $this->hasOne(GrupoProfesor::class, 'grupo_id');
    }
}
