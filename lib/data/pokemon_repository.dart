import 'package:pokedex/models/pokemon.dart';

class PokemonRepository {
  final _POKEMON_LIST = [
    Pokemon(
      name: 'Cleffa',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/173.png',
      number: 173,
      type: 'Hada',
    ),
    Pokemon(
      name: 'TePig',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/498.png',
      number: 498,
      type: 'Fuego',
    ),
    Pokemon(
      name: 'Alakazam',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/065.png',
      number: 065,
      type: 'Psíquico',
    ),
    Pokemon(
      name: 'Cinderace',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/815.png',
      number: 815,
      type: 'Fuego',
    ),
    Pokemon(
      name: 'Avalugg',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/713.png',
      number: 713,
      type: 'Hielo',
    ),
    Pokemon(
      name: 'Snubbull',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/209.png',
      number: 209,
      type: 'Hada',
    ),
    Pokemon(
      name: 'Volbeat',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/313.png',
      number: 313,
      type: 'Bicho',
    ),
    Pokemon(
      name: 'Magmar',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/126.png',
      number: 126,
      type: 'Fuego',
    ),
    Pokemon(
      name: 'Spinarak',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/167.png',
      number: 167,
      type: 'Bicho',
    ),
    Pokemon(
      name: 'Floette',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/670.png',
      number: 670,
      type: 'Hada',
    ),
    Pokemon(
      name: 'Spheal',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/363.png',
      number: 363,
      type: 'Hielo',
    ),
    Pokemon(
      name: 'Unown',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/201.png',
      number: 201,
      type: 'Psíquico',
    ),
    Pokemon(
      name: 'Quilava',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/156.png',
      number: 156,
      type: 'Fuego',
    ),
    Pokemon(
      name: 'Lunala',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/792.png',
      number: 792,
      type: 'Psíquico',
    ),
    Pokemon(
      name: 'Piloswine',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/221.png',
      number: 221,
      type: 'Hielo',
    ),
    Pokemon(
      name: 'Vulpix',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/037.png',
      number: 037,
      type: 'Fuego',
    ),
    Pokemon(
      name: 'Dustox',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/269.png',
      number: 269,
      type: 'Bicho',
    ),
    Pokemon(
      name: 'Dewgong',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/087.png',
      number: 087,
      type: 'Hielo',
    ),
    Pokemon(
      name: 'Bergmite',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/712.png',
      number: 712,
      type: 'Hielo',
    ),
    Pokemon(
      name: 'Jigglypuff',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/039.png',
      number: 039,
      type: 'Hada',
    ),
    Pokemon(
      name: 'Spoink',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/325.png',
      number: 325,
      type: 'Psíquico',
    ),
    Pokemon(
      name: 'Natu',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/177.png',
      number: 177,
      type: 'Psíquico',
    ),
    Pokemon(
      name: 'Magearna',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/801.png',
      number: 801,
      type: 'Hada',
    ),
    Pokemon(
      name: 'Sylveon',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/700.png',
      number: 700,
      type: 'Hada',
    ),
    Pokemon(
      name: 'Hypo',
      photoUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/097.png',
      number: 097,
      type: 'Psíquico',
    )
  ];

  List<Pokemon> getAll() {
    return _POKEMON_LIST;
  }

  create(Pokemon pokemon) {
    _POKEMON_LIST.add(pokemon);
  }

  Pokemon get(String id) {
    return Pokemon();
  }

  nameExists(String name) {
    return _POKEMON_LIST.any((pokemon) => pokemon.name == name);
  }

  update(Pokemon pokemon) {}

  delete(String id) {}
}
