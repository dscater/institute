<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExamenNivelacionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('examen_nivelacions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("curso_id");
            $table->timestamps();

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
        Schema::dropIfExists('examen_nivelacions');
    }
}
