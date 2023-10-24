<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInscripcionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inscripcions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("user_id");
            $table->string("nombres", 255);
            $table->string("apellidos", 255);
            $table->string("nro_iden", 255);
            $table->date("fecha_nac");
            $table->integer("edad");
            $table->string("pais_residencia", 255);
            $table->string("nacionalidad", 255)->nullable();
            $table->string("prov_dpto", 255);
            $table->string("sexo", 100);
            $table->string("fono", 155);
            $table->string("correo", 255)->unique();
            $table->timestamps();

            $table->foreign("user_id")->on("users")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('inscripcions');
    }
}
