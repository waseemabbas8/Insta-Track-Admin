import 'package:get/get.dart';

import '../../feature/auth/presentation/login/login_bindings.dart';
import '../../feature/auth/presentation/login/login_page.dart';
import '../../feature/home/home_bindings.dart';
import '../../feature/home/home_page.dart';
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
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
