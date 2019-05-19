import 'dart:ui';
import 'package:flutter/cupertino.dart';
class Colors {

  const Colors();

// static const Color loginGradientStart = const Color(0xFFE91E63);
 // static const Color loginGradientEnd = const Color(0xFFF44336);
//  static const Color loginGradientStart = const Color(0xFFffd5d8);
  static const Color loginGradientStart = const Color(0xFFFCAE86);
  static const Color loginGradientEnd = const Color(0xFFE16B8F);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

