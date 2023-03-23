import 'package:flutter/material.dart';
import 'package:intatrack/core/utils/constants.dart';

import '../../core/base_page.dart';
import 'component/project_card.dart';

class HomeController extends BaseController {

  ProjectCardData getSelectedProject() {
    return ProjectCardData(
      percent: .3,
      projectImage: const AssetImage('${ImagePath.base}logo-1.png'),
      projectName: "InstaTrack Admin",
      releaseTime: DateTime.now(),
    );
  }
}