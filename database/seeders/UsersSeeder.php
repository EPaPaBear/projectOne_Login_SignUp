<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Users;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = \Faker\Factory::create();
        for($i = 0; $i < 50; $i++){
            Users::create([
                'name' => $faker->name,
                'email' => $faker->email,
                'phone' => $faker->e164PhoneNumber,
                'password' => $faker->password,
            ]);
        }
    }
}
