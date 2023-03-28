import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base_page.dart';
import '../../../core/values/dimens.dart';
import '../../../core/widget/header.dart';
import '../../../core/widget/search_field.dart';
import 'component/users_table.dart';
import 'users_controller.dart';

class UsersPage extends BasePage<UsersController> {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(title: 'Manage Users'),
          Spacing.v20,
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: 400,
              child: SearchField(onSearch: controller.onSearch),
            ),
          ),
          Obx(
            () => controller.loadingData
                ? const CircularProgressIndicator()
                : controller.users.isEmpty
                    ? Text('No Users found', style: Get.textTheme.titleMedium)
                    : Expanded(
                        child: UsersTable(users: controller.users),
                      ),
          ),
        ],
      ),
    );
  }
}
