<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGrupoRecursosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('grupo_recursos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("grupo_id");
            $table->string("titulo", 255);
            $table->string("link", 500);
            $table->date("fecha");
            $table->time("hora");
            $table->timestamps();

            $table->foreign("grupo_id")->on("grupos")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('grupo_recursos');
    }
}
