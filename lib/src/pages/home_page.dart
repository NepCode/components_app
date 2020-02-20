import 'package:flutter/material.dart';
import 'package:flutter_app_components/src/pages/alert_page.dart';
import 'package:flutter_app_components/src/providers/menu_provider.dart';
import 'package:flutter_app_components/src/utils/icon_string_util.dart';


class HomePage extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {

    ///print(menuProvider.options );
    /*menuProvider.loadData()
      .then((options) {
      print('_lista');
      print(options);
    });
    return ListView(
      children: _listItems(),
    );*/
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        //print('builder');
        //print(snapshot.data);
        return  ListView(
          children: _listItems( snapshot.data, context),
        );
      },

    );
  }

  List<Widget> _listItems( List<dynamic> data, context) {
    
    /*return[
      ListTile(title: Text("hello world")),
      Divider(),
      ListTile(title: Text("hello world")),
      Divider(),
      ListTile(title: Text("hello world")),
      Divider()
    ];*/

    final List<Widget> options = [];

    data.forEach( (opt)  {
      final widgetTemp = ListTile(
        title: Text(opt['text']),
        leading: getIcon( opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: () {
         /* final route = MaterialPageRoute(
            builder: (context) =>  AlertPage()
          );
          Navigator.push(context, route);*/
         Navigator.pushNamed(context, opt['route']);
        },
      );

      options..add( widgetTemp)
            ..add(Divider());
    });

    return options;
  }

}

