import 'package:flutter/material.dart';

Widget drawerItem(
    {required String name, required IconData icon, required Function() ontap}) {
  return ListTile(
    onTap: ontap,
    leading: Icon(
      icon,
      color: Colors.black,
    ),
    title: Text(
      name,
      style: TextStyle(fontSize: 20, color: Colors.green),
    ),
  );
}
