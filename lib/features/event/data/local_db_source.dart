import 'package:sqflite/sqlite_api.dart';
import 'package:weekly/core/services/database_service.dart';
import 'package:weekly/features/event/models/event_model.dart';

class LocalDbSource {
  final DatabaseService service;
  LocalDbSource(this.service);

  Future<void> insert(EventModel event) async {
    final db = await service.database;
    await db.insert('events', event.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<dynamic>> getAll() async {
    final db = await service.database;
    final result = await db.query('events');
    return result.map(EventModel.fromMap).toList();
  }

  Future<void> delete(String id) async {
    final db = await service.database;
    await db.delete('events', where: 'id = ?', whereArgs: [id]);
  }
}
