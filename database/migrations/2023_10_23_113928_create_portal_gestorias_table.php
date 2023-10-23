<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePortalGestoriasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('portal_gestorias', function (Blueprint $table) {
            $table->id();
            $table->string("imagen_inicio", 255)->nullable();
            $table->string("titulo_inicio", 255);
            $table->string("descripcion_inicio", 255);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('portal_gestorias');
    }
}
