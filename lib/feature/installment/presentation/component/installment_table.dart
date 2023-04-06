import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import '../../../../core/values/dimens.dart';
import '../../domain/model/installment_application.dart';
import 'installment_table_data_source.dart';

class InstallmentTable extends StatelessWidget {
  final List<InstallmentApplication> userApplications;

  const InstallmentTable({
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
                InstallmentTableSource(installmentsApplications: userApplications),
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
                label: Text("Price(PKR)"),
              ),
              DataColumn(
                label: Text("Advance"),
              ),
              DataColumn(
                label: Text("ICount"),
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
