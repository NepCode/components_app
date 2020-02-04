import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {

  List<dynamic> options = [];

  _MenuProvider () {
    loadData();
  }

   Future<List<dynamic>> loadData() async{
   /* rootBundle.loadString('data/menu_opts.json')
        .then( (data) {
         Map dataMap = json.decode( data );
         print(dataMap['routes']);
         options = dataMap['routes'];
    });*/
   final resp = await rootBundle.loadString('data/menu_opts.json');
   Map dataMap = json.decode(resp);
   options = dataMap['routes'];

   return options;
  }
}



final menuProvider = new _MenuProvider();