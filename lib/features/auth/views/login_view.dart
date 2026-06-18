import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/auth/controllers/auth_controller.dart';
import 'package:weekly/features/auth/widgets/auth_text_field.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text('Login')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(color: Colors.grey.shade100, shape: BoxShape.circle),
                  child: const Icon(Icons.edit, size: 36, color: Color(0xff2E313D)),
                ),
              ),
              SizedBox(height: 40),
              const Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff1E1E28),
                ),
              ),
              SizedBox(height: 40),
              AuthTextField(
                controller: controller.emailCtrl,
                label: 'Email',
                hintText: 'Your email',
              ),
              SizedBox(height: 16),
              Obx(
                () => AuthTextField(
                  controller: controller.passwordCtrl,
                  label: 'Passowrd',
                  hintText: 'Enter your password',
                  obscureText: controller.obscurePassword.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.obscurePassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      controller.obscurePassword.toggle();
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: 26,
                    height: 26,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff2E313D),
                    ),
                    child: const Icon(Icons.check, size: 16, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'I accept the terms and privacy policy',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 62,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: controller.isLoading.value ? null : controller.login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2E313D),
                      elevation: 12,
                      shadowColor: Colors.black.withValues(alpha: .2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
