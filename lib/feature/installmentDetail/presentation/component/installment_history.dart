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
          Text(
            'Installment History',
            style:
                Get.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          Spacing.v12,
          Expanded(
            child:
                _InstallmentHistoryTable(installments: controller.installments),
          ),
        ],
      ),
    );
  }
}

class _InstallmentHistoryTable extends StatelessWidget {
  final List<InstallmentApplication> installments;

  const _InstallmentHistoryTable({Key? key, required this.installments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable2(
      columnSpacing: 10,
      source: InstallmentHistoryTableSource(installments: installments),
      columns: const [
        DataColumn(
          label: Text("Amount(PKR)"),
        ),
        DataColumn(
          label: Text("Payment Method"),
        ),
        DataColumn(
          label: Text("Paid Date"),
        ),
      ],
    );
  }
}
