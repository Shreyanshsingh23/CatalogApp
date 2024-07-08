import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:fitness_app/pages/login_page.dart';

class MyDrawer extends StatelessWidget {
  String img_Src1 =
      "https://instagram.fbho1-2.fna.fbcdn.net/v/t51.2885-19/375778970_652156046686343_4182262623376757689_n.jpg?_nc_ht=instagram.fbho1-2.fna.fbcdn.net&_nc_cat=111&_nc_ohc=ZoqFgk1fs_8Q7kNvgHgg6pv&edm=AFg4Q8wBAAAA&ccb=7-5&oh=00_AYAqsJNy9tRcw9T5UJVPxEi4MqeknVU1VhbRPyJFFhUrcw&oe=6691B85B&_nc_sid=0b30b7";

  String img_Src =
      "https://media.licdn.com/dms/image/D4D03AQF2p91OhesdAA/profile-displayphoto-shrink_400_400/0/1718334034324?e=1726099200&v=beta&t=fbObQReGm70MBEh8LuFOnHKw6pdpbZfIdCM6lhLZIIw";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          shrinkWrap: true,
          dragStartBehavior: DragStartBehavior.start,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                   accountName: Text("Shreyansh",textScaleFactor: 1.2,),
                  // Text(LoginPageState
                  // .name),
                  accountEmail: Text("shreyanshrewa@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(img_Src),
                  ),
                  otherAccountsPictures: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(img_Src1),
                    )
                  ],
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaler: TextScaler.linear(1.3),
              ),
              textColor: Colors.white,
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaler: TextScaler.linear(1.3),
              ),
              textColor: Colors.white,
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail_solid,
                color: Colors.white,
              ),
              title: Text(
                "Contact Us",
                textScaler: TextScaler.linear(1.3),
              ),
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}