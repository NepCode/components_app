import 'package:flutter/cupertino.dart';
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
           _cardType1(),
          SizedBox(height: 30.0),
          _cardType2()
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
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
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

  Widget _cardType2() {

    final card = Card(
      clipBehavior: Clip.antiAlias,
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: <Widget>[

          FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
              fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.cover,
            height: 300.0,
          ),
          //Image(image: NetworkImage('https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80')),
          Container(
            padding: EdgeInsets.all(10.0),
              child: Text('idk what to do')
          ),
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Card Title'),
            subtitle: Text('Card Subtitle'),
          )
          /*,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () { }, child: Text('Cancel')),
              FlatButton(onPressed: null, child: Text('ok'))
            ],
          )*/
        ],
      ),
    );


    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        //color: Colors.red
       /* boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.white,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]*/
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: card,
      ),

    );


  }


}