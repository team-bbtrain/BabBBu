import 'colors.dart';
import 'fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final _inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.background200,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColors.text300,
        width: 1,
      ),
    ),
    hintStyle: AppTextStyles.body2NormalLight.copyWith(
      color: AppColors.text50,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    // colorScheme: AppColors.lightColorScheme,
    textTheme: AppTextStyles.textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    extensions: [],
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    // colorScheme: AppColors.darkColorScheme,
    textTheme: AppTextStyles.textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    extensions: [],
  );
}
