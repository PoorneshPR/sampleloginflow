import 'package:flutter/material.dart';

class ReusableWidgets{
///emptyBox  sizedBox
  static Widget emptyBox(
      {double? height, double? width, Widget? childWidget}) =>
      SizedBox(
        height: height,
        width: width,
        child: childWidget,
      );

}