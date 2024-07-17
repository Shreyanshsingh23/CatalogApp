// ignore_for_file: prefer_const_constructors

import 'package:fitness_app/pages/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  // this State class extends a Stateful widget, i.e. with the help of this State class only I am able to make instant changes in my UI
  // underscore '_' before variable's or class' name means it is derived as private

  static String name = "";
  bool pressed = false;
  int n = 0;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // if all the conditions of username and password fields will be satisfied then only this will execute
      // if(_formKey.currentStat())
      {
        setState(() {
          pressed = true;
        });

        await Future.delayed(const Duration(seconds: 1));
        // ignore: use_build_context_synchronously
        await Navigator.pushNamed(context, MyRoutes.homeRoute);
        setState(() {
          pressed = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.canvasColor,
      // child: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            "assets/images/hey.png",
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
            //child: Text("fhfjsfd"),
          ),
          Text(
            "Welcome $name !",
            style:  TextStyle(
              
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "shreyansh123",
                      hintStyle: TextStyle(color: Colors.black26),
                      labelText: "Username",
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Username can't be empty";
                      }
                      return null; // i.e. no error
                    },
                    onChanged: (value) {
                      setState(() {
                        name = value;
                        // we are calling build method again to refresh our UI
                        // this works only inside Stateful widget not in Stateless Widget
                      });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: " 123456",
                      hintStyle: TextStyle(color: Colors.black26),
                      labelText: "Password",
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      }

                      if (value.length < 6) {
                        return "Password must contain atleast 6 letters";
                      }
                      return null;
                    },

                    // if(value.length != n){
                    //   setState(() {

                    //   });
                    // }
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  Material(
                    // took material only because splash effect of InkWell needs parent as Material
                    color: Colors.deepPurple,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: InkWell(
                      // justADetector can also be used but there is no UI splash effect and more in it
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: 40,
                        width: pressed ? 40 : 150,
                        alignment: Alignment.center,
                        child: pressed
                            ? const Icon(
                                Icons.done,
                                color: Color.fromARGB(255, 244, 246, 244),
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                      ),
                    ),
                  ),

                  // ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //     },
                  //     child: Text("Login"),
                  //     style: TextButton.styleFrom(
                  //         foregroundColor: Colors.black,
                  //         shadowColor: Colors.brown,
                  //         minimumSize: Size(150, 50),
                  //         padding:
                  //             EdgeInsets.symmetric(vertical: 20, horizontal: 5)
                  //         // elevation:1    //defalut is 1
                  //         )),
                ],
              ),
            ),
          )
        ],
      ),
    );
    //);
  }
}
