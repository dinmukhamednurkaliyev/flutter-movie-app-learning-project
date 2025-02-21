import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:reactive_button/reactive_button.dart';

Widget signInButton() {
  return ReactiveButton(
    title: 'Sign In',
    activeColor: AppColors.primary,
    onPressed: () async {
      // Call the signIn function
    },
    onSuccess: (){},
    onFailure: (error){},
  );
}
