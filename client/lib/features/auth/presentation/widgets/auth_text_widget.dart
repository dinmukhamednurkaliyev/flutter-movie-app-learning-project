import 'package:flutter/material.dart';

class AuthTitleTextWidget extends StatelessWidget {
  final String text;

  const AuthTitleTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}