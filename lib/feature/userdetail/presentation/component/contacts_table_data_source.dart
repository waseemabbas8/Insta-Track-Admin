import 'package:flutter/material.dart';

import '../../../user/domain/model/contact.dart';

class ContactsTableSource extends DataTableSource {
  final List<Contact> contacts;

  ContactsTableSource({required this.contacts});
  @override
  DataRow? getRow(int index) {
    final record = contacts[index];
    return DataRow(cells: [
      DataCell(Text(record.name)),
      DataCell(Text(record.phone)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => contacts.length;

  @override
  int get selectedRowCount => 0;

}