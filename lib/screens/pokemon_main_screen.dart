import 'package:pokedex/data/pokemon_repository.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonMainScreen extends StatefulWidget {
  @override
  PokemonMainScreenState createState() => PokemonMainScreenState();
}

class PokemonMainScreenState extends State<PokemonMainScreen> {
  Widget build(BuildContext context) {
    final pokemonRepository = PokemonRepository();

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
                .getAll()
                .map(
                  (pokemon) => PokemonWidget(pokemon: pokemon),
                )
                .toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffffe137),
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                final nameController = TextEditingController();
                final numberController = TextEditingController();
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
                        'https://wallpaperaccess.com/full/11914.jpg',
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'puto';
                          }
                        },
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Ingresa el nombre',
                        ),
                        maxLength: 20,
                      ),
                      TextField(
                        controller: numberController,
                        decoration:
                            InputDecoration(labelText: 'Ingresa el número'),
                        maxLength: 4,
                        maxLengthEnforced: true,
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: typeController,
                        decoration:
                            InputDecoration(labelText: 'Ingresa el tipo'),
                        maxLength: 15,
                      ),
                      TextField(
                        controller: photoController,
                        decoration:
                            InputDecoration(labelText: 'Ingresa la foto'),
                      ),
                    ],
                  ),
                  actions: [
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
                          errorController.text = 'No puede dejar campos vacíos';
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('No puede dejar campos vacíos'),
                            ),
                          );
                        } else if (pokemonRepository.nameExists(name)) {
                          errorController.text = 'Ya existe este nombre';
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
                      child: Text('Guardar'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
