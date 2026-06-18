import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weekly/app/constants/day_strings.dart';
import 'package:weekly/app/constants/month_strings.dart';
import 'package:weekly/features/event/models/event_model.dart';
import 'package:weekly/features/event/repositories/event_repository.dart';

class EventController extends GetxController {
  final EventRepository repository;
  EventController(this.repository);

  final _days = DayStrings.days;
  final _months = MonthStrings.months;

  final isLoading = false.obs;

  final weekOffset = 0.obs; //-offset => prev week, +offset => next week.
  final events = <EventModel>[].obs;

  final eventCtrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _loadEvents();
  }

  void _loadEvents() {
    try {
      isLoading(true);
      final uid = FirebaseAuth.instance.currentUser!.uid;

      repository.events(uid).snapshots().listen((snapshot) {
        events.value = snapshot.docs
            .map((doc) => EventModel.fromMap(doc.data() as Map<String, dynamic>))
            .toList();
      });
    } catch (e) {
      Get.snackbar('Load Event Failed', e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> addEvent() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await repository.events(uid).add({
      'title': eventCtrl.text,
      'date': DateTime.now().toIso8601String(), //TODO add select date later
      'createdAt': DateTime.now().toIso8601String(),
    });
  }
}
