import 'package:flutter/material.dart';

import '../values/colors.dart';

class LabelText extends StatelessWidget {
  const LabelText(this.text, {Key? key, this.textStyle}) : super(key: key);

  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.ntfColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
      child: Text(
        text,
        style: textStyle ?? const TextStyle(fontSize: 9, color: Colors.white),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}