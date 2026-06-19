import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/auth/controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

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
                : ElevatedButton(onPressed: () => controller.login(), child: Text('Login')),
          ),
        ],
      ),
    );
  }
}
