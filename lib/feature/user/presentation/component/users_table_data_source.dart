import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/dimens.dart';
import '../../../../core/widget/button_widget.dart';
import '../../domain/model/app_user.dart';
import '../users_controller.dart';

class UsersTableSource extends DataTableSource {
  final List<AppUser> users;

  UsersTableSource({required this.users});

  final UsersController usersController = Get.find();

  @override
  DataRow? getRow(int index) {
    final user = users[index];
    return DataRow(cells: [
      DataCell(
        Row(
          children: [
            Image.network(
              user.image,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: Margin.h16,
              child: Text(user.name),
            ),
          ],
        ),
      ),
      DataCell(Text(user.nic)),
      DataCell(Text(user.phone)),
      DataCell(Text(user.city)),
      DataCell(Text(user.createdAt)),
      DataCell(_actionButtons(user)),
    ]);
  }

  Widget _actionButtons(AppUser user) {
    final activeButton = user.isActive
        ? LoadingViewButton(
            text: 'InActive',
            color: Colors.red,
            size: ButtonSize.small,
            isLoading: false,
            onPressed: () => usersController.onUserActivation(user),
          )
        : LoadingViewButton(
            text: 'Activate',
            color: Colors.green,
            size: ButtonSize.small,
            isLoading: false,
            onPressed: () => usersController.onUserActivation(user),
          );
    return Row(
      children: [
        activeButton,
        Spacing.h4,
        CustomFilledButton(
          text: 'View',
          size: ButtonSize.small,
          onPressed: () => usersController.onViewUser(user),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
