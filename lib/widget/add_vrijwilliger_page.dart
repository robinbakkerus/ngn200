import 'package:flutter/material.dart';
import 'package:ngn200_vrijwillgers/data/app_data.dart';
import 'package:ngn200_vrijwillgers/event/app_events.dart';
import 'package:ngn200_vrijwillgers/util/widget_utils.dart';

class AddVrijwilligerPage extends StatelessWidget {
  AddVrijwilligerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Ngn200',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _AddVrijwilligerPage(),
    );
  }
}

// A screen that allows users to take a picture using a given camera.
class _AddVrijwilligerPage extends StatefulWidget {
  const _AddVrijwilligerPage({Key key}) : super(key: key);

  @override
  _AddVrijwilligerPageState createState() => _AddVrijwilligerPageState();
}

class _AddVrijwilligerPageState extends State<_AddVrijwilligerPage> {
  @override
  void initState() {
    super.initState();
    AppData.prepareVolonteer();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          WidgetUtils.verSpace(5),
          _whoField(),
          WidgetUtils.verSpace(5),
          _whereField(),
          WidgetUtils.verSpace(5),
          _whatField(),
          WidgetUtils.verSpace(5),
          _submitButton(),
          // _snackbar(context),
        ],
      ),
    );
  }

  TextFormField _whoField() {
    return TextFormField(
      decoration: new InputDecoration(
        labelText: "Wie (naam )",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.0),
          borderSide: new BorderSide(),
        ),
        //fillColor: Colors.green
      ),
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'Geef de (voor)naam';
      //   }
      //   return null;
      // },
      onSaved: (val) => setState(() => AppData.currentVolonteer.wie = val),
    );
  }

  Widget _whereField() {
    // return WhereInputField();
    return TextFormField(
      decoration: new InputDecoration(
        labelText: "Waar (vereniging, organisatie etc )",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.0),
          borderSide: new BorderSide(),
        ),
        //fillColor: Colors.green
      ),
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'Geef de (voor)naam';
      //   }
      //   return null;
      // },
      onSaved: (val) => setState(() => AppData.currentVolonteer.waar = val),
    );
  }

  Widget _whatField() {
    // return WhereInputField();
    return TextFormField(
      decoration: new InputDecoration(
        labelText: "Wat (coach, bestuur, mantelzorg ... )",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.0),
          borderSide: new BorderSide(),
        ),
        //fillColor: Colors.green
      ),
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'Geef de (voor)naam';
      //   }
      //   return null;
      // },
      onSaved: (val) => setState(() => AppData.currentVolonteer.wat = val),
    );
  }

  Widget _submitButton() {
    return RaisedButton(
      onPressed: _onSubmit,
      child: Text(
        "Maak foto",
      ),
    );
  }

  void _onSubmit () {
    final form = _formKey.currentState;
    form.save();
    if (_formKey.currentState.validate()) {
      // Scaffold
      //     .of(context)
      //     .showSnackBar(SnackBar(content: Text('Processing Data')));

      AppEvents.fireTakePicture();
    }
  }
  // Padding _snackbar(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 16.0),
  //     child: RaisedButton(
  //       onPressed: () {
  //         if (_formKey.currentState.validate()) {
  //           Scaffold.of(context)
  //               .showSnackBar(SnackBar(content: Text('Processing Data')));
  //         }
  //       },
  //       child: Text('Submit'),
  //     ),
  //   );
  // }

}
