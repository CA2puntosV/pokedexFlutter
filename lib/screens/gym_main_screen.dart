import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/gym.dart';
import 'package:pokedex/data/gym_repository.dart';
import 'package:pokedex/widgets/gym_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GymMainScreen extends StatefulWidget {
  @override
  GymMainScreenState createState() => GymMainScreenState();
}

class GymMainScreenState extends State<GymMainScreen> {
  final gymRepository = GymRepository();
  var showMenu = false;
  var limit;
  var order;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://i.pinimg.com/originals/c5/a4/e0/c5a4e0047d3a215c91d6b9e1008ff31a.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Image.asset(
            'assets/gym.png',
            height: 50,
          ),
          centerTitle: true,
          actions: [
            Image.network(
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/99ab3523-bf7a-48a2-8a38-47f0b2cf082a/d2qgn7z-60afc6a5-536e-43f7-b081-9328eb1fa476.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvOTlhYjM1MjMtYmY3YS00OGEyLThhMzgtNDdmMGIyY2YwODJhXC9kMnFnbjd6LTYwYWZjNmE1LTUzNmUtNDNmNy1iMDgxLTkzMjhlYjFmYTQ3Ni5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.-lBWW3Y4NsS2Ef2jDrP0acpFlAjWKbm3lm1Y6AxwB4c'),
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
            if (tabIndex == 1) {
              Navigator.of(context).pushNamed(
                '/trainer',
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
            children: gymRepository
                .getAll(limit: limit, order: order)
                .map(
                  (gym) => GymWidget(gym: gym),
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
                          backgroundColor: Colors.brown,
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
                                              title: Text('Por región'),
                                              value: 2,
                                              groupValue: orderSelected,
                                              onChanged: (value) {
                                                orderSelected = value;
                                                setStateTwo(() {});
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text('Por líder'),
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
                                        color: Colors.brown,
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
                          backgroundColor: Colors.brown,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                final nameController = TextEditingController();
                                final regionController =
                                    TextEditingController();
                                final photoController = TextEditingController();
                                final leaderController =
                                    TextEditingController();
                                final errorController = TextEditingController();

                                return AlertDialog(
                                  title: Text(
                                    'Añadir Gimnasio Pokemon',
                                  ),
                                  content: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      Image.network(
                                        'https://c4.wallpaperflare.com/wallpaper/77/185/192/pokemon-go-4k-high-def-for-mac-wallpaper-preview.jpg',
                                      ),
                                      TextFormField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                          icon: Icon(FontAwesomeIcons.vihara),
                                          labelText:
                                              'Ingresa el nombre del Gimnasio',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        maxLength: 20,
                                      ),
                                      TextField(
                                        controller: regionController,
                                        decoration: InputDecoration(
                                          icon: Icon(
                                              FontAwesomeIcons.mapMarkedAlt),
                                          labelText: 'Ingresa la región',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        maxLength: 20,
                                        maxLengthEnforced: true,
                                        keyboardType: TextInputType.number,
                                      ),
                                      TextField(
                                        controller: leaderController,
                                        decoration: InputDecoration(
                                          icon:
                                              Icon(FontAwesomeIcons.userNinja),
                                          labelText:
                                              'Ingresa el nombre del líder',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        maxLength: 15,
                                      ),
                                      TextField(
                                        controller: photoController,
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
                                        final name = nameController.text;
                                        final region = regionController.text;
                                        final leader = leaderController.text;
                                        final photo = photoController.text;

                                        if (name.isEmpty ||
                                            region.isEmpty ||
                                            photo.isEmpty ||
                                            leader.isEmpty) {
                                          errorController.text =
                                              'No puede dejar campos vacíos';
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Text(
                                                  'No puede dejar campos vacíos'),
                                            ),
                                          );
                                        } else if (gymRepository
                                            .nameExists(name)) {
                                          errorController.text =
                                              'Ya existe este nombre';
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title:
                                                  Text('Ya existe este nombre'),
                                            ),
                                          );
                                        } else if (gymRepository
                                            .photoExists(photo)) {
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
                                          var gym = Gym(
                                            name: name,
                                            region: region,
                                            lider: leader,
                                            PhotoUrl: photo,
                                          );
                                          gymRepository.create(gym);
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
              backgroundColor: Colors.green,
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
