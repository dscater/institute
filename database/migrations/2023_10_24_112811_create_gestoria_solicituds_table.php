<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGestoriaSolicitudsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('gestoria_solicituds', function (Blueprint $table) {
            $table->id();
            $table->string("codigo", 255)->nullable();
            $table->string("nombres", 255);
            $table->string("apellidos", 255);
            $table->date("fecha_nac");
            $table->integer("edad");
            $table->string("nacionalidad", 255);
            $table->string("estado", 255)->nullable();
            $table->string("sexo", 155);
            $table->string("fono", 255);
            $table->string("familiares_eeuu", 10);
            $table->text("parentesco")->nullable();
            $table->string("familiar_deportado", 10);
            $table->text("motivo")->nullable();
            $table->string("deportado_otro_pais", 10);
            $table->text("motivo_otro_pais")->nullable();
            $table->string("antecedentes_penales", 10);
            $table->text("desc_antecedentes")->nullable();
            $table->text("estudios");
            $table->text("trabajo_actual");
            $table->string("solicito_visa", 10);
            $table->text("motivo_rechazo")->nullable();
            $table->string("cuenta_bancaria", 10);
            $table->decimal("gana_aproximadamente", 24, 2);
            $table->text("redes_sociales")->nullable();
            $table->string("correo", 255);
            $table->text("recomendado_por");
            $table->string("estado_solicitud", 155);
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
        Schema::dropIfExists('gestoria_solicituds');
    }
}
