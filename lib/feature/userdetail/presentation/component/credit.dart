import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intatrack/core/values/colors.dart';
import '../../../../core/values/dimens.dart';
import '../../../installmentDetail/domain/model/credit_info.dart';

class CreditDetail extends StatelessWidget {
  const CreditDetail({Key? key, this.creditInfo}) : super(key: key);

  final CreditInfo? creditInfo;

  @override
  Widget build(BuildContext context) {
    int pending = 0;
    if (creditInfo != null) {
      pending = (creditInfo!.total) - (creditInfo!.paid);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.v20,
          Text(
            'Credit Details',
            style:
                Get.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
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
                creditInfo?.price.toString() ?? '0 PKR',
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
              Expanded(
                  child: _buildInstallmentCount(
                      creditInfo?.total ?? 0, 'Installments')),
              Expanded(
                  child: _buildInstallmentCount(creditInfo?.paid ?? 0, 'Paid')),
              Expanded(child: _buildInstallmentCount(pending, 'Pending')),
            ],
          ),
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
            style: Get.textTheme.bodySmall
                ?.copyWith(color: AppColors.fontColorPallets[2]),
          ),
          Text(
            count.toString(),
            style: Get.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      );
}
