import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/home/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final checked = false.obs;
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => checked.toggle(),
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: checked.value ? const Color(0xFFE05A2B) : Colors.transparent,
                  border: Border.all(
                    color: checked.value ? const Color(0xFFE05A2B) : const Color(0xFF888888),
                    width: 1.5,
                  ),
                ),
                child: checked.value
                    ? const Icon(Icons.check, size: 12, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              task.task,
              style: TextStyle(
                color: checked.value ? const Color(0xFF888888) : Colors.white,
                fontSize: 15,
                decoration: checked.value ? TextDecoration.lineThrough : null,
                decorationColor: const Color(0xFFE05A2B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
