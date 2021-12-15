import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  CollectionReference firestore = Firestore.instance.collection('jobs');

  Future getTODOs(String user) async {
    final x = await firestore.document(user).snapshots().length;
    return x;
  }
}