import 'package:flutter/material.dart';
import 'package:ngn200/event/app_events.dart';
import 'package:ngn200/data/app_data.dart';

class Choice {
  const Choice({this.title, this.icon, this.stackIndex, this.text});
  final String title;
  final IconData icon;
  final int stackIndex;
  final String text;
}

/// see enum in StackIndex
const List<Choice> _choices = const <Choice>[
  const Choice(title: '/home', icon: Icons.home, stackIndex: STACK_HOME, text: 'Home'), 
  const Choice(
      title: '/add_volonteer', icon: Icons.input, stackIndex: STACK_ADD, text: 'Meld aan'),
  const Choice(
      title: '/show_volonteers', icon: Icons.input, stackIndex: STACK_SHOW_VOLONTEERS, text: 'Wie is aangemeld'),
  const Choice(
      title: '/show_map', icon: Icons.input, stackIndex: STACK_MAP, text: 'Kaart'),
  const Choice(
      title: '/admin', icon: Icons.access_alarm, stackIndex: STACK_ADMIN, text: 'Admin'),
];

AppBar buildMainAppBar(BuildContext context, int disableButton) {
  void _onSelect(Choice choice) {
    AppEvents.fireSwitchStack(choice.stackIndex);
  }

  // bool _isButtonDisabled(int n) => n == disableButton;

  Widget _buildButton(int n) {
    // return new  IconButton(
    //   icon: Icon(choices[n].icon),
    //   onPressed: _isButtonDisabled(n) ? null : () {
    //     _select(choices[n]);
    //   } ,
    // );
    return FlatButton(
      color: Colors.blue,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      onPressed: () {
        _onSelect(_choices[n]);
      },
      child: Text(
        _choices[n].text,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  return new AppBar(
    //title: new Text('Todo'),
    actions: <Widget>[
      _buildButton(0),
      _buildButton(1),
      _buildButton(2),
      _buildButton(3),
      PopupMenuButton<Choice>(
        onSelected: _onSelect,
        itemBuilder: (BuildContext context) {
          return _choices.skip(2).map((Choice choice) {
            return PopupMenuItem<Choice>(
              value: choice,
              child: Text(choice.title),
            );
          }).toList();
        },
      ),
    ],
  );
}
