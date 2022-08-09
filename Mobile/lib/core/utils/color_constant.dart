import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color bluegray800 = fromHex('#303a52');

  static Color pinkA100 = fromHex('#fc85ae');

  static Color gray500 = fromHex('#999999');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color gray200 = fromHex('#eaeaea');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray50 = fromHex('#fcfcfc');

  static Color purple400 = fromHex('#9e579d');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
