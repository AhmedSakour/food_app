import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/constant/colors.dart';
import 'package:food_app/provider/provider.dart';
import 'package:food_app/widgets/textfields.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/showSnack.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formkey = GlobalKey<FormState>();

  String? email;
  bool isloading = false;
  String? password;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login ',
                    style: TextStyle(
                        color: kprimeColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 140,
                  ),
                  Column(
                    children: [
                      CustomField(
                        text: '  email',
                        icon: Icon(Icons.verified_user_sharp),
                        onchanged: (data) {
                          email = data.trim();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomField(
                        text: 'password',
                        icon: Icon(Icons.password),
                        onchanged: (data) {
                          password = data.trim();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Column(
                    children: [
                      Center(
                          child: Custombottom(
                        name: 'login',
                        color: kprimeColor,
                        onpressed: () async {
                          if (formkey.currentState!.validate()) {
                            isloading = true;
                            setState(() {});
                            await loginUser(email: email!, password: password!);

                            isloading = false;
                            setState(() {});
                          }
                        },
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New user?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'Register');
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      color: kprimeColor, fontSize: 20),
                                ))
                          ]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      String id = credential.user!.uid;
      var userData = await Provider.of<MyProvider>(context, listen: false)
          .getUserData(id: id);

      await storeUserInfo(
          userData.email, userData.password, userData.name, userData.id);

      await saveAuthUser();
      Navigator.pushReplacementNamed(context, 'Home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
      showSnackBar(context, 'error');
    }
  }

  Future<void> storeUserInfo(
      String email, String password, String name, String id) async {
    var user = Hive.box<String>('user');
    await user.put('id', id);
    await user.put('email', email);
    await user.put('password', password);
    await user.put('name', name);
  }

  saveAuthUser() async {
    var box = Hive.box<bool>('auth');

    await box.put('isAuth', true);
  }
}
