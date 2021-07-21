import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

final List data = [];

class Swipecard extends StatefulWidget {
  const Swipecard({Key? key}) : super(key: key);

  @override
  _SwipecardState createState() => _SwipecardState();
}

class _SwipecardState extends State<Swipecard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Stack(
                children: <Widget>[
                  Card(Colors.blue),
                  Card(Colors.red),
                  Card(Colors.yellow),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Card extends StatelessWidget {
  final MaterialColor rancolor;
  Card(this.rancolor);

  @override
  Widget build(BuildContext context) {
    return Swipable(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: rancolor,
        ),
      ),
    );
  }
}
