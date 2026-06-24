// day tile — unchanged structure, controller wired via addTask
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/core/utils/app_utils.dart';
import 'package:weekly/features/home/controllers/home_controller.dart';
import 'package:weekly/features/home/models/day_task_model.dart';
import 'package:weekly/features/home/widgets/add_task_field.dart';
import 'package:weekly/features/home/widgets/badge_widget.dart';
import 'package:weekly/features/home/widgets/task_item.dart';

class DayTaskTile extends StatelessWidget {
  final DayTaskModel model;

  const DayTaskTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      final isExpanded = model.expanded.value;
      final completed = model.tasks.where((t) => t.isCompleted.value).length;

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
                  Row(
                    children: [
                      Text(
                        model.day.toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                      if (model.tasks.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        BadgeWidget(
                          label: '$completed/${model.tasks.length}',
                          isExpanded: model.expanded.value,
                        ),
                      ],
                    ],
                  ),
                  if (isExpanded) ...[
                    const SizedBox(height: 4),
                    Text(
                      AppUtilities.formattedDate(model.date),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            alignment: Alignment.topCenter,
            child: isExpanded
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedOpacity(
                        opacity: isExpanded ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOut,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...model.tasks.map((task) => TaskItem(dayTaskModel: model, task: task)),
                            AddTaskField(
                              onSubmitted: (value) => controller.createTask(model, value),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      );
    });
  }
}
