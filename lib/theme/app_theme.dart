import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Colors.black;
  static const Color card = Color(0xFF121212);
  static const Color cardHighlight = Color(0xFF1C1C1E);
}

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      onPrimary: Colors.black,
      surface: Colors.black,
      onSurface: Colors.white,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      indicatorColor: Color(0xFF2A2A2A),
    ),
  );
}