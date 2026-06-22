import 'package:get/get.dart';
import 'package:weekly/features/home/models/task_model.dart';

class DayTaskModel {
  final String day;
  final RxBool expanded;
  final RxList<TaskModel> tasks;
  DayTaskModel({required this.day, required this.expanded, required this.tasks});
}
