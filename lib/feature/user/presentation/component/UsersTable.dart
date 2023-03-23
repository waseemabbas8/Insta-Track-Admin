import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/values/dimens.dart';
import '../../domain/model/app_user.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: Margin.all10,
        child: SizedBox(
          width: double.infinity,
          child: DataTable2(
            columnSpacing: 16,
            minWidth: 600,
            columns: [
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
            ],
            rows: List.generate(
              _demoUsers.length,
              (index) => userDataRow(_demoUsers[index]),
            ),
          ),
        ),
      ),
    );
  }
}

DataRow userDataRow(AppUser user) {
  return DataRow(
    cells: [
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
      DataCell(Text('${user.address}, ${user.city}')),
      DataCell(Text(user.createdAt)),
    ],
  );
}

//TODO: remove dummy data
final _demoUsers = [
  AppUser(
    id: 'id',
    name: 'Waseem Abbas',
    email: 'waseemabbas@gmail.com',
    nic: '3540321711105',
    image: '${ImagePath.base}avatar-1.png',
    phone: '0302188898',
    city: 'Sangla Hill',
    address: 'Gulberg',
    createdAt: '23-11-2022',
  ),
  AppUser(
    id: 'id2',
    name: 'Mubashar Husain',
    email: 'mubashar@gmail.com',
    nic: '3540321711565',
    image: '${ImagePath.base}avatar-1.png',
    phone: '0302188376',
    city: 'Sangla Hill',
    address: 'Gulberg',
    createdAt: '23-11-2022',
  ),
];
