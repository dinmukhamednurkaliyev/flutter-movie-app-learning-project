import 'package:flutter/material.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;

  const PasswordTextFieldWidget({
    super.key,
    required this.controller,
    this.hintText,
    this.obscureText = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText ?? 'Password',
      ),
    );
  }
}