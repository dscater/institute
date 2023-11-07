<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInscripcionExamensTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inscripcion_examens', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("inscripcion_id");
            $table->unsignedBigInteger("inscripcion_solicitud_id");
            $table->unsignedBigInteger("examen_nivelacion_id");
            $table->double("puntaje", 8, 2)->nullable();
            $table->string("estado", 155)->nullable();
            $table->timestamps();

            $table->foreign("inscripcion_id")->on("inscripcions")->references("id");
            $table->foreign("inscripcion_solicitud_id")->on("inscripcion_solicituds")->references("id");
            $table->foreign("examen_nivelacion_id")->on("examen_nivelacions")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('inscripcion_examens');
    }
}
