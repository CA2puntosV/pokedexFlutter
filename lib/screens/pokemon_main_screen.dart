import 'package:pokedex/data/pokemon_repository.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PokemonMainScreen extends StatefulWidget {
  @override
  PokemonMainScreenState createState() => PokemonMainScreenState();
}

class PokemonMainScreenState extends State<PokemonMainScreen> {
  final pokemonRepository = PokemonRepository();
  var showMenu = false;
  var limit;
  var order;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://www.setwallpapers.com/download/962/all-pokeballs-wallpaper'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Image.asset('assets/pokedex.png'),
          actions: [
            Image.network(
              'https://www.pcactual.com/medio/2016/07/26/pokebolas.png',
              width: 160,
            ),
          ],
        ),
        drawer: Drawer(
          child: new ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Cristian David Acevedo Escobar'),
                accountEmail: Text('cristian2puntosv@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://instagram.fpei1-1.fna.fbcdn.net/v/t51.2885-19/s150x150/120497755_1549464121920626_6338469644010523645_n.jpg?_nc_ht=instagram.fpei1-1.fna.fbcdn.net&_nc_ohc=oQwj2aJAGP0AX9Zsjjj&oh=64ce8ea125822c701f0756ef00540272&oe=5F9FA246'),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://a-static.besthdwallpaper.com/charizard-charmander-y-charmeleon-de-pokemon-papel-pintado-2048x1536-6476_26.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Bienvenido Maestro Pokemón',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              ListTile(
                title: Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: Text('Perfil'),
                  ),
                ),
                trailing: Icon(Icons.account_circle),
              ),
              ListTile(
                title: Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: Text('Amigos'),
                  ),
                ),
                trailing: Icon(Icons.contacts),
              ),
              ListTile(
                title: Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: Text('Mensajes'),
                  ),
                ),
                trailing: Icon(Icons.message),
              ),
              ListTile(
                title: Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: Text('Cerrar Sesión'),
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: Text('Ayuda'),
                  ),
                ),
                trailing: Icon(Icons.info_outline),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (tabIndex) {
            print(tabIndex);
            if (tabIndex == 1) {
              Navigator.of(context).pushNamed(
                '/trainer',
              );
            }
            if (tabIndex == 2) {
              Navigator.of(context).pushNamed(
                '/gym',
              );
            }
          },
          backgroundColor: Colors.grey,
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
            children: pokemonRepository
                .getAll(limit: limit, order: order)
                .map(
                  (pokemon) => PokemonWidget(pokemon: pokemon),
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
                          backgroundColor: Color(0xffffe137),
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
                                              title: Text('Por tipo'),
                                              value: 2,
                                              groupValue: orderSelected,
                                              onChanged: (value) {
                                                orderSelected = value;
                                                setStateTwo(() {});
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text('Por número'),
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
                                        color: Color(0xffffe137),
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
                          backgroundColor: Color(0xffffe137),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                final nameController = TextEditingController();
                                final numberController =
                                    TextEditingController();
                                final photoController = TextEditingController();
                                final typeController = TextEditingController();
                                final errorController = TextEditingController();

                                return AlertDialog(
                                  title: Text(
                                    'Añadir Pokemon',
                                  ),
                                  content: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      Image.network(
                                        'https://fotosparafacebook.es/wp-content/uploads/2016/07/pokemon-portadas-para-facebook-Fotosparafacebook.es-4.png',
                                      ),
                                      TextFormField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                          icon: Icon(FontAwesomeIcons.bullseye),
                                          labelText:
                                              'Ingresa el nombre del Pokemon',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        maxLength: 20,
                                      ),
                                      TextField(
                                        controller: numberController,
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.linear_scale),
                                          labelText: 'Ingresa el número',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        maxLength: 4,
                                        maxLengthEnforced: true,
                                        keyboardType: TextInputType.number,
                                      ),
                                      TextField(
                                        controller: typeController,
                                        decoration: InputDecoration(
                                          icon:
                                              Icon(FontAwesomeIcons.angellist),
                                          labelText: 'Ingresa el tipo',
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
                                        final number = numberController.text;
                                        final type = typeController.text;
                                        final photo = photoController.text;

                                        if (name.isEmpty ||
                                            number.isEmpty ||
                                            photo.isEmpty ||
                                            type.isEmpty) {
                                          errorController.text =
                                              'No puede dejar campos vacíos';
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Text(
                                                  'No puede dejar campos vacíos'),
                                            ),
                                          );
                                        } else if (pokemonRepository
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
                                        } else if (pokemonRepository
                                            .numberExists(int.parse(number))) {
                                          errorController.text =
                                              'Ya existe este número';
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title:
                                                  Text('Ya existe este número'),
                                            ),
                                          );
                                        } else if (pokemonRepository
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
                                          var pokemon = Pokemon(
                                            name: name,
                                            number: int.parse(number),
                                            type: type,
                                            photoUrl: photo,
                                          );
                                          pokemonRepository.create(pokemon);
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
              backgroundColor: Colors.red,
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
