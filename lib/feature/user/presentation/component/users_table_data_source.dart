import 'package:flutter/material.dart';

import '../../../../core/values/dimens.dart';
import '../../domain/model/app_user.dart';

class UsersTableSource extends DataTableSource {
  final List<AppUser> users;

  UsersTableSource({required this.users});

  @override
  DataRow? getRow(int index) {
    final user = users[index];
    return DataRow(cells: [
      DataCell(
          Row(
            children: [
              //TODO: replace with network image
              Image.asset(
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
      DataCell(user.isActive ? const Icon(Icons.check_circle, color: Colors.green,) : const Icon(Icons.not_interested, color: Colors.red,)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;

}