<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInscripcionRespuestasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inscripcion_respuestas', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("inscripcion_examen_id");
            $table->unsignedBigInteger("examen_enunciado_id");
            $table->unsignedBigInteger("enunciado_pregunta_id");
            $table->string("respuesta", 1000);
            $table->string("calificacion", 100)->nullable();
            $table->timestamps();
            $table->foreign("inscripcion_examen_id")->on("inscripcion_examens")->references("id");
            $table->foreign("examen_enunciado_id")->on("examen_enunciados")->references("id");
            $table->foreign("enunciado_pregunta_id")->on("enunciado_preguntas")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('inscripcion_respuestas');
    }
}
