import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as Im;
import 'package:ngn200_vrijwillgers/data/app_data.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _AdminPage(),
    );
  }
}

class _AdminPage extends StatefulWidget {
  _AdminPage({Key key}) : super(key: key);

  @override
  __AdminPageState createState() => __AdminPageState();
}

class __AdminPageState extends State<_AdminPage> {
  String imagePath;
  int n = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('Compress'),
          onPressed: _onClick,
        ),
        Container(
          child: imagePath == null
              ? Text('wacht op image')
              : Image.file(File(imagePath)),
        ),
      ],
    );
  }

  void _onClick() async {
    // _createRecord();
    this.imagePath = await _compress();

    setState(() {});
  }


  Future<String> _compress() async {
    String imagePath = Constants.imagePath;

    Im.Image image = Im.decodeImage(File(imagePath).readAsBytesSync());
    print('size = ' + image.length.toString());
    Im.Image smallerImage = Im.copyResize(image, width: 250);

    String compressImagePath = imagePath.replaceFirst(".png", "_" + this.n.toString() + ".png");
    this.n++;

    var compressedImage = new File(compressImagePath)
      ..writeAsBytesSync(Im.encodeJpg(smallerImage, quality: 85));
    print('compressed = ' + compressedImage.length().toString());
    int n = await _write(compressImagePath, smallerImage);
    print('compressed = ' + n.toString());
    List<int> imageBytes = File(compressImagePath).readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    print(base64Image.length);
    return compressImagePath;
  }

  Future<int> _write(path, smallerImage) async {
    var compressedImage = File(path)
      ..writeAsBytesSync(Im.encodeJpg(smallerImage, quality: 85));
    return compressedImage.length();
  }
}
