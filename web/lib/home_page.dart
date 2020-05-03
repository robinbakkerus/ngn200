import 'package:flutter/material.dart';
import 'package:ngn200/controller/app_controller.dart';
import 'package:ngn200/event/app_events.dart';
import 'package:ngn200/util/widget_utils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    super.initState();
    AppController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
            image: AssetImage('lib/assets/Nuenen_gerwen_nederwetten_006.jpg')),
        WidgetUtils.verSpace(5),
        Text('Todo hier uitleg over deze app om vrijwilligers aan te melden etc...'),
        WidgetUtils.verSpace(5),
        RaisedButton(
          child: Text('Meld vrijwilliger aan'),
          onPressed: _onClick,
        )
      ],
    ));
  }

  void _onClick() {
    AppEvents.fireAddVolonteer();
  }
}
