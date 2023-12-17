import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor {
  static int hexColor(String color) {
    String newColor = '0xff' + color;
    newColor = newColor.replaceAll('#', '');
    int finalColor = int.parse(newColor);
    return finalColor;
  }

  static MaterialColor createMaterialColor(Color hexColors) {
    Color color = hexColors;

    Map<int, Color> swatch = {
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color.withOpacity(0.6),
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color.withOpacity(1.0),
    };

    return MaterialColor(color.value, swatch);
  }

  // Color primaryColor = Color(hexColor('#F7B217'));
  // Color secondaryColor = Color(hexColor('#F7B217'));
  // Color textColor = Colors.black;
  // Color buttonColor = Color(hexColor('#F7B217'));
  // Color iconColor =  Colors.black;

// static Color purpleLight = Color(hexColor('#F7B217')) ;
  static Color primaryColor = Color(hexColor('#F7B217'));
// static Color purpleDark = Color(hexColor('#0d193e')) ;
// static Color orangeDark = Color(hexColor('#ec8d2f')) ;
// static Color orangeLight = Color(hexColor('#f8b250')) ;
static Color redDark = Color(hexColor('#f44336')) ;
// static Color redLight = Color(hexColor('#ff5182')) ;
// static Color blueLight = Color(hexColor('#0293ee')) ;
// static Color greenLight = Color(hexColor('#13d38e')) ;
  static Color white = Colors.white;

// static Color secondaryColor = Color(hexColor('#1A202C')) ;
  static Color secondaryColor = Color(hexColor('#1e224c'));
  static Color blackColor = Color(hexColor('#000000'));

  static Color snackBarColor = Color(hexColor('#FF0D9412'));
}
