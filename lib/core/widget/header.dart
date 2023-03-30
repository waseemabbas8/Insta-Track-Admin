import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/dimens.dart';
import 'profile_tile.dart';

class Header extends StatelessWidget {
  final String title;
  final bool hasBackNav;
  final VoidCallback? onBackPressed;

  const Header({Key? key, this.onBackPressed, this.hasBackNav = false, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                hasBackNav
                    ? IconButton(
                        onPressed: onBackPressed,
                        icon: const Icon(Icons.arrow_back, color: Colors.white))
                    : Container(),
                hasBackNav ? Spacing.h10 : Container(),
                Text(title, style: Get.textTheme.titleLarge),
              ],
            ),
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
