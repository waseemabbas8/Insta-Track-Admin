import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/colors.dart';
import '../values/dimens.dart';

final ThemeData _base = ThemeData.dark();

ThemeData get darkTheme {
  return _base.copyWith(
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    textTheme: _textTheme,
    cardTheme: _cardTheme,
    canvasColor: AppColors.secondary,
  );
}

final _textTheme = GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.white);

CardTheme get _cardTheme => CardTheme(
      elevation: 0,
      color: AppColors.cardBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadii.cardRadius,
      ),
    );
