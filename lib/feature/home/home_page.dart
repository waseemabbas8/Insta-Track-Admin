import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intatrack/core/route/app_routes.dart';
import 'package:intatrack/core/values/dimens.dart';
import 'package:intatrack/feature/dashboard/presentation/dashboard_page.dart';

import '../../core/base_page.dart';
import '../../core/utils/responsive_builder.dart';
import 'component/sidebar.dart';
import 'home_controller.dart';

class HomePage extends BasePage<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        mobileBuilder: (context, constraints) {
          return const Text('Mobile');
        },
        tabletBuilder: (BuildContext context, BoxConstraints constraints) {
          return const Text('Tablet');
        },
        desktopBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 260,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Sidebar(data: controller.getSelectedProject())),
              ),
              Expanded(
                child: Padding(
                  padding: Margin.h20v10,
                  child: Navigator(
                    key: Get.nestedKey(1),
                    initialRoute: AppRoutes.dashboard,
                    onGenerateRoute: (route) {
                      switch(route.name) {
                        case AppRoutes.dashboard:
                          return GetPageRoute(
                              page: () => DashboardPage()
                          );
                        default:
                          return GetPageRoute(
                              page: () => const DashboardPage()
                          );
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
