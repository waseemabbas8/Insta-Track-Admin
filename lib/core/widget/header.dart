import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/dimens.dart';
import 'profile_tile.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Dashboard', style: Get.textTheme.titleLarge),
            Expanded(
              flex: 3,
              child: Container(),
            ),
            Spacing.h20,
            Expanded(
              flex: 1,
              child: ProfileTile(onPressedNotification: () {}),
            ),
          ],
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}
