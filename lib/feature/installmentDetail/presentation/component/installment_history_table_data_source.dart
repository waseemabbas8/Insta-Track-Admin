import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../installment/domain/model/installment_application.dart';
import '../installment_detail_controller.dart';

class InstallmentHistoryTableSource extends DataTableSource {
  final InstallmentApplication installment;

  InstallmentHistoryTableSource({required this.installment});

  final InstallmentDetailController controller = Get.find();

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(
          '${(installment.productInfo.price - installment.advance) / (installment.installmentCount.total)}')),
      const DataCell(Text('20-12-2022')),
      const DataCell(Text('Paid')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => installment.installmentCount.total;

  @override
  int get selectedRowCount => 0;
}
