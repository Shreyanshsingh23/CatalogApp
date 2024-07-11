import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static bool isDarkTheme = true;
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: false,
      primarySwatch: Colors.deepPurple,
      // primaryColor: Colors.pink,
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
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.lato().fontFamily,
    );
  }

  // Colors

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Colors.deepPurple;
}
