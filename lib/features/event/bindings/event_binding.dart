import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:weekly/core/services/database_service.dart';
import 'package:weekly/features/event/controllers/event_controller.dart';
import 'package:weekly/features/event/data/local_db_source.dart';
import 'package:weekly/features/event/data/remote_db_source.dart';
import 'package:weekly/features/event/repositories/event_repository.dart';

class EventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalDbSource>(() => LocalDbSource(Get.find<DatabaseService>()));
    Get.lazyPut<RemoteDbSource>(() => RemoteDbSource(FirebaseFirestore.instance));
    Get.lazyPut(() => EventRepository(local: Get.find(), remote: Get.find()));
    Get.lazyPut(() => EventController(Get.find<EventRepository>()));
  }
}
