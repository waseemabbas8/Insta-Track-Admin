import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      DataCell(Text(installmentApplication.name)),
      DataCell(Text(installmentApplication.phone)),
      DataCell(Text(installmentApplication.product)),
      DataCell(Text('${installmentApplication.price}')),
      DataCell(Text(installmentApplication.advance)),
      DataCell(Text('${installmentApplication.installmentsCount}')),
      DataCell(Text(installmentApplication.createdAt)),
      DataCell(GestureDetector(
          onTap: () {
            installmentsController.onViewInstallmentDetail();
          },
          child: _actionButtons(installmentApplication))),
    ]);
  }

  Widget _actionButtons(InstallmentApplication userApplication) {
    final activeButton = userApplication.status == null
        ? const LabelText('Pending', bgColor: Colors.grey)
        : userApplication.status == true
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
