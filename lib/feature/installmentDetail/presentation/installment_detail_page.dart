import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intatrack/feature/installmentDetail/presentation/component/installment_history.dart';
import '../../../core/base_page.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/dimens.dart';
import '../../../core/widget/button_widget.dart';
import '../../../core/widget/header.dart';
import '../../../core/widget/label.dart';
import '../../../core/widget/search_field.dart';
import '../../userdetail/presentation/component/contacts.dart';
import '../../userdetail/presentation/component/credit.dart';
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
                    const Expanded(flex: 2, child: Column(
                      children: [
                        CreditDetail(),
                        Expanded(child: InstallmentHistory())
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
            _buildProductDetailWidget('Brand', 'Apple'),
            Spacing.v5,
            _buildProductDetailWidget('Model', 'iPhone 11 Pro Max'),
            Spacing.v5,
            _buildProductDetailWidget('Price', '150,000'),
            Spacing.v5,
            _buildProductDetailWidget('Brand', 'Apple'),
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

  Widget get _profileSection => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacing.v12,
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2.0, color: Colors.blueGrey),
            ),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://fastly.picsum.photos/id/91/200/300.jpg?hmac=MJmqvWth15jZIlWiHwt01J_qoMRgygGRm0nf1adZtdE'),
              radius: 30,
            ),
          ),
          Spacing.v12,
          Text('Ali', style: Get.textTheme.titleLarge),
          Spacing.v5,
          Text(
            'ali@devcrew.io',
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
          _buildContactWidget(Icons.phone_android_sharp, '03084248718'),
          Spacing.v5,
          _buildContactWidget(Icons.location_city_sharp, 'Lahore'),
          Spacing.v5,
          _buildContactWidget(Icons.location_on_rounded, 'Daroghewala'),
          Spacing.v20,
        ],
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
