import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'input_decoration_theme.dart'; 
import 'elevated_button_theme.dart';
class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.dark,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.background,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: inputDecorationTheme, 
    elevatedButtonTheme: elevatedButtonTheme, 
  );
}