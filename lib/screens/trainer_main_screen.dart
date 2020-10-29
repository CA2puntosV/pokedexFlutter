import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokedex/models/trainer.dart';
import 'package:pokedex/widgets/trainner_widget.dart';
import 'package:pokedex/data/trainer_repository.dart';

class TrainerMainScreen extends StatefulWidget {
  @override
  TrainerMainScreenState createState() => TrainerMainScreenState();
}

class TrainerMainScreenState extends State<TrainerMainScreen> {
  final trainerRepository = TrainerRepository();
  var showMenu = false;
  var limit;
  var order;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              NetworkImage('https://cdn.wallpapersafari.com/51/32/SgQOMz.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Image.asset(
            'assets/trainers.png',
            height: 40,
          ),
          centerTitle: true,
          actions: [
            Image.network(
                'https://www.d20radio.com/main/wp-content/uploads/2019/04/Pokemon-GO-GEN-4-Pokedex.png')
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (tabIndex) {
            print(tabIndex);
            if (tabIndex == 0) {
              Navigator.of(context).pushNamed(
                '/pokemon',
              );
            }
            if (tabIndex == 2) {
              Navigator.of(context).pushNamed(
                '/gym',
              );
            }
          },
          unselectedItemColor: Color(0xff005acb),
          selectedItemColor: Colors.red,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.games,
                color: Color(0xffffe137),
              ),
              title: Text('Pokemon'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.directions_run,
                color: Color(0xffffe137),
              ),
              title: Text('Entrenadores'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance,
                color: Color(0xffffe137),
              ),
              title: Text('Gimnasios'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Color(0xffffe137),
              ),
              title: Text('Ajustes'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Wrap(
            children: trainerRepository
                .getAll(limit: limit, order: order)
                .map(
                  (trainer) => TrainerWidget(trainer: trainer),
                )
                .toList(),
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 700),
              child: !showMenu
                  ? SizedBox()
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.red,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                final limitController = TextEditingController();
                                limitController.text = '${limit ?? 0}';
                                var orderSelected = order;
                                return AlertDialog(
                                  title: Text('Filtro'),
                                  content: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Límite Máximo'),
                                        controller: limitController,
                                        keyboardType: TextInputType.number,
                                      ),
                                      StatefulBuilder(
                                          builder: (context, setStateTwo) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            RadioListTile(
                                              title: Text('Por nombre'),
                                              value: 1,
                                              groupValue: orderSelected,
                                              onChanged: (value) {
                                                orderSelected = value;
                                                setStateTwo(() {});
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text('Por género'),
                                              value: 2,
                                              groupValue: orderSelected,
                                              onChanged: (value) {
                                                orderSelected = value;
                                                setStateTwo(() {});
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text('Por pueblo'),
                                              value: 3,
                                              groupValue: orderSelected,
                                              onChanged: (value) {
                                                orderSelected = value;
                                                setStateTwo(() {});
                                              },
                                            ),
                                          ],
                                        );
                                      }),
                                      FlatButton(
                                        color: Colors.red,
                                        onPressed: () {
                                          limit = limitController.text.isEmpty
                                              ? null
                                              : int.parse(limitController.text);
                                          order = orderSelected;
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        child: Text('Filtrar'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Icon(FontAwesomeIcons.filter),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.red,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                final tnameController = TextEditingController();
                                final townController = TextEditingController();
                                final tphotoController =
                                    TextEditingController();
                                final genderController =
                                    TextEditingController();
                                final errorController = TextEditingController();

                                return AlertDialog(
                                  title: Text(
                                    'Añadir Entrenador',
                                  ),
                                  content: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      Image.network(
                                        'https://cdn.atomix.vg/wp-content/uploads/2014/11/ghost-pokemon.jpg',
                                      ),
                                      TextFormField(
                                        controller: tnameController,
                                        decoration: InputDecoration(
                                          icon: Icon(FontAwesomeIcons.hiking),
                                          labelText:
                                              'Ingresa el nombre del Entrenador',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        maxLength: 20,
                                      ),
                                      TextField(
                                        controller: townController,
                                        decoration: InputDecoration(
                                          icon: Icon(FontAwesomeIcons.city),
                                          labelText: 'Ingresa la ciudad',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        maxLength: 20,
                                        maxLengthEnforced: true,
                                        keyboardType: TextInputType.number,
                                      ),
                                      TextField(
                                        controller: genderController,
                                        decoration: InputDecoration(
                                          icon:
                                              Icon(FontAwesomeIcons.venusMars),
                                          labelText: 'Ingresa el género',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        maxLength: 15,
                                      ),
                                      TextField(
                                        controller: tphotoController,
                                        decoration: InputDecoration(
                                          icon: Icon(FontAwesomeIcons.image),
                                          labelText: 'Ingresa la foto',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop('Cancelar');
                                      },
                                      child: Text(
                                        'Cancelar',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        final tname = tnameController.text;
                                        final town = townController.text;
                                        final gender = genderController.text;
                                        final tphoto = tphotoController.text;

                                        if (tname.isEmpty ||
                                            town.isEmpty ||
                                            tphoto.isEmpty ||
                                            gender.isEmpty) {
                                          errorController.text =
                                              'No puede dejar campos vacíos';
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Text(
                                                  'No puede dejar campos vacíos'),
                                            ),
                                          );
                                        } else if (trainerRepository
                                            .nameExists(tname)) {
                                          errorController.text =
                                              'Ya existe este nombre';
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title:
                                                  Text('Ya existe este nombre'),
                                            ),
                                          );
                                        } else if (trainerRepository
                                            .photoExists(tphoto)) {
                                          errorController.text =
                                              'Ya existe esta foto';
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title:
                                                  Text('Ya existe esta foto'),
                                            ),
                                          );
                                        } else {
                                          var trainer = Trainer(
                                            tname: tname,
                                            town: town,
                                            gender: gender,
                                            tphotoUrl: tphoto,
                                          );
                                          trainerRepository.create(trainer);
                                          Navigator.pop(context);
                                          setState(() {});
                                        }
                                      },
                                      child: Text(
                                        'Guardar',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Icon(FontAwesomeIcons.plus),
                        ),
                      ],
                    ),
            ),
            SizedBox(
              width: 3,
            ),
            FloatingActionButton(
              backgroundColor: Colors.blueAccent,
              child: Icon(!showMenu
                  ? FontAwesomeIcons.arrowLeft
                  : FontAwesomeIcons.arrowRight),
              onPressed: () {
                showMenu = !showMenu;

                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
