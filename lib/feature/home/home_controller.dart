import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/base_page.dart';
import '../../core/route/home_navigation.dart';
import '../../core/utils/constants.dart';
import 'component/project_card.dart';
import 'component/selection_button.dart';

class HomeController extends BaseController {

  HomeController();

  ProjectCardData getSelectedProject() {
    return ProjectCardData(
      percent: .3,
      projectImage: const AssetImage('${ImagePath.base}logo-1.png'),
      projectName: "InstaTrack Admin",
      releaseTime: DateTime.now(),
    );
  }

  void onMenuItemSelected(int index, SelectionButtonData value) {
    if(value.routeName == Get.currentRoute) return;
    Get.toNamed(value.routeName, id: HomeNavigation.id);
  }
}