import 'package:feature_based_with_mvvm/core/constants/app_colors.dart';
import 'package:feature_based_with_mvvm/core/localization/cubit/localization_cubit.dart';
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
    );
  }
}

/// [TextThemeExtension]
/// This extension provides a convenient way to access the text theme from the BuildContext.
extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// [headline] test style
  TextStyle get headlineSmall14 => textTheme.headlineSmall!; // [IN USE]
}
