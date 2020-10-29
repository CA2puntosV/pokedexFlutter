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

  List<Gym> getAll({int limit, int order}) {
    var result = _GYM_LIST;

    if (order != null) {
      switch (order) {
        case 1:
          _GYM_LIST.sort((gymA, gymB) => gymA.name.compareTo(gymB.name));
          break;
        case 2:
          _GYM_LIST.sort((gymA, gymB) => gymA.region.compareTo(gymB.region));
          break;
        case 3:
          _GYM_LIST.sort((gymA, gymB) => gymA.lider.compareTo(gymB.lider));
          break;
      }
    }

    if (limit != null) {
      limit = limit > _GYM_LIST.length ? _GYM_LIST.length : limit;

      result = _GYM_LIST.sublist(0, limit);
    }

    return result;
  }

  create(Gym gym) {
    return Gym();
  }

  //Si se repite

  nameExists(String name) {
    return _GYM_LIST.any((gym) => gym.name == name);
  }

  photoExists(String photoUrl) {
    return _GYM_LIST.any((gym) => gym.PhotoUrl == photoUrl);
  }

  update(Gym gym) {}

  delete(String id) {}
}
