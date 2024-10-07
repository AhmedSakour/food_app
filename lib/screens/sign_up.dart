import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../provider/provider.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/showSnack.dart';
import '../widgets/textfields.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignPage extends StatefulWidget {
  SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  String? email, password, name;
  var fromkey = GlobalKey<FormState>();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Form(
        key: fromkey,
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
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 140,
                  ),
                  Column(
                    children: [
                      CustomField(
                          text: 'name',
                          icon: Icon(Icons.person),
                          onchanged: (data) {
                            name = data.trim();
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      CustomField(
                          text: 'email',
                          icon: Icon(Icons.email),
                          onchanged: (data) {
                            email = data.trim();
                          }),
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
                    height: 60,
                  ),
                  Column(
                    children: [
                      Center(
                          child: Custombottom(
                        name: 'Sign',
                        color: Colors.orange,
                        onpressed: () async {
                          if (fromkey.currentState!.validate()) {
                            isloading = true;
                            setState(() {});
                            await registerUser(
                                email: email!,
                                password: password!,
                                name: name!);
                            isloading = false;
                            setState(() {});
                          }
                        },
                      )),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'You have already account?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'LogeIn');
                          },
                          child: Text(
                            'Login In',
                            style:
                                TextStyle(color: Colors.orange, fontSize: 20),
                          )),
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

  Future<void> registerUser(
      {required String email,
      required String password,
      required String name}) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String id = credential.user!.uid;
      print(id);
      await storeUserInfo(email, password, name, id);
      await saveAuthUser();

      await Provider.of<MyProvider>(context, listen: false).addUser(
          id: id,
          user: UserData(id: id, name: name, password: password, email: email));
      Navigator.pushReplacementNamed(
        context,
        'Home',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'weak password');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'email exists');
      }
    } catch (e) {
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
