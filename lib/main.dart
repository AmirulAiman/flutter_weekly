import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/app/routes/app_pages.dart';
import 'package:weekly/app/routes/app_routes.dart';
import 'package:weekly/core/services/database_service.dart';
import 'package:weekly/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.put(DatabaseService(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance.currentUser;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weekly',
      getPages: AppPages.routes,
      initialRoute: auth == null ? AppRoutes.login : AppRoutes.home,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
    );
  }
}
