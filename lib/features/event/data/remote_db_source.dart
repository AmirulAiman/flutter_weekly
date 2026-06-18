import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weekly/features/event/models/event_model.dart';

class RemoteDbSource {
  final FirebaseFirestore firestore;

  RemoteDbSource(this.firestore);

  Future<void> createEvent(String uid, EventModel event) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection('events')
        .doc(event.id)
        .set(event.toMap());
  }
}
