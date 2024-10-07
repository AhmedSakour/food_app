import 'package:flutter/material.dart';
import 'package:food_app/widgets/custom_buttom.dart';
import 'package:food_app/widgets/custom_result_dialog.dart';
import 'package:food_app/widgets/textfields.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class UpdatePassword extends StatelessWidget {
  UpdatePassword({
    super.key,
  });
  var formkey = GlobalKey<FormState>();
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formkey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Update your password',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  CustomField(
                    text: 'enter new password',
                    onchanged: (value) {
                      password = value.trim();
                    },
                    icon: Icon(Icons.password),
                  ),
                  Custombottom(
                    onpressed: () async {
                      if (formkey.currentState!.validate()) {}
                      try {
                        await Provider.of<MyProvider>(context, listen: false)
                            .updatePassword(
                          password ?? '',
                        );
                        showResultDialog(
                          context,
                          'Success',
                          'The operation was completed successfully.',
                          onpressed: () {
                            Navigator.pushNamed(context, 'Home');
                          },
                        );
                      } on Exception {
                        showResultDialog(
                          context,
                          'Failure',
                          'The operation has failed. Please try again.',
                          onpressed: () {
                            Navigator.pop(context);
                          },
                        );
                      }
                    },
                    width: 150,
                    height: 50,
                    name: 'submit',
                    color: Colors.blue,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
