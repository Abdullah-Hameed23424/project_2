import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStatusBarTheme {
  /// [FOR_LIGHTNESS_BG]
  static const lightnessStatusBar = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );

  /// [FOR_DARKNESS_BG]
  static const darknessBackground = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );
}
