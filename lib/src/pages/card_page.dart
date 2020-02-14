import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        //padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
           _cardType1()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _cardType1() {

    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Card Title'),
            subtitle: Text('Card Subtitle'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () { }, child: Text('Cancel')),
              FlatButton(onPressed: null, child: Text('ok'))
            ],
          )
        ],
      ),
    );
  }
}