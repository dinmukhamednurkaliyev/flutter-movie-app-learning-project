import 'package:flutter/material.dart';

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: const Color(0xff2C2B2B) ,
  hintStyle: const TextStyle(
    color: Color(0xffA7A7A7),
    fontWeight: FontWeight.w400,
  ),
  contentPadding: const EdgeInsets.all(16),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide.none
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide.none
  )
);