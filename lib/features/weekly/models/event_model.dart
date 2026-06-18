class EventModel {
  final String id;
  final String title;
  final bool compeleted;
  final DateTime date;
  final DateTime created;

  EventModel({
    required this.id,
    required this.title,
    required this.compeleted,
    required this.date,
    required this.created,
  });

  factory EventModel.fromMap(String id, Map<String, dynamic> map) {
    return EventModel(
      id: id,
      title: map['title'],
      compeleted: map['compeleted'],
      date: map["date"],
      created: map["created"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "completed": compeleted,
      "date": date.toIso8601String(),
      "created": date.toIso8601String(),
    };
  }

  EventModel copyWith({
    String? id,
    String? title,
    bool? compeleted,
    DateTime? date,
    DateTime? created,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      compeleted: compeleted ?? this.compeleted,
      date: date ?? this.date,
      created: created ?? this.created,
    );
  }
}
