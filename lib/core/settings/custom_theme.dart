import 'package:flutter/material.dart';

class CustomTheme {
  static const Color primary = Colors.white;
  static const Color pink = Color(0xffFF9AB2);
  static const Color orange = Color(0xffFFC2C6);
  static const Color orange2 = Color(0xffFF9500);
  static const Color purple = Color(0xff9F9DF3);
  static const Color black = Color(0xff26273C);
  static const Color green = Color(0xff47A348);
  static const Color grey = Color(0xff9395A4);

  static ThemeData themeData = ThemeData(
    useMaterial3: false,
    canvasColor: primary,
    primaryColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: primary,
    ),
  );
}
