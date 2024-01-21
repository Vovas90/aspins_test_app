import 'dart:math';

import 'package:flutter/material.dart';

class AspinsColors {
  static const mainColor = Color(0xFF7562C6);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  static const orange = Color(0xFFF86C17);

  static get randomColor => Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}
