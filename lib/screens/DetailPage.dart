import 'package:flutter/material.dart';
import 'package:food_app/constant/colors.dart';
import 'package:food_app/models/cart.dart';
import 'package:food_app/screens/homePage.dart';
import 'package:food_app/widgets/custom_result_dialog.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import '../provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../widgets/showSnack.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final int price;
  final String name;

  DetailPage({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int x = 1;
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 238, 238),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 241, 238, 238),
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: kprimeColor,
            ),
          )),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CachedNetworkImage(
                imageUrl: widget.image,
                height: 200,
                errorWidget: (context, url, error) => Center(
                  child: Icon(Icons.error),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 241, 238, 238)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(color: kprimeColor, fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              x++;
                            });
                          },
                          child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '$x',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (x != 1) {
                                x--;
                              }
                            });
                          },
                          child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Icon(Icons.remove)),
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        Text(
                          ' ${(widget.price * x)}\$',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: kprimeColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(color: kprimeColor, fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () async {
                        CartModel cartModel = CartModel(
                          id: randomAlphaNumeric(10),
                          totalPrice: '${widget.price * x}',
                          image: widget.image,
                          name: widget.name,
                          price: widget.price,
                          quantity: x,
                        );
                        try {
                          await provider.addToCart(
                            cartModel,
                          );
                          showResultDialog(context, onpressed: () {
                            Navigator.pop(context);
                          }, 'Success', 'The item was successfully added.');
                        } on Exception catch (e) {
                          showSnackBar(context, e.toString());
                        }
                      },
                      child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            color: kprimeColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'ADD',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
