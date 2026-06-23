import 'package:get/get.dart';
import 'package:weekly/data/database_helper.dart';
import 'package:weekly/features/home/controllers/home_controller.dart';
import 'package:weekly/features/home/repositories/home_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DatabaseHelper());
    Get.put<HomeRepository>(HomeRepositoryImp(Get.find<DatabaseHelper>()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
