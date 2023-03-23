import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/dimens.dart';
import 'profile_tile.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Get.textTheme.titleLarge),
            Spacing.h20,
            SizedBox(
              width: 250,
              child: ProfileTile(onPressedNotification: () {}),
            ),
          ],
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}
