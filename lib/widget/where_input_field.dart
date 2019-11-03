import 'package:flutter/material.dart';
import 'package:flutter_tags/input_tags.dart';
import 'package:ngn200_vrijwillgers/data/app_data.dart';

class WhereInputField extends StatelessWidget {
  const WhereInputField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _WhereInputField(),
    );
  }
}

class _WhereInputField extends StatefulWidget {
  _WhereInputField({Key key}) : super(key: key);

  @override
  __WhereInputFieldState createState() => __WhereInputFieldState();
}
//-----------------------------------------------------------------------------
class __WhereInputFieldState extends State<_WhereInputField> {
  TextEditingController _controller = TextEditingController();
  List<String> _whatTags = [];
  String _newText = "";
  // String _oldText = "";

  @override
  void initState() {
    super.initState();

    _controller.addListener(_handleText);
    _whatTags.addAll([
      'Bestuur',
      'Trainer/coach',
      // 'Algemeen',
      // 'Mantelzorg',
      // 'Ondersteuning'
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _whereField(),
    );
  }

  TextFormField _whereField() {
    return TextFormField(
      controller: _controller,
      decoration: new InputDecoration(
        labelText: "Waar (vereniging, mantelzorg, organisatie enz)",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.0),
          borderSide: new BorderSide(),
        ),
        //fillColor: Colors.green
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Geef de (voor)naam';
        }
        return null;
      },
      onSaved: (val) => setState(() => AppData.currentVolonteer.wie = val),
    );
  }

  _handleText() {
    print("${_controller.text}");
    if (this._controller.text != this._newText) {
      _showTags();
    }
  }

  _showTags() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Kies Wat ...'),
            content: _whatTagsWidget(),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Close')),
            ],
          );
        });
  }

  Widget _whatTagsWidget() {
    return InputTags(
      tags: _whatTags,
      onDelete: (tag) {
        print(tag);
      },
      onInsert: (tag) {
        print(tag);
        setState(() {
          // this._oldText = this._newText;
          this._newText = tag; 
        });
        _dismissDialog();
      },
    );
  }

  _dismissDialog() {
    Navigator.of(context).pop();
  }

  
}
