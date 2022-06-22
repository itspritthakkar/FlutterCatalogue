import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/config/palette.dart';

class AppTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    cardColor: Colors.white,
    buttonTheme: ButtonThemeData(
        buttonColor: darkBluishColor
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    canvasColor: bgColor,
    appBarTheme: AppBarTheme(
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Palette.darkBluish, brightness: Brightness.light).copyWith(primary: AppTheme.darkBluishColor, secondary: Colors.black, primaryContainer: Palette.darkBluish.shade800)
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    cardColor: Colors.black26,
    buttonTheme: ButtonThemeData(
      buttonColor: lightBluishColor
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    canvasColor: darkBgColor,
    appBarTheme: AppBarTheme(
        color: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue, brightness: Brightness.dark).copyWith(primary: Colors.white, secondary: Colors.indigo, primaryContainer: Colors.indigo),
  );

  // Colors
  static Color bgColor = const Color(0xfff5f5f5);
  static Color darkBgColor = const Color(0xFF111827);
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = const Color(0xFF6366F1);
}