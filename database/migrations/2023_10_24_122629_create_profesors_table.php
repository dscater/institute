<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProfesorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('profesors', function (Blueprint $table) {
            $table->id();
            $table->string("nombres", 255);
            $table->string("apellidos", 255);
            $table->string("ci", 155)->nullable();
            $table->string("nacionalidad", 255)->nullable();
            $table->string("pais_residencia", 255)->nullable();
            $table->string("dir", 300)->nullable();
            $table->string("fono", 255);
            $table->string("especialidad", 255);
            $table->string("correo", 255)->unique();
            $table->unsignedBigInteger("user_id");
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
        Schema::dropIfExists('profesors');
    }
}
