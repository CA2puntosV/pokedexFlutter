import 'package:flutter/material.dart';
import 'package:pokedex/widgets/trainner_widget.dart';
import 'package:pokedex/data/trainer_repository.dart';

class TrainerMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final trainerRepository = TrainerRepository();

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
                .getAll()
                .map(
                  (trainer) => TrainerWidget(trainer: trainer),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
