<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Estudiante;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class EstudianteController extends Controller
{
    // Listar todos los estudiantes
    public function index()
    {
        return Estudiante::all();
    }

    // Crear nuevo estudiante
    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required|string',
            'matricula' => 'required|string|unique:estudiantes,matricula',
            'direccion' => 'nullable|string',
            'contacto' => 'nullable|string',
            'foto' => 'nullable|image|max:2048',
        ]);

        $estudiante = new Estudiante();
        $estudiante->nombre = $request->nombre;
        $estudiante->matricula = $request->matricula;
        $estudiante->direccion = $request->direccion;
        $estudiante->contacto = $request->contacto;

        if ($request->hasFile('foto')) {
            $path = $request->file('foto')->store('images', 'public');
            $estudiante->foto = basename($path);
        }

        $estudiante->save();

        return response()->json($estudiante, 201);
    }

    // Mostrar estudiante
    public function show($id)
    {
        return Estudiante::findOrFail($id);
    }

    // Actualizar estudiante
    public function update(Request $request, $id)
    {
        $estudiante = Estudiante::findOrFail($id);

        $request->validate([
            'nombre' => 'required|string',
            'matricula' => 'required|string|unique:estudiantes,matricula,'.$id,
            'direccion' => 'nullable|string',
            'contacto' => 'nullable|string',
            'foto' => 'nullable|image|max:2048',
        ]);

        $estudiante->nombre = $request->nombre;
        $estudiante->matricula = $request->matricula;
        $estudiante->direccion = $request->direccion;
        $estudiante->contacto = $request->contacto;

        if ($request->hasFile('foto')) {
            // eliminar foto vieja si existe
            if ($estudiante->foto) {
                Storage::disk('public')->delete('images/'.$estudiante->foto);
            }
            $path = $request->file('foto')->store('images', 'public');
            $estudiante->foto = basename($path);
        }

        $estudiante->save();

        return response()->json($estudiante);
    }

    // Eliminar estudiante
    public function destroy($id)
    {
        $estudiante = Estudiante::findOrFail($id);

        if ($estudiante->foto) {
            Storage::disk('public')->delete('images/'.$estudiante->foto);
        }

        $estudiante->delete();

        return response()->json(null, 204);
    }
}
