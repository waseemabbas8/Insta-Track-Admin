import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/base_page.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/dimens.dart';
import '../../../core/widget/header.dart';
import '../../userdetail/presentation/component/credit.dart';
import '../domain/model/credit_info.dart';
import 'component/installment_history.dart';
import 'installment_detail_controller.dart';

class InstallmentDetailPage extends BasePage<InstallmentDetailController> {
  const InstallmentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(
              title: 'Application Detail',
              hasBackNav: true,
              onBackPressed: controller.onBack),
          Spacing.v10,
          Expanded(
            child: Card(
              child: Padding(
                padding: Margin.all16,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [_profileSection, _productSection],
                        )),
                    const VerticalDivider(),
                    Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            CreditDetail(
                                creditInfo: CreditInfo(
                              controller.application.productInfo.price,
                              controller.application.installmentCount.total,
                              controller.application.installmentCount.paid,
                            )),
                            const Expanded(child: InstallmentHistory())
                          ],
                        )),
                    // const VerticalDivider(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _productSection => SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(thickness: 1),
            Spacing.v20,
            Text(
              'Product Info',
              style: Get.textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),
            Spacing.v12,
            _buildProductDetailWidget(
                'Brand', controller.application.productInfo.name),
            Spacing.v5,
            _buildProductDetailWidget(
                'Model', controller.application.productInfo.model),
            Spacing.v5,
            _buildProductDetailWidget(
                'Price', controller.application.productInfo.price.toString()),
            Spacing.v20,
          ],
        ),
      );

  Widget _buildProductDetailWidget(String title, String desc) => RichText(
        text: TextSpan(
          style: Get.textTheme.titleSmall
              ?.copyWith(color: AppColors.fontColorPallets[2]),
          children: [
            TextSpan(
                text: '$title : ',
                style: Get.textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.w800)),
            TextSpan(text: desc),
          ],
        ),
      );

  Widget get _profileSection => Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacing.v12,
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.blueGrey),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(controller.user.image),
                radius: 30,
              ),
            ),
            Spacing.v12,
            Text(controller.user.name, style: Get.textTheme.titleLarge),
            Spacing.v5,
            Text(
              controller.user.email,
              style: Get.textTheme.titleSmall
                  ?.copyWith(color: AppColors.fontColorPallets[2]),
            ),
            Spacing.v10,
            const Divider(thickness: 1),
            Spacing.v10,
            SizedBox(
              width: Get.width,
              child: Text(
                'Contact Info',
                style: Get.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Spacing.v12,
            _buildContactWidget(
                Icons.phone_android_sharp, controller.user.phone),
            Spacing.v5,
            _buildContactWidget(
                Icons.location_city_sharp, controller.user.city),
            Spacing.v5,
            _buildContactWidget(
                Icons.location_on_rounded, controller.user.address),
            Spacing.v20,
          ],
        ),
      );

  Widget _buildContactWidget(IconData iconData, String title) => Row(
        children: [
          Icon(iconData, size: 16, color: AppColors.fontColorPallets[1]),
          Spacing.h10,
          Text(
            title,
            style: Get.textTheme.titleSmall
                ?.copyWith(color: AppColors.fontColorPallets[2]),
          ),
        ],
      );
}
