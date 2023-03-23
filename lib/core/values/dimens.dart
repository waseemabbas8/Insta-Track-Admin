import 'package:flutter/material.dart';

///white bland space e.g. [SizeBox] widgets
class Spacing {
  Spacing._();

  static const h10 = SizedBox(width: 10);
  static const h20 = SizedBox(width: 20);
  static const v10 = SizedBox(height: 10);
  static const v12 = SizedBox(height: 12);
  static const v20 = SizedBox(height: 20);
  static const v40 = SizedBox(height: 50);
  static const v50 = SizedBox(height: 50);
}

///Margin or padding
class Margin {
  Margin._();

  static const all8 = EdgeInsets.all(9.0);
  static const all10 = EdgeInsets.all(10.0);
  static const all20 = EdgeInsets.all(20.0);
  static const h20 = EdgeInsets.all(20.0);
  static const h20v10 = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
}

///Radii
class BorderRadii {
  static final button = BorderRadius.circular(5);
  static final cardRadius = BorderRadius.circular(15);
  static final c = BorderRadius.circular(20);
}