import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/route/app_pages.dart';
import 'core/route/app_routes.dart';
import 'core/theme/dark_theme.dart';
import 'feature/root/root_bindings.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'InstaTrack',
      theme: darkTheme,
      defaultTransition: Transition.noTransition,
      initialBinding: RootBindings(),
      initialRoute: AppRoutes.root,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
