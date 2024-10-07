import 'package:flutter/material.dart';

Widget Custombottom({
  required String? name,
  VoidCallback? onpressed,
  double width = 300,
  double height = 40,
  Color? color,
}) {
  return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
          onPressed: onpressed,
          child: Text(
            name!,
            style: TextStyle(color: Colors.white),
          )));
}
