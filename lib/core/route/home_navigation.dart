import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intatrack/feature/installment/presentation/installments_bindings.dart';
import 'package:intatrack/feature/installment/presentation/installments_page.dart';
import 'package:intatrack/feature/user/presentation/users_bindings.dart';
import '../../feature/dashboard/presentation/dashboard_page.dart';
import '../../feature/product/presentation/products_bindings.dart';
import '../../feature/product/presentation/products_page.dart';
import '../../feature/user/presentation/users_page.dart';
import '../../feature/userdetail/presentation/user_detail_bindings.dart';
import '../../feature/userdetail/presentation/user_detail_page.dart';
import 'app_routes.dart';

class HomeNavigation {
  HomeNavigation._();

  static int id = 2;

  static const DashboardPage _dashboard = DashboardPage();
  static const UsersPage _users = UsersPage();
  static const UserDetailPage _userDetail = UserDetailPage();
  static const InstallmentsPage _installmentsPage = InstallmentsPage();
  static const ProductsPage _products = ProductsPage();

  static GetPageRoute getPage(RouteSettings route) {
    Get.routing.args = route.arguments;
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
      case AppRoutes.usersDetail:
        return GetPageRoute(page: () {
          UserDetailBindings().dependencies();
          return _userDetail;
        });
      case AppRoutes.loans:
        return GetPageRoute(page: () {
          InstallmentsBindings().dependencies();
          return _installmentsPage;
        });
      case AppRoutes.products:
        return GetPageRoute(page: () {
          ProductsBindings().dependencies();
          return _products;
        });
      default:
        throw Exception('Invalid route name');
    }
  }
}
