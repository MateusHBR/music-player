import 'package:flutter/material.dart';

import '../../ui/values/values.dart';

abstract class Theme {
  static ThemeData get primary {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: KColors.white,
      ),
    );
  }
}
