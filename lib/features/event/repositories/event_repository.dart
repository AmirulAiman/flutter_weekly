import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weekly/features/event/data/local_db_source.dart';
import 'package:weekly/features/event/data/remote_db_source.dart';

class EventRepository {
  final FirebaseFirestore _fs = FirebaseFirestore.instance;

  final LocalDbSource local; // Local db => sqflite
  final RemoteDbSource remote; //Remote db => Firestore

  EventRepository({required this.local, required this.remote});

  CollectionReference events(String uid) {
    return _fs.collection('users').doc(uid).collection('events');
  }
}
