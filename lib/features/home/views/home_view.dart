import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Home View')));
  }
}
