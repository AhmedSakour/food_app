import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/screens/homePage.dart';
import 'package:food_app/screens/welcome.dart';
import 'package:hive_flutter/adapters.dart';

class CheackAuth extends StatefulWidget {
  const CheackAuth({super.key});

  @override
  State<CheackAuth> createState() => _CheackAuthState();
}

class _CheackAuthState extends State<CheackAuth> {
  bool isAuth = false;
  getStateAuth() async {
    var box = Hive.box<bool>('auth');
    isAuth = await box.get('isAuth') ?? false;
    setState(() {});
    return isAuth;
  }

  @override
  void initState() {
    getStateAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? HomePage() : WelcomePage();
  }
}
