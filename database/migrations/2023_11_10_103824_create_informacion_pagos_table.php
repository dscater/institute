<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInformacionPagosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('informacion_pagos', function (Blueprint $table) {
            $table->id();
            $table->string("forma_pago", 255);
            $table->string("archivo", 255)->nullable();
            $table->string("tipo_archivo", 155)->nullable();
            $table->text("descripcion");
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
        Schema::dropIfExists('informacion_pagos');
    }
}
