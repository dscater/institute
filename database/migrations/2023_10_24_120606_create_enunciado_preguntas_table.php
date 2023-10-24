<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEnunciadoPreguntasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('enunciado_preguntas', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("examen_enunciado_id");
            $table->string("pregunta", 700);
            $table->string("tipo", 155);
            $table->string("opciones", 255);
            $table->timestamps();
            $table->foreign("examen_enunciado_id")->on("examen_enunciados")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('enunciado_preguntas');
    }
}
