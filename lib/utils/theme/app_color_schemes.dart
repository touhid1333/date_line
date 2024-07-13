import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF336F4A);
  static const Color secondaryColor = Color(0xFF86B560);
  static const Color tertiaryColor = Color(0xFFFF737A);
  static const Color hintColor = Color(0xFF6A6A6A);
}

class AppColorSchemes {
  // --------------------------------------
  // Light Color scheme
  // --------------------------------------
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    outline: AppColors.hintColor,
    tertiary: AppColors.tertiaryColor,
  );

  // --------------------------------------
  // Dark Color scheme
  // --------------------------------------
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.black45,
    onSurface: Colors.white,
    outline: AppColors.hintColor,
    tertiary: AppColors.tertiaryColor,
  );
}
