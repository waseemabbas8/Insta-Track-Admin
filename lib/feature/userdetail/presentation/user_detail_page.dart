import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intatrack/core/widget/button_widget.dart';
import 'package:intatrack/core/widget/label.dart';
import 'package:intatrack/feature/userdetail/presentation/component/contacts.dart';
import 'package:intatrack/feature/userdetail/presentation/component/credit.dart';

import '../../../core/base_page.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/dimens.dart';
import '../../../core/widget/header.dart';
import 'user_detail_controller.dart';

class UserDetailPage extends BasePage<UserDetailController> {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(title: 'Ask Details', hasBackNav: true, onBackPressed: controller.onBack),
          Spacing.v10,
          Expanded(
            child: Card(
              child: Padding(
                padding: Margin.all16,
                child: Row(
                  children: [
                    Expanded(flex: 2, child: _profileSection),
                    const VerticalDivider(),
                    const Expanded(flex: 3, child: CreditDetail()),
                    const VerticalDivider(),
                    const Expanded(flex: 3, child: Contacts()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _profileSection => Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacing.v20,
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.blueGrey),
              ),
              padding: Margin.all8,
              child: CircleAvatar(
                backgroundImage: NetworkImage(controller.user.image),
                radius: 70,
              ),
            ),
            Spacing.v20,
            Text(controller.user.name, style: Get.textTheme.titleLarge),
            Spacing.v5,
            Text(
              controller.user.email,
              style: Get.textTheme.titleSmall?.copyWith(color: AppColors.fontColorPallets[2]),
            ),
            Spacing.v10,
            LoadingViewButton(
              text: controller.user.isActive ? 'InActive' : 'Activate',
              color: controller.user.isActive ? Colors.red : Colors.green,
              isLoading: controller.activatingUser,
              onPressed: controller.onUserActivation,
            ),
            Spacing.v10,
            const Divider(thickness: 1),
            Spacing.v12,
            SizedBox(
              width: Get.width,
              child: Text(
                'Contact Info',
                style: Get.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Spacing.v20,
            _buildContactWidget(Icons.phone_android_sharp, controller.user.phone),
            Spacing.v5,
            _buildContactWidget(Icons.location_city_sharp, controller.user.city),
            Spacing.v5,
            _buildContactWidget(Icons.location_on_rounded, controller.user.address),
            Spacing.v20,
            Row(
              children: [LabelText(controller.user.createdAt, textStyle: Get.textTheme.titleSmall)],
            ),
          ],
        ),
      );

  Widget get _location => Container();

  Widget _buildContactWidget(IconData iconData, String title) => Row(
        children: [
          Icon(iconData, size: 16, color: AppColors.fontColorPallets[1]),
          Spacing.h10,
          Text(
            title,
            style: Get.textTheme.titleSmall?.copyWith(color: AppColors.fontColorPallets[2]),
          ),
        ],
      );
}
