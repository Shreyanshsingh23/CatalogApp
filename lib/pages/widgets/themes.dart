import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static bool isDarkTheme = true;
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: false,
      primarySwatch: Colors.deepPurple,
      primaryColor: Colors.deepPurple,
       dialogBackgroundColor:  Colors.white,
       cardColor: Colors.white,
      canvasColor: creamColor,
     
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
      fontFamily: GoogleFonts.poppins().fontFamily,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    isDarkTheme = true;

    return ThemeData(
       primaryColor:Colors.white,
      brightness: Brightness.dark,
      useMaterial3: false,
      cardColor: Vx.gray700,
      dialogBackgroundColor:  Colors.black,
      canvasColor: darkColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: lightBluishColor
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: lightBluishColor
      ),
      appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
      fontFamily: GoogleFonts.poppins().fontFamily,
    );
  }

  // Colors

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkColor = Vx.gray900;
  static Color darkBluishColor = Colors.deepPurple;
  static Color lightBluishColor = const Color.fromARGB(255, 34, 150, 243);
}
