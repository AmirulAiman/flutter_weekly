import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/app/routes/app_routes.dart';
import 'package:weekly/features/auth/repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  AuthController(this.repository);

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  final isLoading = false.obs;
  final obscurePassword = true.obs;

  @override
  void onInit() {
    repository.authStateChanges().listen((user) {
      if (user != null) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    });
    super.onInit();
  }

  Future<void> login() async {
    try {
      isLoading(true);
      final email = emailCtrl.text;
      final password = passwordCtrl.text;
      await repository.login(email, password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Login Failed', e.message ?? 'Unknown Error');
    } finally {
      isLoading(false);
    }
  }

  Future<void> register() async {
    try {
      isLoading(true);
      final email = emailCtrl.text;
      final password = passwordCtrl.text;
      await repository.register(email, password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Register Failed', e.message ?? 'Unknown Error');
    } finally {
      isLoading(false);
    }
  }

  Future<void> logout() async {
    await repository.logout();
  }
}
