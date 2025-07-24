<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Nota;
use Illuminate\Http\Request;

class NotaController extends Controller
{
    public function index()
    {
        // Cargar notas con estudiante para mostrar nombre, etc
        $notas = Nota::with('estudiante')->get();
        return response()->json($notas);
    }

    public function store(Request $request)
    {
        $request->validate([
            'estudiante_id' => 'required|exists:estudiantes,id',
            'matematicas_p1' => 'required|numeric|min:0|max:100',
            'matematicas_p2' => 'required|numeric|min:0|max:100',
            'lengua_p1' => 'required|numeric|min:0|max:100',
            'lengua_p2' => 'required|numeric|min:0|max:100',
            'ciencias_p1' => 'required|numeric|min:0|max:100',
            'ciencias_p2' => 'required|numeric|min:0|max:100',
            'sociales_p1' => 'required|numeric|min:0|max:100',
            'sociales_p2' => 'required|numeric|min:0|max:100',
            'ingles_p1' => 'required|numeric|min:0|max:100',
            'ingles_p2' => 'required|numeric|min:0|max:100',
        ]);

        $nota = Nota::create($request->all());
        return response()->json($nota, 201);
    }

    public function show($id)
    {
        $nota = Nota::with('estudiante')->findOrFail($id);
        return response()->json($nota);
    }

    public function update(Request $request, $id)
    {
        $nota = Nota::findOrFail($id);

        $request->validate([
            'estudiante_id' => 'required|exists:estudiantes,id',
            'matematicas_p1' => 'required|numeric|min:0|max:100',
            'matematicas_p2' => 'required|numeric|min:0|max:100',
            'lengua_p1' => 'required|numeric|min:0|max:100',
            'lengua_p2' => 'required|numeric|min:0|max:100',
            'ciencias_p1' => 'required|numeric|min:0|max:100',
            'ciencias_p2' => 'required|numeric|min:0|max:100',
            'sociales_p1' => 'required|numeric|min:0|max:100',
            'sociales_p2' => 'required|numeric|min:0|max:100',
            'ingles_p1' => 'required|numeric|min:0|max:100',
            'ingles_p2' => 'required|numeric|min:0|max:100',
        ]);

        $nota->update($request->all());
        return response()->json($nota);
    }

    public function destroy($id)
    {
        $nota = Nota::findOrFail($id);
        $nota->delete();
        return response()->json(null, 204);
    }
}
