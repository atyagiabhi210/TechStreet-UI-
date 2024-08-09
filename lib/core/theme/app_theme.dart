import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_street/core/theme/app_palette.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppPalette.seedColor,
    ),
    scaffoldBackgroundColor: AppPalette.scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme().copyWith(
      color: Colors.transparent,
    ),
    textTheme: GoogleFonts.lexendTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        elevation: 5,
      ),
    ),
  );
}
