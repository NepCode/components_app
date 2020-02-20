import 'dart:math';

import 'package:flutter/material.dart';



class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = '';
  String _email  = '';
  String _password  = '';
  String _date  = '';

  String _selectedOption = 'Fly';

  List<String> _powers = ['Fly', 'X Rays', 'Fire Breath', 'Strength'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs Fields'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate( context ),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPersona()
        ],
      ),
    );
  }

  Widget _createInput() {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          counter: Text('Letters ${ _name.length }'),
          hintText: 'Name',
          labelText: 'Name',
          helperText: 'Just your name',
          suffixIcon: Icon( Icons.accessibility ),
          icon: Icon( Icons.account_circle )
      ),
      onChanged: (valor){
        setState(() {
          _name = valor;
        });
      },
    );

  }

  Widget _createEmail() {

    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            hintText: 'Email',
            labelText: 'Email',
            suffixIcon: Icon( Icons.alternate_email ),
            icon: Icon( Icons.email )
        ),
        onChanged: (valor) =>setState(() {
          _email = valor;
        })
    );

  }

  Widget _createPassword(){

    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            hintText: 'Password',
            labelText: 'Password',
            suffixIcon: Icon( Icons.lock_open ),
            icon: Icon( Icons.lock )
        ),
        onChanged: (valor) =>setState(() {
          _password = valor;
        })
    );

  }


  Widget _createDate( BuildContext context ) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Date of birth',
          labelText: 'Date of birth',
          suffixIcon: Icon( Icons.perm_contact_calendar ),
          icon: Icon( Icons.calendar_today )
      ),
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );

      },
    );

  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1920),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES')
    );
    print(picked);
    if ( picked != null ) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }

  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {

    List<DropdownMenuItem<String>> list = new List();

    _powers.forEach( (power){

      list.add( DropdownMenuItem(
        child: Text(power),
        value: power,
      ));

    });

    return list;

  }

  Widget _createDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _selectedOption,
            items: getOptionsDropdown(),
            onChanged: (opt) {
              setState(() {
                _selectedOption = opt;
              });
            },
          ),
        )

      ],
    );





  }



  Widget _createPersona() {

    return ListTile(
      title: Text('Name: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_selectedOption),
    );

  }

}