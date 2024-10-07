import 'package:flutter/material.dart';

Widget CustomField({
  String? text,
  Icon? icon,
  Function(String)? onchanged,
}) {
  return TextFormField(
    onChanged: onchanged,
    validator: (value) {
      if (value!.isEmpty) {
        return 'feild is required';
      }
      return null;
    },
    decoration: InputDecoration(
      hintText: text!,
      prefixIcon: icon,
    ),
  );
}
