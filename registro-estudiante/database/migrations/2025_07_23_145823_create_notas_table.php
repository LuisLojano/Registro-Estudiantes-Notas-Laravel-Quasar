<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::create('notas', function (Blueprint $table) {
            $table->id();
            $table->foreignId('estudiante_id')->constrained()->onDelete('cascade');

            $table->float('matematicas_p1')->nullable();
            $table->float('matematicas_p2')->nullable();

            $table->float('lengua_p1')->nullable();
            $table->float('lengua_p2')->nullable();

            $table->float('ciencias_p1')->nullable();
            $table->float('ciencias_p2')->nullable();

            $table->float('sociales_p1')->nullable();
            $table->float('sociales_p2')->nullable();

            $table->float('ingles_p1')->nullable();
            $table->float('ingles_p2')->nullable();

            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('notas');
    }
};