import 'package:weekly/core/utils/app_utils.dart';
import 'package:weekly/data/database_service.dart';
import 'package:weekly/features/home/models/task_model.dart';

abstract class HomeRepository {
  Future<List<TaskModel>> fetchTasks(DateTime refDate);
  Future<void> createTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(String id);
}

class HomeRepositoryImp implements HomeRepository {
  final DatabaseService _local;
  HomeRepositoryImp(this._local);

  @override
  Future<List<TaskModel>> fetchTasks(DateTime refDate) async {
    final result = AppUtilities.weekdays(date: refDate);
    final rows = await _local.query(
      'tasks',
      where: 'date >= ? AND date <= ?',
      whereArgs: [result['start'].toString(), result['end'].toString()],
    );
    if (rows.isNotEmpty) {
      return rows.map(TaskModel.fromMap).toList();
    }
    return [];
  }

  @override
  Future<void> createTask(TaskModel task) async {
    await _local.insert('tasks', task.toMap());
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    await _local.update('tasks', task.toMap(), 'id = ?', [task.id]);
  }

  @override
  Future<void> deleteTask(String id) async {
    await _local.delete('tasks', 'id = ?', [id]);
  }
}
