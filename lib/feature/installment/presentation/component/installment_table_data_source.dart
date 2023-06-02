import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/widget/button_widget.dart';
import '../../../../core/widget/label.dart';
import '../../domain/model/installment_application.dart';
import '../installments_controller.dart';

class InstallmentTableSource extends DataTableSource {
  final List<InstallmentApplication> installmentsApplications;

  InstallmentTableSource({required this.installmentsApplications});

  final InstallmentsController installmentsController = Get.find();

  @override
  DataRow? getRow(int index) {
    final installmentApplication = installmentsApplications[index];
    return DataRow(cells: [
      DataCell(Text(installmentApplication.userInfo.fullName)),
      DataCell(Text(installmentApplication.userInfo.phone)),
      DataCell(Text(installmentApplication.productInfo.name)),
      DataCell(Text('${installmentApplication.productInfo.price}')),
      DataCell(Text(installmentApplication.advance.toString())),
      DataCell(Text('${installmentApplication.installmentCount.total}')),
      DataCell(Text(DateFormat('yyyy-MM-dd')
          .format(installmentApplication.createdAt.toDate()))),
      DataCell(GestureDetector(
          onTap: () => installmentsController
              .onViewInstallmentDetail(installmentApplication),
          child: _actionButtons(installmentApplication))),
    ]);
  }

  Widget _actionButtons(InstallmentApplication userApplication) {
    final activeButton = userApplication.status == 0
        ? const LabelText('Pending', bgColor: Colors.grey)
        : userApplication.status == 1
            ? const LabelText('Approved')
            : const LabelText('Rejected', bgColor: Colors.red);
    return activeButton;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => installmentsApplications.length;

  @override
  int get selectedRowCount => 0;
}
