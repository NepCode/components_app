import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {

  static final pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[

          Container(
            margin: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://media.resources.festicket.com/image/300x300/center/top/filters:quality(70)/www/artists/BillieEilish.jpg'),
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('AA'),
              backgroundColor: Colors.red,
            ),
          )
        ],
      ),


      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://cdn.motor1.com/images/mgl/2Y3bx/s3/mclaren-p1.jpg?%3E'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),


    );
  }
}