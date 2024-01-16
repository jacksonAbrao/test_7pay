import 'package:flutter/material.dart';

class ThemeConfig {
  ThemeConfig._();

  static final borderDefault = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Colors.grey.shade300,
      width: 1,
    ),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
  );
}
