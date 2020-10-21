import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/data/gym_repository.dart';
import 'package:pokedex/widgets/gym_widget.dart';

class GymMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gymRepository = GymRepository();

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
                .getAll()
                .map(
                  (gym) => GymWidget(gym: gym),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
