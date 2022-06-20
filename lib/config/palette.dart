import 'package:flutter/material.dart';
class Palette {
  static const MaterialColor darkBluish = MaterialColor(
    0xFF403B58, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFFF6F6F7),
      100: Color(0xFFECECEF),
      200: Color(0xFFD0CED6),
      300: Color(0xFFB1AFBB),
      400: Color(0xFF7A768B),
      500: Color(0xFF403B58),
      600: Color(0xFF39354F),
      700: Color(0xFF272435),
      800: Color(0xFF1D1B28),
      900: Color(0xFF13121A),
    },
  );
}