import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/custom_text_style.dart';
import 'package:project_2/core/localization/cubit/localization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [AppTheme]
/// This class contains the app theme data.
class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    final LocalizationCubit localizationCubit = context
        .read<LocalizationCubit>();
    final isArabic =
        (localizationCubit.appLocale?.languageCode ?? 'ar') == 'ar';
    final fontFamily = isArabic ? 'firstFont' : 'secondFont';

    return ThemeData(
      fontFamily: fontFamily,
      scaffoldBackgroundColor: AppColors.white,
      useMaterial3: true,
      textTheme: TextTheme(
        titleLarge: CustomTextStyle.titleLarge,
        titleMedium: CustomTextStyle.titleMedium,
        titleSmall: CustomTextStyle.titleSmall,
      ),
    );
  }
}

/// [TextThemeExtension]
/// This extension provides a convenient way to access the text theme from the BuildContext.
extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// [Title]
  TextStyle get titleLarge40 => textTheme.titleLarge!;
  TextStyle get titleMedium36 => textTheme.titleMedium!;
  TextStyle get titleSmall26 => textTheme.titleSmall!;

  /// [headline] test style
  TextStyle get headlineSmall14 => textTheme.headlineSmall!;
}
