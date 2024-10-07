import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget FoodItemHor(
    {required VoidCallback ontap, required String name, required String m}) {
  return GestureDetector(
    onTap: ontap,
    child: Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: CachedNetworkImage(
                imageUrl: m,
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Text(name,
            style: TextStyle(
              color: Colors.green,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ))
      ],
    ),
  );
}
