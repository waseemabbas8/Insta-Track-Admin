import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../feature/dashboard/presentation/dashboard_bindings.dart';
import '../../feature/dashboard/presentation/dashboard_page.dart';
import '../../feature/user/presentation/users_bindings.dart';
import '../../feature/user/presentation/users_page.dart';
import 'app_routes.dart';

class HomeNavigation {
  HomeNavigation._();

  static int id = 2;

  static GetPageRoute getPage(RouteSettings route) {
    switch(route.name) {
      case '/':
        return _defaultRoute();
      case AppRoutes.dashboard:
        return _defaultRoute();
      case AppRoutes.users:
        UsersBindings();
        return GetPageRoute(
            page: () => const UsersPage()
        );
      default:
        throw Exception('Invalid route');
    }
  }

  static GetPageRoute _defaultRoute() {
    DashboardBindings();
    return GetPageRoute(
        page: () => const DashboardPage()
    );
  }
}