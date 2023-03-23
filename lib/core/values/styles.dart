import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';

///[Text] styles
class TextStyles {
  TextStyles._();

  static const baseTexStyle = TextStyle(color: AppColors.primary);
}

///[Button] styles
class ButtonStyles {
  ButtonStyles._();

  static ButtonStyle get elevatedButtonStyle => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadii.button,
        ),
        backgroundColor: AppColors.primary,
      );

  static ButtonStyle get outlinedButton => OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary, width: 1.5),
      );
}
