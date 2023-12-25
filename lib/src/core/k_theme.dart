import 'package:flutter/material.dart';
import 'package:free_gpt/src/src.dart';

class KTheme {
  static double padd = 12;
  static double radius = 16;

  static EdgeInsets get padding => EdgeInsets.all(padd);
  static BorderRadius get borderRadius => BorderRadius.circular(radius);

  static Brightness sysBrightness(BuildContext context) {
    return context.theme.brightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;
  }
}
