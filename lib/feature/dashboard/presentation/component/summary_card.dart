import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/dimens.dart';

class SummaryCarUiModel {
  final IconData iconData;
  final String title;
  final int count;
  final Color color;

  SummaryCarUiModel({
    required this.iconData,
    required this.title,
    required this.count,
    required this.color,
  });
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    Key? key,
    required this.uiModel,
  }) : super(key: key);

  final SummaryCarUiModel uiModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: Margin.all16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(16 * 0.75),
                  decoration: BoxDecoration(
                    color: uiModel.color.withOpacity(0.1),
                    borderRadius: BorderRadii.all10,
                  ),
                  child: Icon(
                    uiModel.iconData,
                    color: uiModel.color,
                    size: 24,
                  ),
                ),
                Text('${uiModel.count}', style: Get.textTheme.titleLarge),
              ],
            ),
            Text(
              uiModel.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Get.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

// class ProgressLine extends StatelessWidget {
//   const ProgressLine({
//     Key? key,
//     this.color = primaryColor,
//     required this.percentage,
//   }) : super(key: key);
//
//   final Color? color;
//   final int? percentage;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: 5,
//           decoration: BoxDecoration(
//             color: color!.withOpacity(0.1),
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//           ),
//         ),
//         LayoutBuilder(
//           builder: (context, constraints) => Container(
//             width: constraints.maxWidth * (percentage! / 100),
//             height: 5,
//             decoration: BoxDecoration(
//               color: color,
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
