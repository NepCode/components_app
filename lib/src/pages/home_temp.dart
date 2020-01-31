import 'package:flutter/material.dart';



class HomePageTemp extends StatelessWidget {

  final optionsList = ['one','two','three','four','five'];
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Temporal Components'),
      ),
      body: ListView(
        //children: _createItems()
        children: _createItemsShortMethod()
      ),
    );
  }


  List<Widget> _createItems() {

    List<Widget> list = new List<Widget>();
    
   /* for ( String opt in optionsList) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      list.add( tempWidget );
      list.add( Divider() );
    }*/

    for ( String opt in optionsList) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      list..add( tempWidget )
          ..add(Divider());
    }
    return list;
  }

  List<Widget> _createItemsShortMethod() {
    return optionsList.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Anything'),
            leading: Icon(Icons.add_alarm),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          //Divider()
        ],
      );
    }).toList();
  }

}