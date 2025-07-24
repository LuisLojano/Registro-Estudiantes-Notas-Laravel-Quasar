<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class EstudianteFactory extends Factory
{
    public function definition(): array
    {
        return [
            'nombre' => $this->faker->name,
            'matricula' => $this->faker->unique()->bothify('MAT-####'),
            'direccion' => $this->faker->address,
            'contacto' => $this->faker->phoneNumber,
            'foto' => $this->faker->imageUrl(200, 200, 'people', true, 'Estudiante'),
        ];
    }
}
