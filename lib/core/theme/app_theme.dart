import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'input_decoration_theme.dart';
import 'elevated_button_theme.dart';
import 'snack_bar_theme.dart'; 

class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.dark,
    snackBarTheme: snackBarTheme, 
    inputDecorationTheme: inputDecorationTheme,
    elevatedButtonTheme: elevatedButtonTheme,
  );
}