import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/colors.dart';
import '../values/dimens.dart';

class TitleCard extends StatelessWidget {
  final String title;
  final Widget child;

  const TitleCard({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Spacing.v12,
            child,
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: Margin.all8,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.scaffoldBackground,
              borderRadius: BorderRadii.cardRadius,
            ),
            child: Text(
              title,
              style: Get.textTheme.titleMedium!.copyWith(color: AppColors.secondary),
            ),
          ),
        ),
      ],
    );
  }
}
