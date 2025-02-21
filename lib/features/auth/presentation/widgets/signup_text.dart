import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/navigation/app_navigation.dart';
import 'package:movie_app/features/auth/presentation/pages/signup_page.dart';

Widget signUpText(BuildContext context) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: 'Don\'t have an account? ',
        ),
        TextSpan(
          text: 'Sign Up',
          style: TextStyle(
            color: Colors.blue,
          ),
          recognizer: TapGestureRecognizer()..onTap = () {
            AppNavigator.push(context, SignUpPage());
          }
        )
      ]
    )
  );
}