import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/route/app_pages.dart';
import 'core/route/app_routes.dart';
import 'core/theme/dark_theme.dart';
import 'feature/root/root_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      initialBinding: RootBindings(),
      initialRoute: AppRoutes.root,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
