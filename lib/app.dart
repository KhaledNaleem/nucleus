import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_router.dart';
import 'theme/app_theme.dart';

class EGuardianApp extends StatefulWidget {
  const EGuardianApp({super.key});

  @override
  State<EGuardianApp> createState() => _EGuardianAppState();
}

class _EGuardianAppState extends State<EGuardianApp> {
  ThemeMode _mode = ThemeMode.light;

  late final GoRouter _router = createRouter(onToggleTheme: _toggleTheme);

  void _toggleTheme() {
    setState(() {
      _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Nucleus",
      routerConfig: _router,
      themeMode: _mode,
      theme: buildLightTheme(GoogleFonts.interTextTheme()),
      darkTheme: buildDarkTheme(GoogleFonts.interTextTheme()),
    );
  }
}
