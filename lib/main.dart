import 'package:flutter/material.dart';
import 'package:pokedex/screens/gym_main_screen.dart';
import 'package:pokedex/screens/pokemon_main_screen.dart';
import 'package:pokedex/screens/trainer_main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/pokemon': (context) => PokemonMainScreen(),
        '/trainer': (context) => TrainerMainScreen(),
        '/gym': (context) => GymMainScreen(),
      },
      initialRoute: '/pokemon',
    );
  }
}
