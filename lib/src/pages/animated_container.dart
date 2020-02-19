import 'package:flutter/material.dart';
import 'dart:math';


class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width  = 50.0;
  double _height = 50.0;
  Color  _color  = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('animated Container'),
      ),
      body: Center(
          child: AnimatedContainer(
            duration: Duration( seconds: 1 ),
            curve: Curves.fastOutSlowIn,
            width: _width,
            height: _height,
            decoration: BoxDecoration(
                borderRadius: _borderRadius,
                color: _color
            ),
          )
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: _shapeShifter,
    ),
    );
  }

  void _shapeShifter() {
    // Instantiate a Random class object
    Random rnd = new Random();

    setState(() {

      _width = rnd.nextInt(300).toDouble();
      _height = rnd.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          rnd.nextInt(255),
          rnd.nextInt(255),
          rnd.nextInt(255),
          1);

      _borderRadius = BorderRadius.circular( rnd.nextInt(100).toDouble() );


    });
  }
}
