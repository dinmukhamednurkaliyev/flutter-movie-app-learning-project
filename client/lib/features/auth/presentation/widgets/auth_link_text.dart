import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/navigation/app_navigation.dart';

class AuthLinkText extends StatelessWidget {
  final String prefixText;
  final String linkText;
  final Widget pageRoute;

  const AuthLinkText(BuildContext context, {
    super.key,
    required this.prefixText,
    required this.linkText,
    required this.pageRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: prefixText,
          ),
          TextSpan(
            text: linkText,
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, pageRoute);
              },
          ),
        ],
      ),
    );
  }
}