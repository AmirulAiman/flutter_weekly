import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/event/controllers/event_controller.dart';
import 'package:weekly/features/event/widgets/day_tile.dart';
import 'package:weekly/features/event/widgets/event_header.dart';

class EventView extends GetView<EventController> {
  const EventView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const EventHeader(),
            Divider(height: 0, thickness: 0.5, color: Theme.of(context).colorScheme.onSurface),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return CircularProgressIndicator();
                }
                return ListView.separated(
                  itemBuilder: (_, i) {
                    final event = controller.events[i];
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Text(event.title.value),
                    );
                  },
                  separatorBuilder: (_, _) => Divider(
                    height: 0,
                    thickness: 0.5,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  itemCount: controller.events.value.length,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
