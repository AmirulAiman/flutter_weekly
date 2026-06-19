import 'package:get/get.dart';
import 'package:weekly/features/auth/bindings/auth_binding.dart';
import 'package:weekly/features/auth/views/login_view.dart';
import 'package:weekly/features/auth/views/register_view.dart';
import 'package:weekly/features/home/views/home_view.dart';

abstract class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => LoginView(), binding: AuthBinding()),
    GetPage(name: AppRoutes.register, page: () => RegisterView(), binding: AuthBinding()),
    GetPage(name: AppRoutes.home, page: () => HomeView()),
  ];
}
