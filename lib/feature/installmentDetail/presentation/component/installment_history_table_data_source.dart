import 'package:flutter/material.dart';
import '../../../installment/domain/model/installment_application.dart';

class InstallmentHistoryTableSource extends DataTableSource {
  final List<InstallmentApplication> installments;

  InstallmentHistoryTableSource({required this.installments});
  @override
  DataRow? getRow(int index) {
    final record = installments[index];
    return DataRow(cells: [
      DataCell(Text('${record.price}')),
      DataCell(Text(record.createdAt)),
      const DataCell(Text('Paid')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => installments.length;

  @override
  int get selectedRowCount => 0;

}