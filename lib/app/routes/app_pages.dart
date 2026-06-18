import 'package:get/get.dart';
import 'package:weekly/app/routes/app_routes.dart';
import 'package:weekly/features/auth/bindings/auth_bindings.dart';
import 'package:weekly/features/auth/views/login_view.dart';
import 'package:weekly/features/auth/views/register_view.dart';
import 'package:weekly/features/event/bindings/event_binding.dart';
import 'package:weekly/features/event/views/event_view.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.login, page: () => const LoginView(), binding: AuthBindings()),
    GetPage(name: AppRoutes.register, page: () => const RegisterView(), binding: AuthBindings()),
    GetPage(name: AppRoutes.home, page: () => const EventView(), binding: EventBinding()),
  ];
}
