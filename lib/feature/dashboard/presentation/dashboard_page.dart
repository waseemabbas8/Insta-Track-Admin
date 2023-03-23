import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intatrack/core/values/dimens.dart';
import 'package:intatrack/core/widget/header.dart';

import '../../../core/base_page.dart';
import 'dashboard_controller.dart';

class DashboardPage extends BasePage<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Header(),
        ],
      ),
    );
  }
}