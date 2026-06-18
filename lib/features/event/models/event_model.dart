class EventModel {
  final String id;
  final String title;
  final bool completed;
  final DateTime date;
  final DateTime created;

  EventModel({
    required this.id,
    required this.title,
    required this.completed,
    required this.date,
    required this.created,
  });

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map["id"],
      title: map['title'],
      completed: map['completed'],
      date: map["date"],
      created: map["created"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "completed": completed,
      "date": date.toIso8601String(),
      "created": date.toIso8601String(),
    };
  }

  EventModel copyWith({
    String? id,
    String? title,
    bool? completed,
    DateTime? date,
    DateTime? created,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      date: date ?? this.date,
      created: created ?? this.created,
    );
  }
}
