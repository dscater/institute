<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAsignacionGruposTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('asignacion_grupos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("grupo_id");
            $table->unsignedBigInteger("inscripcion_id");
            $table->unsignedBigInteger("inscripcion_solicitud_id");
            $table->unsignedBigInteger("curso_id");
            $table->timestamps();

            $table->foreign("grupo_id")->on("grupos")->references("id");
            $table->foreign("inscripcion_id")->on("inscripcions")->references("id");
            $table->foreign("inscripcion_solicitud_id")->on("inscripcion_solicituds")->references("id");
            $table->foreign("curso_id")->on("cursos")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('asignacion_grupos');
    }
}
