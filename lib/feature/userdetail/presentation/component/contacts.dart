import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intatrack/feature/userdetail/presentation/user_detail_controller.dart';

import '../../../../core/values/dimens.dart';
import '../../../user/domain/model/contact.dart';
import 'contacts_table_data_source.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserDetailController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.v20,
          Text(
            'Contacts',
            style: Get.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          Spacing.v20,
          Expanded(
            child: _ContactsTable(contacts: controller.contacts),
          ),
        ],
      ),
    );
  }
}

class _ContactsTable extends StatelessWidget {
  final List<Contact> contacts;
  const _ContactsTable({Key? key, required this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable2(
      columnSpacing: 10,
      source: ContactsTableSource(contacts: contacts),
      columns: const [
        DataColumn(
          label: Text("Name"),
        ),
        DataColumn(
          label: Text("Phone"),
        ),
      ],
    );
  }
}

