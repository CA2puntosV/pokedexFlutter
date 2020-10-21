import 'package:pokedex/models/pokemon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonWidget extends StatelessWidget {
  final Pokemon pokemon;

  PokemonWidget({
    this.pokemon,
  });

  Color typeToColor(String type) {
    switch (type) {
      case 'Bicho':
        return Color(0xff729f3f);
      case 'Fuego':
        return Color(0xfffe7e24);
      case 'Hada':
        return Color(0xfffdb9e9);
      case 'Psíquico':
        return Color(0xfffdb9e9);
      case 'Hielo':
        return Color(0xff51c4e7);
    }
  }

  @override
  Widget build(BuildContext context) {
    var widgetType = (String type) => Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: typeToColor(type),
          ),
          child: Text(
            type,
            style: TextStyle(color: Colors.black),
          ),
        );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            pokemon.photoUrl,
            height: 100,
          ),
          Text(
            'N.° ${pokemon.number}',
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '${pokemon.name}',
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          widgetType(pokemon.type),
        ],
      ),
    );
  }
}
