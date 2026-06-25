import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/home/controllers/home_controller.dart';
import 'package:weekly/features/home/models/day_task_model.dart';
import 'package:weekly/features/home/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final DayTaskModel dayTaskModel;
  const TaskItem({super.key, required this.task, required this.dayTaskModel});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                task.copyWith(isCompleted: !task.isCompleted.value);
                controller.updateTask(dayTaskModel, task);
              },
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: task.isCompleted.value
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  border: Border.all(
                    color: task.isCompleted.value
                        ? const Color(0xFFE05A2B)
                        : const Color(0xFF888888),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: task.isCompleted.value
                    ? const Icon(Icons.check, size: 12, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              task.task,
              style: TextStyle(
                color: task.isCompleted.value
                    ? Theme.of(context).colorScheme.onSurface
                    : Theme.of(context).colorScheme.primary,
                fontSize: 20,
                decoration: task.isCompleted.value ? TextDecoration.lineThrough : null,
                decorationColor: const Color(0xFFE05A2B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
