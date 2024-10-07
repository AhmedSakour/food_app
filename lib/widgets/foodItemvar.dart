import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../constant/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget foodItemVar(
    {required VoidCallback ontap,
    required String name,
    required var price,
    required String image}) {
  return Container(
    width: 150,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: GestureDetector(
        onTap: ontap,
        child: Column(
          children: [
            CachedNetworkImage(
              height: 90,
              width: 100,
              imageUrl: image,
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error)),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  width: 30,
                ),
                Text('$price \$',
                    style: TextStyle(
                      color: kprimeColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RatingBar.builder(
              initialRating: 3,
              itemSize: 20,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, index) {
                return Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
              onRatingUpdate: (value) {},
            )
          ],
        ),
      ),
    ),
  );
}
