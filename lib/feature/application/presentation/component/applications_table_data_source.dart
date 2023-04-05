import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intatrack/feature/application/presentation/applications_controller.dart';
import '../../../../core/values/dimens.dart';
import '../../../../core/widget/button_widget.dart';
import '../../domain/model/user_application.dart';

class ApplicationsTableSource extends DataTableSource {
  final List<UserApplication> usersApplications;

  ApplicationsTableSource({required this.usersApplications});

  final ApplicationsController applicationsController = Get.find();

  @override
  DataRow? getRow(int index) {
    final userApplication = usersApplications[index];
    return DataRow(cells: [
      DataCell(Text(userApplication.name)),
      DataCell(Text(userApplication.phone)),
      DataCell(Text(userApplication.product)),
      DataCell(Text(userApplication.advanceAmount)),
      DataCell(Text('${userApplication.installments}')),
      DataCell(Text(userApplication.createdAt)),
      DataCell(_actionButtons(userApplication)),
    ]);
  }

  Widget _actionButtons(UserApplication userApplication) {
    final activeButton = userApplication.status == null
        ? LoadingViewButton(
            text: 'Pending',
            color: Colors.grey,
            size: ButtonSize.small,
            isLoading: false,
            onPressed: () {},
          )
        : userApplication.status == true
            ? LoadingViewButton(
                text: 'Approved',
                color: Colors.green,
                size: ButtonSize.small,
                isLoading: false,
                onPressed: () {},
              )
            : LoadingViewButton(
                text: 'Rejected',
                color: Colors.red,
                size: ButtonSize.small,
                isLoading: false,
                onPressed: () {},
              );
    return activeButton;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => usersApplications.length;

  @override
  int get selectedRowCount => 0;
}
