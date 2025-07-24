<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Usuario;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class UsuarioController extends Controller
{
    // Obtener todos los usuarios
    public function index()
    {
        return response()->json(Usuario::all());
    }

    // Crear un nuevo usuario
    public function store(Request $request)
    {
        $request->validate([
            'nombres' => 'required|string|max:255',
            'apellidos' => 'required|string|max:255',
            'correo' => 'required|email|unique:usuarios,correo',
            'telefono' => 'nullable|string|max:20',
            'direccion' => 'nullable|string|max:255',
            'rol' => 'required|string|max:50',
            'password' => 'required|string|min:6',
            'foto' => 'nullable|image|max:2048',
        ]);

        $usuario = new Usuario([
            'nombres' => $request->nombres,
            'apellidos' => $request->apellidos,
            'correo' => $request->correo,
            'telefono' => $request->telefono,
            'direccion' => $request->direccion,
            'rol' => $request->rol,
            'password' => Hash::make($request->password),
        ]);

        if ($request->hasFile('foto')) {
            $path = $request->file('foto')->store('images', 'public');
            $usuario->foto = basename($path);
        }

        $usuario->save();

        return response()->json($usuario, 201);
    }

    // Mostrar un usuario por ID
    public function show($id)
    {
        $usuario = Usuario::findOrFail($id);
        return response()->json($usuario);
    }

    // Actualizar usuario
    public function update(Request $request, $id)
    {
        $usuario = Usuario::findOrFail($id);

        $request->validate([
            'nombres' => 'required|string|max:255',
            'apellidos' => 'required|string|max:255',
            'correo' => 'required|email|unique:usuarios,correo,' . $usuario->id,
            'telefono' => 'nullable|string|max:20',
            'direccion' => 'nullable|string|max:255',
            'rol' => 'required|string|max:50',
            'password' => 'nullable|string|min:6',
            'foto' => 'nullable|image|max:2048',
        ]);

        $usuario->fill([
            'nombres' => $request->nombres,
            'apellidos' => $request->apellidos,
            'correo' => $request->correo,
            'telefono' => $request->telefono,
            'direccion' => $request->direccion,
            'rol' => $request->rol,
        ]);

        if ($request->filled('password')) {
            $usuario->password = Hash::make($request->password);
        }

        if ($request->hasFile('foto')) {
            if ($usuario->foto) {
                Storage::disk('public')->delete('images/' . $usuario->foto);
            }
            $path = $request->file('foto')->store('images', 'public');
            $usuario->foto = basename($path);
        }

        $usuario->save();

        return response()->json($usuario);
    }

    // Eliminar un usuario
    public function destroy($id)
    {
        $usuario = Usuario::findOrFail($id);

        if ($usuario->foto) {
            Storage::disk('public')->delete('images/' . $usuario->foto);
        }

        $usuario->delete();

        return response()->json(null, 204);
    }

    // Login simple sin tokens
    public function login(Request $request)
    {
        $request->validate([
            'correo' => 'required|email',
            'password' => 'required|string',
        ]);

        $usuario = Usuario::where('correo', $request->correo)->first();

        if (!$usuario || !Hash::check($request->password, $usuario->password)) {
            return response()->json(['message' => 'Credenciales incorrectas'], 401);
        }

        return response()->json([
            'message' => 'Login correcto',
            'usuario' => $usuario,
        ]);
    }
}
