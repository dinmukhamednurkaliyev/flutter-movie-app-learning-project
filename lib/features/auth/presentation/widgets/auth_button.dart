import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:reactive_button/reactive_button.dart';

Widget authButton(String title) {
  return ReactiveButton(
    title: title,
    activeColor: AppColors.primary,
    onPressed:  () async {},
    onSuccess: (){},
    onFailure: (error){},
  );
}
