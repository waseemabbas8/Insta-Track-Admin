import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import '../../../../core/values/dimens.dart';
import '../../domain/model/user_application.dart';
import 'applications_table_data_source.dart';

class ApplicationsTable extends StatelessWidget {
  final List<UserApplication> userApplications;

  const ApplicationsTable({
    Key? key,
    required this.userApplications,
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
            source:
                ApplicationsTableSource(usersApplications: userApplications),
            columns: const [
              DataColumn(
                label: Text("Name"),
              ),
              DataColumn(
                label: Text("Phone"),
              ),
              DataColumn(
                label: Text("Product"),
              ),
              DataColumn(
                label: Text("Advance Amount"),
              ),
              DataColumn(
                label: Text("Installments"),
              ),
              DataColumn(
                label: Text("Created"),
              ),
              DataColumn(
                label: Text("Status"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
