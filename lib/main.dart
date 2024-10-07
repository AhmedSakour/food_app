import 'package:flutter/material.dart';
import 'package:food_app/firebase_options.dart';
import 'package:food_app/provider/provider.dart';
import 'package:food_app/screens/cartPage.dart';
import 'package:food_app/screens/cheak_auth.dart';
import 'package:food_app/screens/homePage.dart';
import 'package:food_app/screens/login.dart';
import 'package:food_app/screens/sign_up.dart';
import 'package:food_app/screens/update_password.dart';
import 'package:food_app/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('user');
  await Hive.openBox<bool>('auth');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MyProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'LogeIn': (context) => LoginPage(),
          'Register': (context) => SignPage(),
          'welcome': (context) => WelcomePage(),
          'Home': (context) => HomePage(),
          'password': (context) => UpdatePassword(),
          'cart': (context) => CartPage(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CheackAuth(),
      ),
    );
  }
}
