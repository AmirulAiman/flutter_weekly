import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/home/controllers/home_controller.dart';
import 'package:weekly/features/home/widgets/day_task_tile.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colors.white),
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                //TODO: Add function to navigate to next week
              },
              icon: Icon(Icons.arrow_left, size: 24, color: Theme.of(context).colorScheme.primary),
            ),
            Text('This Weeks'),
            IconButton(
              onPressed: () {
                /// TODO: Add funciton to navigate to prev weeks
              },
              icon: Icon(Icons.arrow_right, size: 24, color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
