<?php

namespace Database\Factories;

use App\Models\Estudiante;
use Illuminate\Database\Eloquent\Factories\Factory;

class NotaFactory extends Factory
{
    public function definition(): array
    {
        return [
            'estudiante_id' => Estudiante::inRandomOrder()->first()->id,
            'matematicas_p1' => $this->faker->numberBetween(0, 10),
            'matematicas_p2' => $this->faker->numberBetween(0, 10),
            'lengua_p1' => $this->faker->numberBetween(0, 10),
            'lengua_p2' => $this->faker->numberBetween(0, 10),
            'ciencias_p1' => $this->faker->numberBetween(0, 10),
            'ciencias_p2' => $this->faker->numberBetween(0, 10),
            'sociales_p1' => $this->faker->numberBetween(0, 10),
            'sociales_p2' => $this->faker->numberBetween(0, 10),
            'ingles_p1' => $this->faker->numberBetween(0, 10),
            'ingles_p2' => $this->faker->numberBetween(0, 10),
        ];
    }
}