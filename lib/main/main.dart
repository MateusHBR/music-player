import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui/values/values.dart';

import './app.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    Platform.isIOS ? SystemStyles.primaryiOS : SystemStyles.primaryAndroid,
  );

  runApp(App());
}
