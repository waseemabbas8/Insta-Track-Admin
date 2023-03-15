import 'package:flutter/material.dart';

///white bland space e.g. [SizeBox] widgets
class Spacing {
  Spacing._();

  static const v10 = SizedBox(height: 10);
  static const v12 = SizedBox(height: 12);
  static const v20 = SizedBox(height: 20);
  static const v50 = SizedBox(height: 50);
}

///Margin or padding
class Margin {
  Margin._();

  static const all8 = EdgeInsets.all(9.0);
  static const all20 = EdgeInsets.all(20.0);
  static const h20 = EdgeInsets.all(20.0);
}

///Radii
class BorderRadii {
  static final cardRadius = BorderRadius.circular(10);
}