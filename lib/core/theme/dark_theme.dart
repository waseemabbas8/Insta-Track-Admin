import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/colors.dart';
import '../values/dimens.dart';
import '../values/styles.dart';

final ThemeData _base = ThemeData.dark();

ThemeData get darkTheme {
  return _base.copyWith(
    backgroundColor: AppColors.scaffoldBackground,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    textTheme: _textTheme,
    cardTheme: _cardTheme,
    canvasColor: AppColors.canvas,
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primaryDark,
    primaryColorLight: AppColors.primaryLight,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),
    cardColor: AppColors.cardBackground,
    inputDecorationTheme: _inputDecorationTheme,
    elevatedButtonTheme: _elevatedButtonTheme
  );
}

TextTheme get _textTheme => GoogleFonts.poppinsTextTheme().copyWith(
  titleLarge: const TextStyle(fontWeight: FontWeight.w500),
  titleSmall: const TextStyle(fontWeight: FontWeight.w500),
  bodySmall: const TextStyle(fontWeight: FontWeight.normal),
).apply(bodyColor: Colors.white);

CardTheme get _cardTheme => CardTheme(
      color: AppColors.cardBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadii.cardRadius,
      ),
    );

InputDecorationTheme get _inputDecorationTheme => const InputDecorationTheme(
  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  border: OutlineInputBorder(),
);

ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
  style: ButtonStyles.elevatedButtonStyle,
);