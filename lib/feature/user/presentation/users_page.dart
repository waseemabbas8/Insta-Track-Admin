import 'package:flutter/material.dart';
import 'package:intatrack/feature/user/presentation/component/UsersTable.dart';

import '../../../core/base_page.dart';
import '../../../core/values/dimens.dart';
import '../../../core/widget/header.dart';
import 'users_controller.dart';

class UsersPage extends BasePage<UsersController> {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(title: 'Manage Users'),
          Spacing.v20,
          Expanded(child: UsersTable()),
        ],
      ),
    );
  }
}