import 'package:get/get.dart';
import 'package:weekly/data/database_service.dart';
import 'package:weekly/features/home/controllers/home_controller.dart';
import 'package:weekly/features/home/repositories/home_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DatabaseService());
    Get.put<HomeRepository>(HomeRepositoryImp(Get.find<DatabaseService>()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
