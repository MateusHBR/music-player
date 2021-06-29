import 'package:flutter/material.dart' show TextStyle, FontWeight;

import 'values.dart';

abstract class TextStyles {
  static TextStyle heading1() => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 34,
        letterSpacing: 0.25,
        color: KColors.white,
      );

  static TextStyle medium() => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        color: KColors.white,
      );

  static TextStyle supertitle() => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 1.45,
        letterSpacing: 0.1,
        color: KColors.white,
      );

  static TextStyle supertitleMedium() => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1.45,
        letterSpacing: 0.1,
        color: KColors.white,
      );

  static TextStyle body() => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        letterSpacing: 0.25,
        height: 1.45,
        color: KColors.white,
      );

  static TextStyle bodyRegular() => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: 0.25,
        height: 1.45,
        color: KColors.white,
      );

  static TextStyle body2Thin() => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        letterSpacing: 0.5,
        color: KColors.white.withOpacity(0.6),
      );

  static TextStyle caption() => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.35,
        color: KColors.white.withOpacity(0.6),
      );
}
