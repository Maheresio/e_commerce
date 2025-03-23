import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class AppThemes {
  AppThemes._();
  static ThemeData get lightTheme =>
      ThemeData(textTheme: GoogleFonts.montserratTextTheme());
  static ThemeData get darkTheme =>
      ThemeData.dark().copyWith(textTheme: GoogleFonts.montserratTextTheme());
}
