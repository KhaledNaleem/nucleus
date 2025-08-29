import 'package:flutter/material.dart';

// Colors mirrored from src/styles/globals.css
const _lightBackground = Color(0xFFFFFFFF);
const _lightForeground = Color(0xFF242424); // approx oklch(0.145 0 0)
const _primary = Color(0xFF030213);
const _muted = Color(0xFFECECF0);
const _mutedForeground = Color(0xFF717182);
const _accent = Color(0xFFE9EBEF);
const _destructive = Color(0xFFD4183D);
// ignore: unused_element
const _profileAvatar = Color(0xFF284B63);

const _darkBackground = Color(0xFF000000);
const _darkCard = Color(0xFF1A1A1A);
const _darkBorder = Color(0xFF333333);

ThemeData buildLightTheme(TextTheme baseText) {
  final colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _primary,
    onPrimary: Colors.white,
    secondary: _accent,
    onSecondary: _primary,
    error: _destructive,
    onError: Colors.white,
    surface: _lightBackground,
    onSurface: _lightForeground,
    tertiary: _muted,
    onTertiary: _mutedForeground,
  );

  return ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: _lightBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xCCFFFFFF), // white/80 with blur-like opacity
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF3F3F5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0x1A000000)),
      ),
    ),
    cardTheme: const CardThemeData(
      color: Color.fromARGB(255, 243, 243, 243),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    textTheme: baseText.apply(bodyColor: _lightForeground, displayColor: _lightForeground),
    useMaterial3: true,
  );
}

ThemeData buildDarkTheme(TextTheme baseText) {
  final colorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Colors.black,
    onSecondary: Colors.white,
    error: _destructive,
    onError: Colors.white,
    surface: _darkCard,
    onSurface: Colors.white,
    tertiary: _darkBorder,
    onTertiary: Colors.white,
  );

  return ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: _darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xCC000000),
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1A1A1A),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _darkBorder),
      ),
    ),
    cardTheme: const CardThemeData(
      color: _darkCard,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    textTheme: baseText.apply(bodyColor: Colors.white, displayColor: Colors.white),
    useMaterial3: true,
  );
}
