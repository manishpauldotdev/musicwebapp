import 'package:flutter/material.dart';
import 'package:musicwebapp/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xFF121212), // Dark background color
      colorScheme: ColorScheme.dark(
        primary: Colors.deepPurple,
        secondary: Colors.deepPurpleAccent,
        background: Color(0xFF121212),
        surface: Color(0xFF1E1E1E),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onBackground: Colors.white,
        onSurface: Colors.white,
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontFamily: 'InterVariable',
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: Colors.white,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'InterVariable',
          fontWeight: FontWeight.w600,
          fontSize: 28,
          color: Colors.white70,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'InterVariable',
          fontWeight: FontWeight.w500,
          fontSize: 24,
          color: Colors.white70,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'InterVariable',
          fontSize: 16,
          color: Colors.white70,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'InterVariable',
          fontSize: 14,
          color: Colors.white60,
        ),
        labelLarge: TextStyle(
          fontFamily: 'InterVariable',
          fontSize: 16,
          color: Colors.white70,
        ),
        labelMedium: TextStyle(
          fontFamily: 'InterVariable',
          fontSize: 14,
          color: Colors.white60,
        ),
        titleMedium: TextStyle(
          fontFamily: 'InterVariable',
          fontSize: 14,
          color: Colors.white,
        ),
        titleSmall: TextStyle(
          fontFamily: 'InterVariable',
          fontSize: 12,
          color: Colors.white60,
        ),
        labelSmall: TextStyle(
          fontFamily: 'InterVariable',
          fontSize: 10,
          color: Colors.white60,
        ),
      ),
    );
  }
}
