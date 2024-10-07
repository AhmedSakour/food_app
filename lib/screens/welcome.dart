import 'package:flutter/material.dart';

import '../widgets/custom_buttom.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/logoFood.png',
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Text(
                    'Welcome ',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Order food form our restaueant and ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Make reservation in real- time ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Custombottom(
                    name: 'login',
                    color: Colors.green,
                    onpressed: () {
                      Navigator.pushNamed(context, 'LogeIn');
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Custombottom(
                      name: 'Register',
                      color: Colors.green,
                      onpressed: () {
                        Navigator.pushNamed(context, 'Register');
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
