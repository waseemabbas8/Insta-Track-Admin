import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/base_page.dart';
import '../../core/route/home_navigation.dart';
import '../../core/utils/responsive_builder.dart';
import '../../core/values/dimens.dart';
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
                  child: Sidebar(
                    data: controller.getSelectedProject(),
                    onItemSelected: controller.onMenuItemSelected,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Margin.h20v10,
                  child: Navigator(
                    key: Get.nestedKey(HomeNavigation.id),
                    initialRoute: '/',
                    onGenerateRoute: HomeNavigation.getPage,
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
