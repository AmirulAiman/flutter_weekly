import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/auth/controllers/auth_controller.dart';
import 'package:weekly/features/auth/widgets/auth_text_field.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
        child: Column(
          children: [
            AuthTextField(controller: controller.emailCtrl, label: 'Email'),
            SizedBox(height: 16),
            Obx(
              () => AuthTextField(
                controller: controller.emailCtrl,
                label: 'Passowrd',
                isObscure: controller.obscurePassword.value,
              ),
            ),
            SizedBox(height: 16),
            Obx(
              () => ElevatedButton(
                onPressed: controller.isLoading.value ? null : controller.login,
                child: controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
