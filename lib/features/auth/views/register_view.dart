import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/auth/controllers/auth_controller.dart';
import 'package:weekly/features/auth/widgets/auth_text_field.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AuthTextField(controller: controller.emailCtrl, label: 'Email', hintText: 'Your email'),

            const SizedBox(height: 16),

            AuthTextField(
              controller: controller.passwordCtrl,
              label: 'Password',
              hintText: 'Enter your email',
              obscureText: true,
            ),

            const SizedBox(height: 24),

            Obx(
              () => ElevatedButton(
                onPressed: controller.isLoading.value ? null : controller.register,
                child: controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
