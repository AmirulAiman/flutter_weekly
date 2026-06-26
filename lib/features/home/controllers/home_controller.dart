import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/core/constants/app_strings.dart';
import 'package:weekly/features/home/models/day_task_model.dart';
import 'package:weekly/features/home/models/task_model.dart';
import 'package:weekly/features/home/repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _repo;
  HomeController(this._repo);

  final tasks = <DayTaskModel>[].obs;
  final isLoading = false.obs;
  final currentDate = DateTime.now().obs;

  final _days = AppStrings.dayFullNames;
  final _months = AppStrings.months;

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
    final startOfWeek = currentDate.value.subtract(Duration(days: currentDate.value.weekday - 1));
    return List.generate(_days.length, (index) {
      final dayOffset = index == 0 ? 6 : index - 1;
      final dayDate = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day + dayOffset);
      final dayTasks = tasks.where((t) => t.date.weekday % 7 == index).toList();

      return DayTaskModel(
        day: _days[index],
        date: dayDate,
        expanded: dayDate.weekday == currentDate.value.weekday - 1 ? true.obs : false.obs,
        tasks: RxList<TaskModel>(dayTasks),
      );
    });
  }

  Future<void> createTask(DayTaskModel dayModel, String taskName) async {
    try {
      isLoading(true);
      final task = TaskModel(task: taskName, date: dayModel.date, createdAt: DateTime.now());
      await _repo.createTask(task);
      dayModel.tasks.add(task);
    } catch (e) {
      print('callDatePicker Failed: $e');
    } finally {
      isLoading(false);
    }
  }

  void prevWeek() {
    currentDate.value = currentDate.value.subtract(const Duration(days: 7));
    fetchTasks();
  }

  void nextWeek() {
    currentDate.value = currentDate.value.add(const Duration(days: 7));
    fetchTasks();
  }

  void resetWeek() {
    if (!isCurrentWeek) {
      currentDate.value = DateTime.now();
      fetchTasks();
    }
    return;
  }

  bool get isCurrentWeek {
    final now = DateTime.now();
    final startOfCurrentWeek = now.subtract(Duration(days: now.weekday - 1));
    final startOfSelectedWeek = currentDate.value.subtract(
      Duration(days: currentDate.value.weekday - 1),
    );
    return DateUtils.isSameDay(startOfCurrentWeek, startOfSelectedWeek);
  }

  String get weekLabel {
    if (isCurrentWeek) return 'This Week';
    final start = currentDate.value.subtract(Duration(days: currentDate.value.weekday - 1));
    final end = start.add(const Duration(days: 6));
    return '${_fmt(start)} — ${_fmt(end)}';
  }

  String _fmt(DateTime d) => '${d.day.toString().padLeft(2, '0')} ${_months[d.month - 1]}';

  //TODO: Need to debug, save to db not working
  Future<void> updateTask(DayTaskModel dayModel, TaskModel task) async {
    try {
      final updated = task.toggleCompletion(isCompleted: !task.isCompleted.value);
      await _repo.updateTask(updated);
      final index = dayModel.tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) dayModel.tasks[index] = updated;
    } catch (e) {
      print('updateTask: Failed, $e');
    }
  }

  Future<void> deleteTask(DayTaskModel dayTaskModel, TaskModel task) async {
    try {
      print('Task:$task');
      await _repo.deleteTask(task.id!);
      dayTaskModel.tasks.remove(task);
    } catch (e) {
      print('deleteTask Failed; $e');
    }
  }
}
