import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/event/controllers/event_controller.dart';

class DayTile extends StatelessWidget {
  final int dayIndex;
  final EventController controller;
  const DayTile({super.key, required this.dayIndex, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Text('Day Tile');
    });
  }
}
