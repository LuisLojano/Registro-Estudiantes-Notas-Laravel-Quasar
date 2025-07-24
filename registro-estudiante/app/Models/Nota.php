<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Nota extends Model
{
    use HasFactory;

    protected $fillable = [
        'estudiante_id',
        'matematicas_p1', 'matematicas_p2',
        'lengua_p1',     'lengua_p2',
        'ciencias_p1',   'ciencias_p2',
        'sociales_p1',   'sociales_p2',
        'ingles_p1',     'ingles_p2',
    ];

    public function estudiante()
    {
        return $this->belongsTo(Estudiante::class);
    }
}
