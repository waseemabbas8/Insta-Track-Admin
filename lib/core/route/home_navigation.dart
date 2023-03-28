import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intatrack/feature/user/presentation/users_bindings.dart';

import '../../feature/dashboard/presentation/dashboard_page.dart';
import '../../feature/user/presentation/users_page.dart';
import 'app_routes.dart';

class HomeNavigation {
  HomeNavigation._();

  static int id = 2;

  static const DashboardPage _dashboard = DashboardPage();
  static const UsersPage _users = UsersPage();

  static GetPageRoute getPage(RouteSettings route) {
    switch (route.name) {
      case '/':
        return GetPageRoute(page: () => _dashboard);
      case AppRoutes.dashboard:
        return GetPageRoute(page: () => _dashboard);
      case AppRoutes.users:
        return GetPageRoute(page: () {
          UsersBindings().dependencies();
          return _users;
        });
      default:
        throw Exception('Invalid route name');
    }
  }
}
