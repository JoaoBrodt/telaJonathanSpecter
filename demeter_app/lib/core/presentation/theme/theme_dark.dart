import 'package:demeter_design_system/demeter_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final themeDark = ThemeData(
  textTheme: textDarkTheme(),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.white),
  cardTheme: cardDarkTheme(),
  primaryColor: const Color(0xFF364976),
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF070417),
  scaffoldBackgroundColor: const Color(0xFF070417),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF070417),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  indicatorColor: const Color(0xFF364976),
  colorScheme: const ColorScheme.dark(
    secondary: Color(0xFF1B253B),
  ),
  elevatedButtonTheme: elevatedButtonDarkTheme(),
);

ElevatedButtonThemeData elevatedButtonDarkTheme() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all<double>(4),
      foregroundColor:
          MaterialStateProperty.resolveWith<Color>((states) => Colors.white),
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.pressed) ||
            states.contains(MaterialState.selected) ||
            states.contains(MaterialState.focused)) {
          return const Color(0xFF364976).withOpacity(0.8);
        }
        return const Color(0xFF364976);
      }),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
        (_) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AdaptativeTheme.defaultRounded),
        ),
      ),
    ),
  );
}

TextTheme textDarkTheme() {
  return const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 42,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
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
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    displayLarge: TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1),
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
  );
}

CardTheme cardDarkTheme() {
  return CardTheme(
      elevation: 8,
      shadowColor: Color.fromARGB(255, 59, 59, 59),
      shape: ShapeDecoration.fromBoxDecoration(
        BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ).shape);
}
