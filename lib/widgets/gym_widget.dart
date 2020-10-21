import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/gym.dart';

class GymWidget extends StatefulWidget {
  final Gym gym;

  GymWidget({
    this.gym,
  });

  @override
  GymWidgetState createState() => GymWidgetState();
}

class GymWidgetState extends State<GymWidget> {
  var selected = false;

  Color typeToColor(String lider) {
    switch (lider) {
      case 'Brock':
        return Color(0xff3C500C);
      case 'Petra':
        return Color(0xff50180C);
      case 'Pegaso':
        return Color(0xff49197A);
      case 'Millo / Zeo / Maíz':
        return Color(0xffF3944E);
    }
  }

  @override
  Widget build(BuildContext context) {
    var widgetType = (String type) => GestureDetector(
          onTap: () {
            selected = !selected;
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: typeToColor(type),
            ),
            child: Text(
              type,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: selected ? Color.fromRGBO(242, 242, 150, .3) : null,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.network(
              widget.gym.PhotoUrl,
              height: 130,
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              '${widget.gym.name}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            RichText(
              text: TextSpan(
                text: 'Región: ',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff00FFE0),
                ),
                children: [
                  TextSpan(
                    text: '${widget.gym.region}',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Lider: ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff00FFE0),
                  ),
                ),
                widgetType(widget.gym.lider),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
