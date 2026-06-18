import 'package:weekly/features/event/data/local_db_source.dart';
import 'package:weekly/features/event/data/remote_db_source.dart';

class EventRepository {
  final LocalDbSource local; // Local db => sqflite
  final RemoteDbSource remote; //Remote db => Firestore

  EventRepository({required this.local, required this.remote});

  Future<void> syncLocalWithRemote(String uid) async {}
}
