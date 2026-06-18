import 'package:get/get.dart';
import 'package:weekly/features/auth/controllers/auth_controller.dart';
import 'package:weekly/features/auth/repositories/auth_repository.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository(), fenix: true);
    Get.lazyPut<AuthController>(() => AuthController(Get.find<AuthRepository>()), fenix: true);
  }
}
