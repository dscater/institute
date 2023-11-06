<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExamenEnunciadosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('examen_enunciados', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("examen_nivelacion_id");
            $table->string("enunciado", 700);
            $table->string("tipo", 255);
            $table->timestamps();
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
        Schema::dropIfExists('examen_enunciados');
    }
}
