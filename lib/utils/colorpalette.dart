import 'package:flutter/material.dart';

class ColorPalette {



  static const MaterialColor materialPrimary = MaterialColor(
    0xFF00CBC0,
    <int, Color>{
      50: Color(0xFF00CBC0),
      100: Color(0xFF00CBC0),
      200: Color(0xFF00CBC0),
      300: Color(0xFF00CBC0),
      400: Color(0xFF00CBC0),
      500: Color(0xFF00CBC0),
      600: Color(0xFF00CBC0),
      700: Color(0xFF00CBC0),
      800: Color(0xFF00CBC0),
      900: Color(0xFF00CBC0),
    },
  );
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
