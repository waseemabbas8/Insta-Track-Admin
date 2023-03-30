import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intatrack/core/values/colors.dart';

import '../../../../core/values/dimens.dart';

class CreditDetail extends StatelessWidget {
  const CreditDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.v20,
          Text(
            'Credit Details',
            style: Get.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          Spacing.v20,
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(6),
            ),
            padding: Margin.all8,
            child: Center(
              child: Text(
                '10,000 PKR',
                style: Get.textTheme.titleSmall?.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacing.v20,
          Row(
            children: [
              Expanded(child: _buildInstallmentCount(14, 'Installments')),
              Expanded(child: _buildInstallmentCount(2, 'Paid')),
              Expanded(child: _buildInstallmentCount(10, 'Pending')),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInstallmentCount(int count, String title) => Column(
    mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Get.textTheme.bodySmall?.copyWith(color: AppColors.fontColorPallets[2]),
          ),
          Text(
            count.toString(),
            style: Get.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      );
}
