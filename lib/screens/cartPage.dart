import 'package:flutter/material.dart';
import 'package:food_app/models/cart.dart';
import 'package:food_app/provider/provider.dart';
import 'package:food_app/widgets/custom_confirm_dialog.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_item.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool numberState = false;
  List<CartModel> carts = [];
  double total = 0;
  getCart() async {
    carts = await Provider.of<MyProvider>(context, listen: false).getCart();
    total = await Provider.of<MyProvider>(context, listen: false)
        .calculateTotalCartPrice();

    setState(() {});
  }

  bool wait = true;
  delay() async {
    await Future.delayed(Duration(seconds: 3), () {
      wait = false;
      setState(() {});
    });
  }

  @override
  void initState() {
    delay();
    getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 237, 237),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 244, 237, 237),
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: wait
            ? Center(
                child: CircularProgressIndicator(),
              )
            : carts.isEmpty
                ? Center(
                    child: Text(
                      'Your cart is empty',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : Stack(alignment: AlignmentDirectional.bottomEnd, children: [
                    Container(
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return CartItem(
                              ONtap: () async {
                                showConfirmationDialog(
                                  context,
                                  title: 'Delete item from cart',
                                  content: 'Are you sure?',
                                  onPressed: () async {
                                    try {
                                      await Provider.of<MyProvider>(context,
                                              listen: false)
                                          .deleteItemCart(
                                        carts[index].id!,
                                      );

                                      carts = await Provider.of<MyProvider>(
                                              context,
                                              listen: false)
                                          .getCart();

                                      setState(() {});
                                      Navigator.pop(context);
                                    } on Exception {}
                                  },
                                );
                              },
                              cartModel: carts[index],
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: carts.length),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 65,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 146, 145, 145),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' total',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Text(
                            "$total\$",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ]));
  }
}
