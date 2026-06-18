import 'package:get/get.dart';
import 'package:weekly/features/event/models/event_model.dart';

class DayPlanModel {
  final String name;
  final DateTime date;
  final RxList<EventModel> events;
  final RxBool expanded;

  DayPlanModel({
    required this.name,
    required this.date,
    List<EventModel>? events,
    bool expanded = false,
  }) : events = (events ?? <EventModel>[]).obs,
       expanded = expanded.obs;
}
