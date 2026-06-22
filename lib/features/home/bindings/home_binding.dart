import 'package:get/get.dart';
import 'package:weekly/features/home/controllers/home_controller.dart';
import 'package:weekly/features/home/repositories/home_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImp(Get.find()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
