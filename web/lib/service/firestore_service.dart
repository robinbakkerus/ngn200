import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ngn200/model/volonteer.dart';

class FirestoreService {

static final FirestoreService _singleton = new FirestoreService._internal();

  factory FirestoreService() {
    return _singleton;
  }

  FirestoreService._internal() ;

  Object saveVolunteer(Volonteer volonteer) async {
    final databaseReference = Firestore.instance;
    DocumentReference ref = await databaseReference
        .collection("vrijwilligers")
        .add(volonteer.toJson());
    return ref.documentID;
  }

  Future<QuerySnapshot> getAllVolonteers() {
    final databaseReference = Firestore.instance;
     return databaseReference.collection('vrijwilligers').getDocuments();
  }

}