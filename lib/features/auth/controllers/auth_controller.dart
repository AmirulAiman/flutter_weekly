import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/app/routes/app_routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final isLoading = false.obs;
  bool _initialized = false;
  Rxn<User> user = Rxn<User>();

  final emailCtrl = TextEditingController(text: 'asuna0amirul@gmail.com'); //TODO: Remove later
  final passwordCtrl = TextEditingController(text: 'abcd1234'); //TODO: Remove later

  @override
  void onInit() {
    user.bindStream(_auth.authStateChanges());
    ever(user, _handleAuthChanged);
    super.onInit();
  }

  void _handleAuthChanged(User? user) {
    if (!_initialized) {
      _initialized = true;
      return; // skip first emission (fires before app is ready)
    }

    if (user == null) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      Get.offAllNamed(AppRoutes.home);
    }
  }

  Future<void> login() async {
    try {
      isLoading(true);
      final email = emailCtrl.value.text;
      final password = passwordCtrl.value.text;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAndToNamed(AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Login Failed', e.message ?? 'Unknown error');
    } finally {
      isLoading(false);
    }
  }

  Future<void> register() async {
    try {
      isLoading(true);
      final email = emailCtrl.value.text.trim();
      final password = passwordCtrl.value.text.trim();
      if (email.isEmpty || password.isEmpty) {
        throw FirebaseAuthException(code: '400', message: 'Email/Password is required');
      }
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.offAndToNamed(AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Register Failed', e.message ?? 'Unknown error');
    } catch (e) {
      Get.snackbar('Register Failed', e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
