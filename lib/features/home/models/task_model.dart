import 'package:get/get.dart';

class TaskModel {
  final String? id;
  final String task;
  final DateTime date;
  final RxBool isCompleted;
  final DateTime createdAt;

  TaskModel({
    this.id,
    required this.task,
    required this.date,
    bool isCompleted = false,
    required this.createdAt,
  }) : isCompleted = isCompleted.obs;

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      task: map['task'],
      date: DateTime.parse(map['date'] as String),
      isCompleted: map['is_completed'] == 1,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "task": task,
      "date": date.toIso8601String(),
      "is_completed": isCompleted.value ? 1 : 0,
      "created_at": createdAt.toIso8601String(),
    };
  }

  TaskModel copyWith(
    String? id,
    String? task,
    DateTime? date,
    bool? isCompleted,
    DateTime? createdAt,
  ) {
    return TaskModel(
      id: id ?? this.id,
      task: task ?? this.task,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted.value,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
