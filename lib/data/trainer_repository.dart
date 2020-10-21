import 'package:pokedex/models/trainer.dart';

class TrainerRepository {
  final _TRAINER_LIST = [
    Trainer(
      TphotoUrl:
          'https://cdn.bulbagarden.net/upload/a/a4/Black_White_Hilbert.png',
      Tname: 'Hilbert',
      gender: 'Masculino',
      town: 'Nuvema Town',
    ),
    Trainer(
      TphotoUrl:
          'https://vignette.wikia.nocookie.net/pokemon/images/e/e1/Crystal_Kris.png/revision/latest/scale-to-width-down/282?cb=20151010072014',
      Tname: 'Kris',
      gender: 'Femenino',
      town: 'New Bark Town',
    ),
    Trainer(
      TphotoUrl:
          'https://i.pinimg.com/originals/fb/af/de/fbafde067ef637e7e05db22deff34a18.png',
      Tname: 'Elaine',
      gender: 'Femenino',
      town: 'Pallet Town',
    ),
    Trainer(
      TphotoUrl:
          'https://www.pngmart.com/files/12/Pokemon-Ash-Ketchum-PNG-File.png',
      Tname: 'Ash',
      gender: 'Masculino',
      town: 'Pallet Town',
    ),
    Trainer(
      TphotoUrl:
          'https://vignette.wikia.nocookie.net/espokemon/images/3/35/Bruno_ROZA_%28Ilustraci%C3%B3n%29.png/revision/latest?cb=20140612155126',
      Tname: 'Bruno',
      gender: 'Masculino',
      town: 'Villa Raíz',
    ),
    Trainer(
      TphotoUrl:
          'https://images.wikidexcdn.net/mwuploads/wikidex/2/23/latest/20200322082336/Blue_Adventures.png',
      Tname: 'Green',
      gender: 'Femenino',
      town: 'Pallet Town',
    ),
    Trainer(
      TphotoUrl:
          'https://vignette.wikia.nocookie.net/espokemon/images/b/b5/May.png/revision/latest?cb=20120305164046',
      Tname: 'May',
      gender: 'Femenino',
      town: 'Ciudad Petalia',
    ),
    Trainer(
      TphotoUrl:
          'https://images.wikidexcdn.net/mwuploads/wikidex/5/50/latest/20190606031149/Protagonista_chico_EPEC.png',
      Tname: 'Victor',
      gender: 'Masculino',
      town: 'Pueblo Yarda',
    ),
    Trainer(
      TphotoUrl:
          'https://vignette.wikia.nocookie.net/espokemon/images/7/74/Protagonista_masculino_SL.png/revision/latest?cb=20160602134958',
      Tname: 'Elio',
      gender: 'Masculino',
      town: 'Afueras de Hauoli',
    ),
    Trainer(
      TphotoUrl:
          'https://cdn.bulbagarden.net/upload/6/61/Black_2_White_2_Nate.png',
      Tname: 'Nate',
      gender: 'Masculino',
      town: 'Ciudad Aspertia',
    ),
    Trainer(
      TphotoUrl:
          'https://vignette.wikia.nocookie.net/fakemon/images/3/37/Hilda_Artwork.png/revision/latest/scale-to-width-down/340?cb=20131118161307&path-prefix=es',
      Tname: 'Liza',
      gender: 'Femenino',
      town: 'Pueblo Arcilla',
    ),
    Trainer(
      TphotoUrl:
          'https://i.pinimg.com/originals/9a/4d/36/9a4d3689c527bcf9d7febc39eaa2f4f9.png',
      Tname: 'Serena',
      gender: 'Femenino',
      town: 'Pueblo Vaniville',
    ),
  ];

  List<Trainer> getAll() {
    return _TRAINER_LIST;
  }
}
