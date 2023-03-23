import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base_page.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/dimens.dart';
import '../../../core/widget/header.dart';
import 'component/summary_card.dart';
import 'dashboard_controller.dart';

class DashboardPage extends BasePage<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Header(title: 'Dashboard'),
          Spacing.v20,
          _SummaryCardGridView(childAspectRatio: 1.8,),
        ],
      ),
    );
  }
}

class _SummaryCardGridView extends StatelessWidget {
  const _SummaryCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dummyItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => SummaryCard(uiModel: dummyItems[index]),
    );
  }
}

//TODO: remove the dummy list
final dummyItems = [
  SummaryCarUiModel(
    iconData: Icons.account_box_outlined,
    title: 'Users',
    count: 34,
    color: AppColors.primaryLight,
  ),
  SummaryCarUiModel(
    iconData: Icons.production_quantity_limits_outlined,
    title: 'Products',
    count: 10,
    color: const Color(0xFFFFA113),
  ),
];
