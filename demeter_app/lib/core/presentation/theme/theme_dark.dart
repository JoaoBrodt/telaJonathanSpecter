import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final themeDark = ThemeData(
  textTheme: GoogleFonts.rubikTextTheme(
    const TextTheme(
      // headline1: TextStyle(
      //   fontSize: 32,
      //   fontWeight: FontWeight.w500,
      //   color: Colors.white,
      // ),
      // headline2: TextStyle(
      //   fontSize: 24,
      //   fontWeight: FontWeight.w500,
      //   color: Colors.white,
      // ),
      // headline4: TextStyle(
      //   fontSize: 16,
      //   fontWeight: FontWeight.normal,
      //   color: Colors.white,
      // ),
      // headline6: TextStyle(
      //   fontSize: 16,
      //   fontWeight: FontWeight.w600,
      //   color: Colors.white,
      // ),
      // subtitle1: TextStyle(
      //   fontSize: 14,
      //   fontWeight: FontWeight.w400,
      // ),
      // bodyText2: TextStyle(
      //   fontSize: 10,
      //   color: Colors.deepPurple,
      //   fontWeight: FontWeight.w400,
      // ),
      labelLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.white),
  cardTheme: const CardTheme(
    color: Color(0xFF292639),
  ),
  primaryColor: Colors.deepPurple,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF070417),
  scaffoldBackgroundColor: const Color(0xFF070417),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF070417),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
);
