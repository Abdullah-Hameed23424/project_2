import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/custom_text_style.dart';
import 'package:flutter/material.dart';

/// [AppTheme]
/// This class contains the app theme data.
class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: AppColors.lightBlue,
        titleTextStyle: CustomTextStyle.titleSmall.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
      ),
      fontFamily: CustomTextStyle.defaultFontFamily,
      scaffoldBackgroundColor: AppColors.white,
      useMaterial3: true,
      textTheme: TextTheme(
        titleLarge: CustomTextStyle.titleLarge,
        titleMedium: CustomTextStyle.titleMedium,
        titleSmall: CustomTextStyle.titleSmall,
        bodyLarge: CustomTextStyle.bodyLarge,
        bodyMedium: CustomTextStyle.bodyMedium,
        headlineLarge: CustomTextStyle.headlineLarge,
        headlineMedium: CustomTextStyle.headlineMedium,
      ),
    );
  }
}

/// [TextThemeExtension]
/// This extension provides a convenient way to access the text theme from the BuildContext.
extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// [title]
  TextStyle get titleLarge40 => textTheme.titleLarge!;
  TextStyle get titleMedium36 => textTheme.titleMedium!;
  TextStyle get titleSmall26 => textTheme.titleSmall!;

  /// [body]
  TextStyle get bodyLarge20 => textTheme.bodyLarge!;
  TextStyle get bodyMedium16 => textTheme.bodyMedium!;

  /// [headline] test style
  TextStyle get headlineLarge30 => textTheme.headlineLarge!;
  TextStyle get headlineMedium18 => textTheme.headlineMedium!;
  TextStyle get headlineSmall14 => textTheme.headlineSmall!;
}
