<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\EstudianteController;
use App\Http\Controllers\Api\UsuarioController;
use App\Http\Controllers\Api\NotaController;

Route::apiResource('estudiantes', EstudianteController::class);
Route::apiResource('usuarios', UsuarioController::class);
Route::apiResource('notas', NotaController::class);

// Ruta para login simple
Route::post('/login', [UsuarioController::class, 'login']);
