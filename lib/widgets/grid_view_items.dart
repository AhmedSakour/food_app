import 'package:flutter/material.dart';
import 'package:food_app/widgets/foodItemvar.dart';
import 'package:provider/provider.dart';

import '../models/Foods.dart';
import '../provider/provider.dart';
import '../screens/DetailPage.dart';

class GridViewFoodItems extends StatefulWidget {
  const GridViewFoodItems({super.key});

  @override
  State<GridViewFoodItems> createState() => _GridViewFoodItemsState();
}

class _GridViewFoodItemsState extends State<GridViewFoodItems> {
  List<FoodModel> foodItemList = [];

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getFoods();
    foodItemList = provider.throwListFood;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 510,
      child: GridView.count(
        shrinkWrap: false,
        primary: false,
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: foodItemList
            .map((e) => foodItemVar(
                  image: e.image,
                  name: e.name,
                  price: e.price,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  image: e.image,
                                  price: (e.price),
                                  name: e.name,
                                )));
                  },
                ))
            .toList(),
      ),
    );
  }
}
