import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.blue;
  static const Color accentColor = Colors.green;
  static const Color backgroundColor = Colors.white;
  static const Color darkBackgroundColor = Color(0xFF121212);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    // Ajoutez d'autres personnalisations de thème ici
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: accentColor,
    ),
    scaffoldBackgroundColor: darkBackgroundColor,
    // Ajoutez d'autres personnalisations de thème ici
  );
}

// Power By leonelmaken