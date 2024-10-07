import 'package:flutter/material.dart';
import 'package:food_app/constant/colors.dart';
import 'package:food_app/screens/homePage.dart';

import '../models/foodCategories.dart';
import '../widgets/custom_container.dart';
import 'DetailPage.dart';

class Categories extends StatelessWidget {
  List<FoodCategories> list = [];
  Categories({required this.list});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 238, 238),
      appBar: AppBar(
        backgroundColor: kprimeColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (contet) => HomePage()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
            shrinkWrap: false,
            primary: false,
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: list
                .map(
                  (e) => CustomContainer(
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                                image: e.image, name: e.name, price: e.price),
                          ));
                    },
                    image: e.image,
                    price: e.price,
                    name: e.name,
                  ),
                )
                .toList()),
      ),
    );
  }
}
