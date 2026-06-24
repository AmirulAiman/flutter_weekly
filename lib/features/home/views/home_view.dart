import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/auth/controllers/auth_controller.dart';
import 'package:weekly/features/home/controllers/home_controller.dart';
import 'package:weekly/features/home/widgets/day_task_tile.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      appBar: AppBar(
        title: Text(
          'Weekly',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 25),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.menu, color: Theme.of(context).colorScheme.onPrimary),
            color: Theme.of(context).colorScheme.onPrimary,
            onSelected: (value) {
              switch (value) {
                case 'profile':
                  Get.toNamed('/profile');
                  break;
                case 'logout':
                  auth.logout();
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text('Profile', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Theme.of(context).colorScheme.primary, size: 20),
                    SizedBox(width: 12),
                    Text('Logout', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.tasks.length,
          itemBuilder: (context, index) => DayTaskTile(model: controller.tasks[index]),
        );
      }),
      bottomNavigationBar: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: controller.prevWeek,
              icon: Icon(
                Icons.arrow_left_rounded,
                size: 50,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            GestureDetector(
              onTap: controller.resetWeek,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.primary,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  controller.weekLabel,
                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 25),
                ),
              ),
            ),
            IconButton(
              onPressed: controller.nextWeek,
              icon: Icon(
                Icons.arrow_right_rounded,
                size: 50,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        );
      }),
    );
  }
}
