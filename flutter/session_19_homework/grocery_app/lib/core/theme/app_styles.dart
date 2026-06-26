import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle titleTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 1.09,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 1.35,
  );

  static final TextStyle bodyTextStyle = TextStyle(
    color: Colors.black.withValues(alpha: 0.70),
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w300,
    height: 1.57,
  );
}
