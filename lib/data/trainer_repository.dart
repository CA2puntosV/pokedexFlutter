import 'package:pokedex/models/trainer.dart';

class TrainerRepository {
  final _TRAINER_LIST = [
    Trainer(
      tphotoUrl:
          'https://cdn.bulbagarden.net/upload/a/a4/Black_White_Hilbert.png',
      tname: 'Hilbert',
      gender: 'Masculino',
      town: 'Nuvema Town',
    ),
    Trainer(
      tphotoUrl:
          'https://vignette.wikia.nocookie.net/pokemon/images/e/e1/Crystal_Kris.png/revision/latest/scale-to-width-down/282?cb=20151010072014',
      tname: 'Kris',
      gender: 'Femenino',
      town: 'New Bark Town',
    ),
    Trainer(
      tphotoUrl:
          'https://i.pinimg.com/originals/fb/af/de/fbafde067ef637e7e05db22deff34a18.png',
      tname: 'Elaine',
      gender: 'Femenino',
      town: 'Pallet Town',
    ),
    Trainer(
      tphotoUrl:
          'https://www.pngmart.com/files/12/Pokemon-Ash-Ketchum-PNG-File.png',
      tname: 'Ash',
      gender: 'Masculino',
      town: 'Pallet Town',
    ),
    Trainer(
      tphotoUrl:
          'https://vignette.wikia.nocookie.net/espokemon/images/3/35/Bruno_ROZA_%28Ilustraci%C3%B3n%29.png/revision/latest?cb=20140612155126',
      tname: 'Bruno',
      gender: 'Masculino',
      town: 'Villa Raíz',
    ),
    Trainer(
      tphotoUrl:
          'https://images.wikidexcdn.net/mwuploads/wikidex/2/23/latest/20200322082336/Blue_Adventures.png',
      tname: 'Green',
      gender: 'Femenino',
      town: 'Pallet Town',
    ),
    Trainer(
      tphotoUrl:
          'https://vignette.wikia.nocookie.net/espokemon/images/b/b5/May.png/revision/latest?cb=20120305164046',
      tname: 'May',
      gender: 'Femenino',
      town: 'Ciudad Petalia',
    ),
    Trainer(
      tphotoUrl:
          'https://images.wikidexcdn.net/mwuploads/wikidex/5/50/latest/20190606031149/Protagonista_chico_EPEC.png',
      tname: 'Victor',
      gender: 'Masculino',
      town: 'Pueblo Yarda',
    ),
    Trainer(
      tphotoUrl:
          'https://vignette.wikia.nocookie.net/espokemon/images/7/74/Protagonista_masculino_SL.png/revision/latest?cb=20160602134958',
      tname: 'Elio',
      gender: 'Masculino',
      town: 'Afueras de Hauoli',
    ),
    Trainer(
      tphotoUrl:
          'https://cdn.bulbagarden.net/upload/6/61/Black_2_White_2_Nate.png',
      tname: 'Nate',
      gender: 'Masculino',
      town: 'Ciudad Aspertia',
    ),
    Trainer(
      tphotoUrl:
          'https://vignette.wikia.nocookie.net/fakemon/images/3/37/Hilda_Artwork.png/revision/latest/scale-to-width-down/340?cb=20131118161307&path-prefix=es',
      tname: 'Liza',
      gender: 'Femenino',
      town: 'Pueblo Arcilla',
    ),
    Trainer(
      tphotoUrl:
          'https://i.pinimg.com/originals/9a/4d/36/9a4d3689c527bcf9d7febc39eaa2f4f9.png',
      tname: 'Serena',
      gender: 'Femenino',
      town: 'Pueblo Vaniville',
    ),
  ];

  List<Trainer> getAll({int limit, int order}) {
    var result = _TRAINER_LIST;

    if (order != null) {
      switch (order) {
        case 1:
          _TRAINER_LIST
              .sort((traiA, traiB) => traiA.tname.compareTo(traiB.tname));
          break;
        case 2:
          _TRAINER_LIST
              .sort((traiA, traiB) => traiA.gender.compareTo(traiB.gender));
          break;
        case 3:
          _TRAINER_LIST
              .sort((traiA, traiB) => traiA.town.compareTo(traiB.town));
          break;
      }
    }

    if (limit != null) {
      limit = limit > _TRAINER_LIST.length ? _TRAINER_LIST.length : limit;

      result = _TRAINER_LIST.sublist(0, limit);
    }

    return result;
  }

  create(Trainer trainer) {
    _TRAINER_LIST.add(trainer);
  }

  Trainer get(String id) {
    return Trainer();
  }

  //Si se repiten

  nameExists(String tname) {
    return _TRAINER_LIST.any((trainer) => trainer.tname == tname);
  }

  photoExists(String tphotoUrl) {
    return _TRAINER_LIST.any((trainer) => trainer.tphotoUrl == tphotoUrl);
  }

  update(Trainer trainer) {}

  delete(String id) {}
}
