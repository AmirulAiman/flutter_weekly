import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/home/models/day_task_model.dart';
import 'package:weekly/features/home/models/task_model.dart';
import 'package:weekly/features/home/repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _repo;
  HomeController(this._repo);

  final tasks = <DayTaskModel>[].obs;
  final isLoading = false.obs;
  final expanded = DateTime.now().weekday.obs;
  final currentDate = DateTime.now().obs;

  final _days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Satruday'];

  final taskCtrl = TextEditingController();
  final selectedDate = DateTime.now();

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    try {
      isLoading(true);
      final result = await _repo.fetchTasks(currentDate.value);
      tasks.assignAll(_groupByDay(result));
    } catch (e) {
      print('fetchTasks Failed: $e');
      tasks.value = [];
    } finally {
      isLoading(false);
    }
  }

  List<DayTaskModel> _groupByDay(List<TaskModel> tasks) {
    return List.generate(_days.length, (index) {
      final dayTask = tasks.where((t) => t.date.weekday % 7 == index).toList();
      return DayTaskModel(
        day: _days[index],
        expanded: false.obs,
        tasks: RxList<TaskModel>(dayTask),
      );
    });
  }

  Future<void> createTask(DayTaskModel dayModel, String taskName) async {
    try {
      isLoading(true);
      final task = TaskModel(task: taskName, date: DateTime.now(), createdAt: DateTime.now());
      await _repo.createTask(task);
      dayModel.tasks.add(task);
    } catch (e) {
      print('callDatePicker Failed: $e');
    } finally {
      isLoading(false);
    }
  }

  //TODO: Need to debug, save to db not working
  Future<void> updateTask(DayTaskModel dayModel, TaskModel task) async {
    try {
      final updated = task.toggleCompletion(isCompleted: !task.isCompleted.value);
      await _repo.updateTask(updated);
      final index = dayModel.tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) dayModel.tasks[index] = updated;
    } catch (e) {
      print('updateTask: Failed');
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await _repo.deleteTask(id);
    } catch (e) {
      print('deleteTask Failed; $e');
    }
  }
}
