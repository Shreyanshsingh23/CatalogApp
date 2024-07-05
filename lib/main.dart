import 'package:flutter/material.dart';

import 'package:fitness_app/pages/home_page.dart'; //importing home page

void main() {
  runApp(MyApp()); //
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //build method bht important hai hamare liye kyuki UI se related saare kaam yahi hote hain
    //mtlb issi ko call karke UI refresh hota hai

    return MaterialApp(
      debugShowCheckedModeBanner: false,  
        home: HomePage(),

        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          brightness:   Brightness.dark,     
        
      
         
        primarySwatch: Colors.purple),
        theme: ThemeData(
          primaryColor: Colors.pink
         ),
        );

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //     home: Scaffold(
    //       appBar: AppBar(
    //         backgroundColor: Colors.blue,
    //       ),
    //     ),
      
    // );
  }
}
