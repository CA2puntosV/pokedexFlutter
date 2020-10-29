import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/trainer.dart';

class TrainerWidget extends StatelessWidget {
  final Trainer trainer;

  TrainerWidget({
    this.trainer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            trainer.tphotoUrl,
            height: 150,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xff005acb), width: 2.5),
              ),
            ),
            child: Text(
              '${trainer.tname}',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xffffe137),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Género: ${trainer.gender}',
            style: TextStyle(
              fontSize: 10.5,
              color: Colors.white,
            ),
          ),
          Text(
            'Pueblo: ${trainer.town}',
            style: TextStyle(
              fontSize: 10.5,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
