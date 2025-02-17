import 'package:flutter/material.dart';

class AppColors {
  static const brand = BrandColors();
  static const surface = SurfaceColors();
  static const text = TextColors();
  static const state = StateColors();
}

class BrandColors {
  const BrandColors();
  static const primary = Color(0xffE21221);
  static const secondary = Color(0xffffffff);
  static const accent = Color(0xffffffff);
}

class SurfaceColors {
  const SurfaceColors();
  static const background = Color(0xff1D1E22);
  static const scaffoldBackground = Color(0xff181A20);
  static const lightBackground = Color(0xffF5F5F5);
}

class TextColors {
  const TextColors();
  static const primary = Color(0xffFFFFFF);
  static const secondary = Color(0xffAAAAAA);
  static const onPrimary = Color(0xffFFFFFF);
}

class StateColors {
  const StateColors();
  static const error = Color(0xffFF4D4D);
  static const success = Color(0xff4CAF50);
  static const warning = Color(0xffFFC107);
  static const info = Color(0xff2196F3);
}

