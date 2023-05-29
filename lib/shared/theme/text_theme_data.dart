import 'package:flutter/material.dart';

class TextThemeData {
  static TextTheme get theme {
    return TextTheme(
      headlineMedium: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        color: Colors.black,
      ),
      headlineSmall: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontFamily: 'Poppins',
        color: Colors.grey.shade900,
      ),
    );
  }
}
