import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'values.dart';

abstract class SystemStyles {
  static const _systemNavigationBarColor = KColors.white;
  static const _statusBarColor = Colors.transparent;

  static const primaryAndroid = SystemUiOverlayStyle(
    statusBarColor: _statusBarColor,
    systemNavigationBarColor: _systemNavigationBarColor,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static const primaryiOS = SystemUiOverlayStyle(
    statusBarColor: _statusBarColor,
    systemNavigationBarColor: _systemNavigationBarColor,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  );
}
