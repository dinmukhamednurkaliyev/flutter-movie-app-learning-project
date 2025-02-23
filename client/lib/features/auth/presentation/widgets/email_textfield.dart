import 'package:flutter/material.dart';

Widget emailTextField({required TextEditingController controller}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(hintText: 'Email'),
  );
}
