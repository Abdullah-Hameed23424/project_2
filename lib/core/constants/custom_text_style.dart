import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/config/app_config.dart';
import 'package:project_2/core/constants/app_colors.dart';

/// [CustomTextStyle]
/// This class contains all the text styles used in the app.
class CustomTextStyle {
  static final String defaultFontFamily = AppConfig.defaultFontFamily;

  /// [title] For App Logo
  static TextStyle get titleLarge => TextStyle(
    color: AppColors.white,
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
    fontFamily: defaultFontFamily,
  );

  static TextStyle get titleMedium => TextStyle(
    color: AppColors.white,
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    fontFamily: defaultFontFamily,
  );

  static TextStyle get titleSmall => TextStyle(
    color: AppColors.black,
    fontSize: 26.sp,
    fontWeight: FontWeight.w700,
    fontFamily: defaultFontFamily,
  );

  /// [body]
  static TextStyle get bodyLarge => TextStyle(
    color: AppColors.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
  );

  static TextStyle get bodyMedium => TextStyle(
    color: AppColors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
  );

  /// [headline] test style
  static TextStyle get headlineSmall => TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
}
