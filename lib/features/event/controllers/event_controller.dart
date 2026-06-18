import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/app/constants/day_strings.dart';
import 'package:weekly/app/constants/month_strings.dart';
import 'package:weekly/features/event/models/day_plan_model.dart';
import 'package:weekly/features/event/models/event_model.dart';
import 'package:weekly/features/event/repositories/event_repository.dart';

class EventController extends GetxController {
  final EventRepository repository;
  EventController(this.repository);
  final isLoading = false.obs;

  final weekOffset = 0.obs; //-offset => prev week, +offset => next week.
  final events = <EventModel>[].obs;
  final RxList<DayPlanModel> dayPlans = <DayPlanModel>[].obs;

  final eventCtrl = TextEditingController();
  final eventDate = DateTime.now().obs; //TODO: Change later

  @override
  void onInit() {
    super.onInit();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    try {
      isLoading(true);
      events.value = await repository.local.getAll();
    } catch (e) {
      Get.snackbar('Load Event Failed', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
