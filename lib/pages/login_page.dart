import 'package:fitness_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      // child: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            "assets/images/login_image.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
            //child: Text("fhfjsfd"),
          ),
          Text(
            "Welcome !",
            style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Text(
            "Shreyansh Singh Gautam",
            style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "shreyansh123",
                    hintStyle: TextStyle(color: Colors.black26),
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: " 123456",
                    hintStyle: TextStyle(color: Colors.black26),
                    labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: Text("Login"),
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        shadowColor: Colors.brown,
                        minimumSize: Size(150, 50),
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 5)
                        // elevation:1    //defalut is 1
                        )),
              ],
            ),
          )
        ],
      ),
      //),
    );
  }
}
