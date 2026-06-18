import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weekly/features/event/models/event_model.dart';

class RemoteDbSource {
  final FirebaseFirestore firestore;

  RemoteDbSource(this.firestore);

  CollectionReference getAll(String uid) {
    return firestore.collection('users').doc(uid).collection('events');
  }

  Future<void> insert(String uid, EventModel event) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection('events')
        .doc(event.id)
        .set(event.toMap());
  }
}
