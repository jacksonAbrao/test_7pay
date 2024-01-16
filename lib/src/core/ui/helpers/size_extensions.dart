import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenMinWidth => MediaQuery.of(this).size.shortestSide;
  double get screenMaxWidth => MediaQuery.of(this).size.longestSide;

  double percentWidth(double percent) => screenWidth * percent / 100;
  double percentHeight(double percent) => screenHeight * percent / 100;
}
