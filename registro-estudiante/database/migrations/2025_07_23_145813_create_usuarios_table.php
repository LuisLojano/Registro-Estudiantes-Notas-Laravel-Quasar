<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
        public function up(): void {
            Schema::create('usuarios', function (Blueprint $table) {
                $table->id();
                $table->string('nombres');
                $table->string('apellidos');
                $table->string('correo')->unique();
                $table->string('telefono');
                $table->string('direccion')->nullable();
                $table->string('foto')->nullable();
                $table->string('password'); // ← Añadido
                $table->string('rol')->default('admin'); // ← Añadido
                $table->timestamps();
            });
        }

    public function down(): void {
        Schema::dropIfExists('usuarios');
    }
};
