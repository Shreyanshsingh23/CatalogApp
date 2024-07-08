import 'package:fitness_app/pages/login_page.dart';
import 'package:fitness_app/pages/utils/routes.dart';
import 'package:flutter/material.dart';

import 'package:fitness_app/pages/home_page.dart'; //importing home page
import 'package:fitness_app/pages/widgets/themes.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp()); //
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //build method bht important hai hamare liye kyuki UI se related saare kaam yahi hote hain
    //mtlb issi ko call karke UI refresh hota hai

    return MaterialApp(
      debugShowCheckedModeBanner: false,  
       // home: HomePage(),

        themeMode: ThemeMode.dark,
        darkTheme: MyTheme.darkTheme(context),
        theme: MyTheme.lightTheme(context),

       // initialRoute: "/home",
         routes: {
          
          "/":(context) => const HomePage(),
          MyRoutes.homeRoute:(context) => const HomePage(),
          MyRoutes.loginRoute :(context) => const LoginPage()
         },
        );

   
  }
}
