import 'package:demeter_app/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final themeLight = ThemeData(
  fontFamily: 'ProximaNova',
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(
      color: Colors.white,
      fontSize: 10,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1),
      fontSize: 13,
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: const Color(0xFFedecec),
  cardTheme: CardTheme(
      elevation: 8,
      shadowColor: Colors.black.withOpacity(.2),
      shape: ShapeDecoration.fromBoxDecoration(
        BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ).shape),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.deepPurple,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all<double>(4),
      foregroundColor:
          MaterialStateProperty.resolveWith<Color>((states) => Colors.white),
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.pressed) ||
            states.contains(MaterialState.selected) ||
            states.contains(MaterialState.focused)) {
          return const Color(0xFF17a1e8).withOpacity(0.8);
        }
        return const Color(0xFF17a1e8);
      }),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
        (_) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AdaptativeTheme.defaultRounded),
        ),
      ),
    ),
  ),
  primaryColor: Colors.deepPurple,
  indicatorColor: Colors.deepPurple,
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: Colors.deepPurple),
);
