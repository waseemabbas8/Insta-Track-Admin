import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intatrack/feature/application/presentation/component/applications_table.dart';
import '../../../core/base_page.dart';
import '../../../core/values/dimens.dart';
import '../../../core/widget/header.dart';
import '../../../core/widget/search_field.dart';
import 'applications_controller.dart';

class ApplicationsPage extends BasePage<ApplicationsController> {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(title: 'Applications'),
          Spacing.v10,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 350,
                child: SearchField(onSearch: controller.onSearch),
              ),
            ],
          ),
          Obx(
            () => controller.loadingData
                ? const CircularProgressIndicator()
                : controller.userApplications.isEmpty
                    ? Text('No Applications found', style: Get.textTheme.titleMedium)
                    : Expanded(
                        child: ApplicationsTable(userApplications: controller.userApplications),
                      ),
          ),
        ],
      ),
    );
  }
}
