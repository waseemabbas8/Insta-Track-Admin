import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../core/values/dimens.dart';
import '../../domain/model/app_user.dart';
import 'users_table_data_source.dart';

class UsersTable extends StatelessWidget {
  final List<AppUser> users;
  const UsersTable({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: Margin.all10,
        child: SizedBox(
          width: double.infinity,
          child: PaginatedDataTable2(
            columnSpacing: 16,
            minWidth: 600,
            source: UsersTableSource(users: users),
            columns: const [
              DataColumn(
                label: Text("Name"),
              ),
              DataColumn(
                label: Text("CNIC"),
              ),
              DataColumn(
                label: Text("Phone"),
              ),
              DataColumn(
                label: Text("Address"),
              ),
              DataColumn(
                label: Text("Created"),
              ),
              DataColumn(
                label: Text("isActive"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
