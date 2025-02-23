import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:reactive_button/reactive_button.dart';

Widget authButton({required String title, Future<void> Function()? onPressed,Function()? onSuccess, Function(dynamic)? onFailure}) {
  return ReactiveButton(
    title: title,
    activeColor: AppColors.primary,
    onPressed:  onPressed ?? () async => {},
    onSuccess: onSuccess ?? (){},
    onFailure: onFailure ?? (error){},
  );
}
