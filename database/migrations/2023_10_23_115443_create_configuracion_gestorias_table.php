<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateConfiguracionGestoriasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('configuracion_gestorias', function (Blueprint $table) {
            $table->id();
            $table->string("direccion");
            $table->string("fono1", 255);
            $table->string("fono2", 255)->nullable();
            $table->string("correo", 255);
            $table->text("mapa")->nullable();
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
        Schema::dropIfExists('configuracion_gestorias');
    }
}
