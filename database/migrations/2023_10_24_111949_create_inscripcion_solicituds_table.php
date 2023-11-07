<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInscripcionSolicitudsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inscripcion_solicituds', function (Blueprint $table) {
            $table->id();
            $table->strgom("codigo", 255)->nullable();
            $table->unsignedBigInteger("inscripcion_id");
            $table->unsignedBigInteger("curso_id");
            $table->string("nivel", 155);
            $table->string("se_entero", 155);
            $table->string("desc_se_entero", 300);
            $table->unsignedBigInteger("plan_pago_id");
            $table->deicmal("plan_costo", 24, 2);
            $table->string("forma_pago", 155);
            $table->string("archivo_pago", 255)->nullable();
            $table->text("desc_pago")->nullable();
            $table->text("desc_otro_pago")->nullable();
            $table->string("estado_asignado", 155);
            $table->string("estado", 155);
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
        Schema::dropIfExists('inscripcion_solicituds');
    }
}
