import 'package:flutter/material.dart';

class EmailTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;

  const EmailTextFieldWidget({super.key, required this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hintText ?? 'Email',
      ),
    );
  }
}