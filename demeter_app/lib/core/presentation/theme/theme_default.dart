import 'package:demeter_app/core/export.dart';
import 'package:demeter_design_system/demeter_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final themeLight = ThemeData(
  fontFamily: 'ProximaNova',
  textTheme: textTheme(),
  scaffoldBackgroundColor: const Color(0xFFF6F6F6),
  cardTheme: cardTheme(),
  appBarTheme: appBarTheme(),
  elevatedButtonTheme: elevatedButtonTheme(),
  primaryColor: const Color(0xFF11ABEF),
  indicatorColor: const Color(0xFF364976),
  colorScheme: const ColorScheme.light(secondary: Color(0xFF1B253B)),
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: Color(0xFF364976)),
);

TextTheme textTheme() {
  return const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 42,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Color(0xFF364976),
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
  );
}

CardTheme cardTheme() {
  return CardTheme(
      elevation: 8,
      shadowColor: Colors.black.withOpacity(.2),
      shape: ShapeDecoration.fromBoxDecoration(
        BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ).shape);
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    backgroundColor: Colors.deepPurple,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  );
}

ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
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
  );
}
