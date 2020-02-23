import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 100.0;
  bool _lockCheck = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),

      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
             _createSlider(),
             _checkBox(),
             _createSwitch(),
            Text(_sliderValue.toString()),
            Expanded(child: _loadImage()),
          ],
          
        ),
      ),

    );
  }

  Widget _createSlider() {
    
    return Slider(
      activeColor: Colors.indigoAccent,
        label: 'size image',
        //divisions: 20,
        value: _sliderValue,
        min: 10.0,
        max: 400.0,
       /* onChanged: (value) {
          print(value);
          setState(() {
            _sliderValue = value;
          });

        }*/
        onChanged: ( _lockCheck ) ? null : (value ) {
          print(value);
          setState(() {
            _sliderValue = value;
          });

        }
    );
  }

  _loadImage() {
    return Image(
        image: NetworkImage('https://s3.amazonaws.com/nrescontent/US/R326/PalmSprings_1.jpg'),
        width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _checkBox() {

   /* return Checkbox(
        value: _lockCheck,
        onChanged: (value) {
          print(value);
          setState(() {
            _lockCheck = value;
          });
        }
    );*/
   
   return CheckboxListTile(
     title: Text('lock slider?'),
       value: _lockCheck,
       onChanged: (value) {
       setState(() {
         _lockCheck = value;
       });
   }
   );
   
  }

  Widget _createSwitch() {

    return SwitchListTile(
        title: Text('lock slider?'),
        value: _lockCheck,
        onChanged: (value) {
          setState(() {
            _lockCheck = value;
          });
        }
    );

  }
}
