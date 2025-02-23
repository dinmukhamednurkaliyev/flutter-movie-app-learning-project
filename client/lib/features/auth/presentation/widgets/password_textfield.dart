import 'package:flutter/material.dart';

Widget passwordTextField({required TextEditingController controller}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: 'Password',
    ),
  );
}