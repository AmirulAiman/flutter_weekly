import 'package:get/get.dart';
import 'package:weekly/app/routes/app_routes.dart';
import 'package:weekly/features/auth/bindings/auth_bindings.dart';
import 'package:weekly/features/auth/views/login_view.dart';
import 'package:weekly/features/auth/views/register_view.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.login, page: () => const LoginView(), binding: AuthBindings()),
    GetPage(name: AppRoutes.register, page: () => const RegisterView(), binding: AuthBindings()),
    //  TODO: Add Homepage here
  ];
}
