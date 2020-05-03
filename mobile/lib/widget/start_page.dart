import 'package:flutter/material.dart';
import 'package:ngn200/widget/main_appbar.dart';
// import '../data/constants.dart';
import 'package:ngn200/widget/add_vrijwilliger_page.dart';
import 'package:ngn200/widget/home_page.dart';
import 'package:ngn200/widget/make_photo_page.dart';
import 'package:ngn200/widget/admin.dart';
import 'package:ngn200/event/app_events.dart';
import 'package:ngn200/widget/display_photo_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'NGN200 Vrijwilligers',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _StartPage(title: 'NGN200 Vrijwilligers'),
    );
  }
}

class _StartPage extends StatefulWidget {
  _StartPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _StartPageState createState() => new _StartPageState();
}

class _StartPageState extends State<_StartPage> {
  int _stackIndex = 0;

  _StartPageState() {
    AppEvents.onSwitchTask(_switchStack);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: buildMainAppBar(context, -1),
        body: IndexedStack(
          index: _stackIndex,
          children: <Widget>[
            HomePage(),               // 0
            AddVrijwilligerPage(),    // 1
            TakePictureScreen(),      // 2
            DisplayPhotoPage(),       // 3
            AdminPage(),              // 4
          ],
        ));
  }

  void _switchStack(SwitchStackEvent event) {
    setState(() {
      this._stackIndex = event.stackIndex;
    });
  }
}
