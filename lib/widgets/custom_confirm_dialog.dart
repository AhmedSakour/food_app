import 'package:flutter/material.dart';

Future<void> showConfirmationDialog(BuildContext context,
    {Function()? onPressed,
    required String title,
    required String content}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: onPressed,
          ),
        ],
      );
    },
  );
}
