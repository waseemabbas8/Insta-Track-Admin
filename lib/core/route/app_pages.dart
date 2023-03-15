import 'package:get/get.dart';

import '../../feature/root/root_bindings.dart';
import '../../feature/root/root_page.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.root,
      page: () => const RootPage(),
      binding: RootBindings(),
    ),
  ];
}
