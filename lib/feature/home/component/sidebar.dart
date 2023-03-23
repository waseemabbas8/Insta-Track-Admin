import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/dimens.dart';
import 'project_card.dart';
import 'selection_button.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    required this.data,
    Key? key,
  }) : super(key: key);

  final ProjectCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Padding(
              padding: Margin.all20,
              child: ProjectCard(data: data),
            ),
            const Divider(thickness: 1),
            SelectionButton(
              data: [
                SelectionButtonData(
                  activeIcon: Icons.dashboard,
                  icon: Icons.dashboard_outlined,
                  label: "Dashboard",
                ),
                SelectionButtonData(
                  activeIcon: Icons.supervised_user_circle,
                  icon: Icons.supervised_user_circle_outlined,
                  label: "Manage Users",
                ),
                SelectionButtonData(
                  activeIcon: Icons.monetization_on,
                  icon: Icons.monetization_on_outlined,
                  label: "Loan Applications",
                ),
                SelectionButtonData(
                  activeIcon: Icons.money,
                  icon: Icons.money_outlined,
                  label: "Installments",
                ),
                SelectionButtonData(
                  activeIcon: Icons.production_quantity_limits,
                  icon: Icons.production_quantity_limits_outlined,
                  label: "Products",
                ),
                SelectionButtonData(
                  activeIcon: Icons.settings,
                  icon: Icons.settings_outlined,
                  label: "Setting",
                ),
              ],
              onSelected: (index, value) {
                print("index : $index | label : ${value.label}");
              },
            ),
            const Divider(thickness: 1),
            Spacing.v40,
            Padding(
              padding: Margin.all20,
              child: _poweredByCard,
            ),
            Spacing.v20,
          ],
        ),
      ),
    );
  }

  Widget get _poweredByCard => Card(
        color: Get.theme.canvasColor.withOpacity(.4),
        child: Container(
          margin: Margin.all20,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Developed by'),
              const SizedBox(height: 2),
              Text(
                'WASEEM ABBAS',
                style: Get.textTheme.bodySmall?.copyWith(color: AppColors.fontColorPallets[2]),
              ),
              Spacing.v10,
              Text(
                '+92 302 1888898',
                style: Get.textTheme.bodySmall?.copyWith(color: AppColors.fontColorPallets[2]),
              ),
              const SizedBox(height: 3),
              Text(
                'waseemabbas.com',
                style: Get.textTheme.bodySmall?.copyWith(color: AppColors.fontColorPallets[2]),
              ),
              Spacing.v10,
              Text(
                '© ${DateTime.now().year} InstaTrack',
                style: Get.textTheme.bodySmall?.copyWith(color: AppColors.fontColorPallets[2]),
              ),

            ],
          ),
        ),
      );
}
