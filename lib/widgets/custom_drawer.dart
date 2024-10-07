import 'package:flutter/material.dart';
import 'package:food_app/widgets/ListTiles.dart';
import 'package:food_app/widgets/custom_confirm_dialog.dart';
import 'package:hive_flutter/adapters.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String? email, name;
  var user = Hive.box<String>('user');

  @override
  void initState() {
    email = user.get('email');
    name = user.get('name');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 250,
                  ),
                  child: IconButton(
                      onPressed: () {
                        widget.scaffoldKey.currentState?.closeDrawer();
                      },
                      icon: Icon(Icons.close)),
                ),
                UserAccountsDrawerHeader(
                  currentAccountPicture:
                      Image.asset('assets/images/person_logo.png'),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Color(0xFFe64e0e),
                      Color(0xFFfb7200),
                      Color(0xFFff8c00),
                      Color(0xFFf58012),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  accountName: Text('$name'),
                  accountEmail: Text('$email'),
                ),
                SizedBox(
                  height: 30,
                ),
                drawerItem(
                  name: 'Cart',
                  icon: Icons.add_shopping_cart,
                  ontap: () {
                    Navigator.pushNamed(context, 'cart');
                  },
                ),
                drawerItem(
                  icon: Icons.lock,
                  name: "Change password",
                  ontap: () {
                    Navigator.pushNamed(context, 'password');
                  },
                ),
                drawerItem(
                  icon: Icons.exit_to_app,
                  name: "Log Out",
                  ontap: () async {
                    await showConfirmationDialog(
                      context,
                      title: 'Log Out',
                      content: 'Are you sure you want to log out?',
                      onPressed: () async {
                        await user.delete('email');
                        await user.delete('password');
                        await user.delete('name');
                        await Hive.box<bool>('auth').put('isAuth', false);
                        Navigator.pushNamed(context, 'LogeIn');
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
