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
        title: Text('Weekly'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
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
    );
  }
}
