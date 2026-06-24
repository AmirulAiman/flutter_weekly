import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/app/routes/app_routes.dart';
import 'package:weekly/features/auth/widgets/auth_logo.dart';
import 'package:weekly/features/auth/widgets/auth_primary_button.dart';
import 'package:weekly/features/auth/widgets/auth_text_field.dart';
import 'package:weekly/features/auth/widgets/custom_divider.dart';
import 'package:weekly/features/auth/widgets/social_button.dart';

import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Logo
              const Center(child: AuthLogo()),
              const SizedBox(height: 36),

              // Title
              const Text(
                'Log in',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                  letterSpacing: -0.5,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 28),

              // Email field
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 8),
              AuthTextField(
                placeholder: 'Your email',
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailCtrl,
              ),
              const SizedBox(height: 18),

              // Password field
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 8),
              AuthTextField(
                placeholder: 'Enter your password',
                isPassword: true,
                controller: controller.passwordCtrl,
              ),
              const SizedBox(height: 12),

              // Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // TODO: Add forget password function
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF1A1A1A),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // Log in button
              AuthPrimaryButton(
                label: 'Log in',
                onTap: () => controller.login(),
                isLoading: controller.isLoading.value,
              ),
              const SizedBox(height: 28),

              // Or divider
              const CustomDivider(text: 'Or log in with'),
              const SizedBox(height: 22),

              // Social buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [SocialButton(icon: const GoogleIcon(), onTap: () {})],
              ),
              const SizedBox(height: 36),

              // Sign up link
              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.register),
                  child: Text.rich(
                    const TextSpan(
                      text: "Don't have an account?  ",
                      style: TextStyle(fontSize: 13, color: Color(0xFF888888)),
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
