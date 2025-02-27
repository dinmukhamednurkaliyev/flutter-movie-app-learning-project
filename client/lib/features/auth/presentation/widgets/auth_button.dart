import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:reactive_button/reactive_button.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final Future<void> Function()? onPressed;
  final Function()? onSuccess;
  final Function(dynamic)? onFailure;

  const AuthButton({
    super.key,
    required this.title,
    this.onPressed,
    this.onSuccess,
    this.onFailure,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveButton(
      title: title,
      activeColor: AppColors.primary,
      onPressed: onPressed ?? () async => {},
      onSuccess: onSuccess ?? () {},
      onFailure: onFailure ?? (error) {},
    );
  }
}