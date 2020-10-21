import 'package:pokedex/models/gym.dart';

class GymRepository {
  final _GYM_LIST = [
    Gym(
      PhotoUrl:
          'https://vignette.wikia.nocookie.net/espokemon/images/0/06/Exterior_Gimnasio_Plateada_HGSS.png/revision/latest?cb=20150913231551',
      name: 'Gimnasio de Ciudad Plateada',
      region: 'Kanto',
      lider: 'Brock',
    ),
    Gym(
      PhotoUrl:
          'https://vignette.wikia.nocookie.net/espokemon/images/2/2f/Gimnacio_F%C3%A9rrica.jpg/revision/latest?cb=20090407163744',
      name: 'Gimnasio de Ciudad Férrica',
      region: 'Hoenn',
      lider: 'Petra',
    ),
    Gym(
      PhotoUrl: 'https://www.pkparaiso.com/hgss/johto/045.png',
      name: 'Gimnasio de Ciudad Malva',
      region: 'Johto',
      lider: 'Pegaso',
    ),
    Gym(
      PhotoUrl:
          'https://vignette.wikia.nocookie.net/espokemon/images/8/89/Gimnasio_Gres.png/revision/latest?cb=20110322191334',
      name: 'Gimnasio de Ciudad Gres',
      region: 'Teselia',
      lider: 'Millo / Zeo / Maíz',
    ),
  ];

  List<Gym> getAll() {
    return _GYM_LIST;
  }
}
