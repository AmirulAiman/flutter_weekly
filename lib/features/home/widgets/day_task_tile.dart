// day tile — unchanged structure, controller wired via addTask
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/home/controllers/home_controller.dart';
import 'package:weekly/features/home/models/day_task_model.dart';
import 'package:weekly/features/home/widgets/add_task_field.dart';
import 'package:weekly/features/home/widgets/task_item.dart';

class DayTaskTile extends StatelessWidget {
  final DayTaskModel model;

  const DayTaskTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      final isExpanded = model.expanded.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => model.expanded.toggle(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFF2E2E2E))),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.day.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                  if (isExpanded && model.tasks.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      _formatSubtitle(model.tasks.first.date),
                      style: const TextStyle(color: Color(0xFF888888), fontSize: 13),
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (isExpanded) ...[
            ...model.tasks.map((task) => TaskItem(task: task)),
            AddTaskField(onSubmitted: (value) => controller.addTask(model, value)),
            const SizedBox(height: 8),
          ],
        ],
      );
    });
  }

  String _formatSubtitle(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    final hour = date.hour;
    final minute = date.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'pm' : 'am';
    final hour12 = hour % 12 == 0 ? 12 : hour % 12;
    return '${months[date.month - 1]}, ${date.day} ${date.year} — $hour12:$minute$period';
  }
}
