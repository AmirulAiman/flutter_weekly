import 'package:get/get.dart';
import 'package:weekly/features/auth/bindings/auth_binding.dart';
import 'package:weekly/features/auth/views/login_view.dart';
import 'package:weekly/features/auth/views/register_view.dart';
import 'package:weekly/features/home/bindings/home_binding.dart';
import 'package:weekly/features/home/views/home_view.dart';
import 'package:weekly/features/profile/views/profile_view.dart';

abstract class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const profile = '/profile';
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => LoginView(), binding: AuthBinding()),
    GetPage(name: AppRoutes.register, page: () => RegisterView(), binding: AuthBinding()),
    GetPage(name: AppRoutes.home, page: () => HomeView(), binding: HomeBinding()),
    GetPage(name: AppRoutes.profile, page: () => ProfileView()),
  ];
}
