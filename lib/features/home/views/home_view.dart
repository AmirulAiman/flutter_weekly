import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/home/controllers/home_controller.dart';
import 'package:weekly/features/home/widgets/day_task_tile.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
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
              onPressed: () {},
              icon: Icon(Icons.arrow_left, size: 24, color: Colors.white),
            ),
            Text('This Weeks'),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_right, size: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
