import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/core/utils/app_utils.dart';
import 'package:weekly/features/home/controllers/home_controller.dart';
import 'package:weekly/features/home/models/day_task_model.dart';
import 'package:weekly/features/home/widgets/header_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weekly')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const CircularProgressIndicator();
                }
                return ListView.separated(
                  itemCount: controller.tasks.length,
                  separatorBuilder: (_, _) => Divider(height: 0, thickness: 0.5),
                  itemBuilder: (_, i) {
                    return Obx(() {
                      final plan = controller.tasks[i];
                      final dayTasks = plan.tasks;
                      final doneCount = dayTasks.where((t) => t.isCompleted.value).length;
                      return DayBodyWidget(plan: plan, doneCount: doneCount);
                    });
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class DayBodyWidget extends StatelessWidget {
  const DayBodyWidget({super.key, required this.plan, required this.doneCount});

  final DayTaskModel plan;
  final int doneCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: Text('TESTING')),
        HeaderWidget(),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          color: plan.expanded.value
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surface,
          child: InkWell(
            onTap: () => plan.expanded.toggle(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              plan.day.toUpperCase(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: plan.expanded.value
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : const Color(0xFF1A1A1A),
                              ),
                            ),
                            if (plan.tasks.isNotEmpty) ...[
                              const SizedBox(width: 8),
                              BadgeWidget(
                                label: '$doneCount/${plan.tasks.length}',
                                inverted: plan.expanded.value,
                              ),
                            ],
                          ],
                        ),
                        if (plan.expanded.value) ...[
                          const SizedBox(height: 3),
                          Text(
                            AppUtilities.formattedDate(DateTime.now()),
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: plan.expanded.value ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: plan.expanded.value
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({super.key, required this.label, this.inverted = false});
  final String label;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: inverted
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: inverted
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
