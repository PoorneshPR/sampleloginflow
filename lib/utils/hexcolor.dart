import 'package:flutter/material.dart';
  /*
  light blue - #3ba1fe

primary blue - #0785f4

black - #00000

Font - Myriad Pro  - regular, bold , semibold
   */


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
