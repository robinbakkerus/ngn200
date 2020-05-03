// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ngn200/model/volonteer.dart';
import 'package:flutter/material.dart';
import 'package:ngn200/service/firestore_service.dart';
import 'package:ngn200/util/image_utils.dart';

class ShowVolonteersPage extends StatefulWidget {
  ShowVolonteersPage({Key key}) : super(key: key);

  @override
  _ShowVolonteersPageState createState() => _ShowVolonteersPageState();
}

class _ShowVolonteersPageState extends State<ShowVolonteersPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirestoreService().getAllVolonteers().asStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data == null) {
          return Text('...');
        } else {
          final int cardLength = snapshot.data.documents.length;
          return ListView.builder(
            itemCount: cardLength,
            itemBuilder: (BuildContext ctxt, int index) {
              final DocumentSnapshot _card = snapshot.data.documents[index];
              return _buildTile(_card);
            },
          );
          // return _createChildren(snapshot);
        }
      },
    );
  }

  ListTile _buildTile(DocumentSnapshot _card) {
    String txt = _card['wie'].toString() +
        ' ' +
        _card['wat'].toString() +
        ' ' +
        _card['waar'].toString();
    MemoryImage photo = ImageUtils.ofBase64(_card['fotoBase64']);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: photo,
      ),
      title: Text(txt),
    );
  }
}
