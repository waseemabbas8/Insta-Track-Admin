import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/values/dimens.dart';
import '../../../installment/domain/model/installment_application.dart';
import '../installment_detail_controller.dart';
import 'installment_history_table_data_source.dart';

class InstallmentHistory extends StatelessWidget {
  const InstallmentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InstallmentDetailController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.v20,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Installment History',
              style: Get.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Spacing.v12,
          Expanded(
            child: controller.application.status != 1
                ? Text('No Data found!', style: Get.textTheme.titleMedium)
                : _InstallmentHistoryTable(installment: controller.application),
          ),
        ],
      ),
    );
  }
}

class _InstallmentHistoryTable extends StatelessWidget {
  final InstallmentApplication installment;

  const _InstallmentHistoryTable({Key? key, required this.installment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable2(
      columnSpacing: 10,
      source: InstallmentHistoryTableSource(installment: installment),
      columns: const [
        DataColumn(
          label: Text("Amount(PKR)"),
        ),
        DataColumn(
          label: Text("Paid Date"),
        ),
        DataColumn(
          label: Text("Status"),
        ),
      ],
    );
  }
}
