import 'package:flutter/material.dart';

import 'package:fitness_app/pages/login_page.dart' as login;

class MyDrawer extends StatelessWidget {
  String a = login.name;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: UserAccountsDrawerHeader(
                  accountName: Text("$login.name"),
                  accountEmail: accountEmail)),
        ],
      ),
    );
  }
}
