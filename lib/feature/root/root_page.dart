import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/base_page.dart';
import 'root_controller.dart';

class RootPage extends BasePage<RootController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.loadingData ? const CircularProgressIndicator() : Container(),
        ),
      ),
    );
  }
}
