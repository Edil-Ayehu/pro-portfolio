import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue[900],
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 18,
        color: Colors.black87,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.black87,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[400],
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 18,
        color: Colors.white70,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.white70,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),
  );
}
