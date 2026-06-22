class TaskModel {
  final String? id;
  final String task;
  final DateTime date;
  final DateTime createdAt;

  TaskModel({this.id, required this.task, required this.date, required this.createdAt});

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      task: map['task'],
      date: DateTime.parse(map['date'] as String),
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "task": task,
      "date": date.toIso8601String(),
      "created_at": createdAt.toIso8601String(),
    };
  }

  TaskModel copyWith(String? id, String? task, DateTime? date, DateTime? createdAt) {
    return TaskModel(
      id: id ?? this.id,
      task: task ?? this.task,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
