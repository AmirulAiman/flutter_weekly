import 'package:get/get.dart';

class EventModel {
  final String? id;
  final RxString title;
  final RxBool completed;
  final DateTime date;
  final DateTime created;
  final bool synced;

  EventModel({
    required this.id,
    required String title,
    required this.date,
    bool completed = false,
    required this.created,
    this.synced = false,
  }) : title = title.obs,
       completed = completed.obs;

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map["id"] as String?,
      title: map['title'] as String,
      completed: map['completed'],
      date: DateTime.parse(map["date"]),
      created: DateTime.parse(map["created"]),
      synced: map['synced'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title.value,
      "completed": completed.value ? 1 : 0,
      "date": date.toIso8601String(),
      "created": created.toIso8601String(),
      "synced": synced ? 1 : 0,
    };
  }

  EventModel copyWith({
    String? id,
    String? title,
    bool? completed,
    DateTime? date,
    DateTime? created,
    bool? synced,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title.value,
      completed: completed ?? this.completed.value,
      date: date ?? this.date,
      created: created ?? this.created,
      synced: synced ?? this.synced,
    );
  }
}
