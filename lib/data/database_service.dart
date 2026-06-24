import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _db;
  final String _databaseName = 'app.db';
  final int _version = 1;

  Future<Database> get database async {
    _db ??= await _init();
    return _db!;
  }

  Future<Database> _init() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return openDatabase(path, version: _version, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
        id TEXT PRIMARY KEY,
        task TEXT NOT NULL,
        date TEXT NOT NULL,
        is_completed INTEGER,
        created_at INTEGER NOT NULL
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Handle migrations per version
  }

  // Generic CRUD
  Future<int> insert(String table, Map<String, dynamic> data) async =>
      (await database).insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);

  Future<List<Map<String, dynamic>>> query(
    String table, {
    String? where,
    List<dynamic>? whereArgs,
  }) async => (await database).query(table, where: where, whereArgs: whereArgs);

  Future<int> update(
    String table,
    Map<String, dynamic> data,
    String where,
    List<dynamic> whereArgs,
  ) async => (await database).update(table, data, where: where, whereArgs: whereArgs);

  Future<int> delete(String table, String where, List<dynamic> whereArgs) async =>
      (await database).delete(table, where: where, whereArgs: whereArgs);

  Future<void> close() async => (await database).close();
}
