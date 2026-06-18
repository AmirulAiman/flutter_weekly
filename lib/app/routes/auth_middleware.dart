import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:weekly/app/routes/app_routes.dart';
import 'package:weekly/features/auth/repositories/auth_repository.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final auth = Get.find<AuthRepository>();
    if (auth.currentUser == null) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
