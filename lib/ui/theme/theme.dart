import 'colors.dart';
import 'fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const _inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      // text100 works for both light and dark themes
      color: AppColors.text100,
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    textTheme: AppTextStyles.textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    extensions: [],
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: AppTextStyles.textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    extensions: [],
  );
}
