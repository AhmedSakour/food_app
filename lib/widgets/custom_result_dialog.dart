import 'package:flutter/material.dart';

void showResultDialog(BuildContext context, String title, String content,
    {Function()? onpressed}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: onpressed,
          ),
        ],
      );
    },
  );
}
