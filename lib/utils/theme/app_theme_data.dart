import 'package:date_line/utils/theme/app_color_schemes.dart';
import 'package:date_line/utils/theme/app_text_themes.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  // --------------------------------------
// Light Theme Data
// --------------------------------------
  static final lightThemeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.zero,
    ),
    colorScheme: AppColorSchemes.lightColorScheme,
    textTheme: AppTextThemes.lightTextTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: AppTextThemes.lightTextTheme.titleLarge,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(0),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        textStyle: WidgetStatePropertyAll(
          AppTextThemes.lightTextTheme.headlineMedium
              ?.copyWith(color: AppColorSchemes.lightColorScheme.onPrimary),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColorSchemes.lightColorScheme.outline.withOpacity(0.01),
      isDense: true,
      filled: true,
      hintStyle: AppTextThemes.lightTextTheme.bodyMedium?.copyWith(
        color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.6),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(
          color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.2),
          width: 0.85,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(
          color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.2),
          width: 0.85,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(
          color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.2),
          width: 0.85,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 9,
        horizontal: 14,
      ),
      labelStyle: AppTextThemes.lightTextTheme.bodyMedium,
    ),
  );

// --------------------------------------
// Dark Theme Data
// --------------------------------------
  static final darkThemeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black45,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      color: Colors.black45,
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.zero,
    ),
    colorScheme: AppColorSchemes.darkColorScheme,
    textTheme: AppTextThemes.darkTextTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: AppTextThemes.darkTextTheme.titleLarge,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(0),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        textStyle: WidgetStatePropertyAll(
          AppTextThemes.lightTextTheme.headlineMedium
              ?.copyWith(color: AppColorSchemes.darkColorScheme.onPrimary),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColorSchemes.darkColorScheme.shadow,
      isDense: true,
      filled: true,
      hintStyle: AppTextThemes.darkTextTheme.bodyMedium?.copyWith(
        color: AppColorSchemes.darkColorScheme.outlineVariant,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(
          color: AppColorSchemes.darkColorScheme.outline,
          width: 0.85,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(
          color: AppColorSchemes.darkColorScheme.outline,
          width: 0.85,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(
          color: AppColorSchemes.darkColorScheme.outline,
          width: 0.85,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 9,
        horizontal: 14,
      ),
      labelStyle: AppTextThemes.darkTextTheme.bodyMedium,
    ),
  );
}
