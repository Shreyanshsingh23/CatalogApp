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
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
      fontFamily: GoogleFonts.lato().fontFamily,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    isDarkTheme = true;

    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.lato().fontFamily,
    );
  }
}
