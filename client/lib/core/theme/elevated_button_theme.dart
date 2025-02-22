import 'package:flutter/material.dart';
import 'app_colors.dart'; // Убедитесь, что импортируете AppColors, если нужно

ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    elevation: 0,
    textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100)
    )
  )
);