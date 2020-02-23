import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _numbersList = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addMoreImages();

    _scrollController.addListener( () {

      if ( _scrollController.position.pixels == _scrollController.position.maxScrollExtent )
        {
          //_addMoreImages();
          fetchData();
        }

    });

    @override
    void dispose() {
      super.dispose();
      _scrollController.dispose();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists'),
      ),

      body:  Stack(
          children: <Widget>[
            _createList(),
             _loader()
          ],
      ) ,

    );
  }

  Widget _createList() {

    return RefreshIndicator(
      onRefresh: reload,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _numbersList.length,
          itemBuilder: (BuildContext context, int index) {

            final image = _numbersList[index];

            return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/500/300/?image=$image')
            );
          },

      ),
    );

  }

  Future<Null> reload() async{
    final duration = new Duration( seconds: 2 );
    new Timer( duration, () {

      _numbersList.clear();
      _lastItem++;
      _addMoreImages();

    });

    return Future.delayed(duration);
  }


  void _addMoreImages() {

    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _numbersList.add(_lastItem);
    }

    setState(() {

    });

  }

  Future<Null> fetchData() async {

    _isLoading = true;

    setState(() {

      final duration = new Duration( seconds: 2);
      return new Timer( duration, responseHTTP);

    });

  }

  void responseHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn
    );
    _addMoreImages();
  }

  Widget _loader() {

    /*if( _isLoading ) {
      return CircularProgressIndicator();
    } else {
      return Container();
    }*/

    if( _isLoading ) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }


  }


}
