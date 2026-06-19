import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/auth/controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(controller: controller.emailCtrl),
          TextField(controller: controller.passwordCtrl, obscureText: true),
          Obx(
            () => controller.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(onPressed: () => controller.register(), child: Text('Register')),
          ),
        ],
      ),
    );
  }
}
