import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/navigation/app_navigation.dart';

Widget authLinkText(
  BuildContext context,
  String text,
  String linkText,
  Widget widget,
) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(text: text),
        TextSpan(
          text: linkText,
          style: TextStyle(color: Colors.blue),
          recognizer:
              TapGestureRecognizer()
                ..onTap = () {
                  AppNavigator.push(context, widget);
                },
        ),
      ],
    ),
  );
}
