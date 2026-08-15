import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/localization/cubit/localization_cubit.dart';
import 'package:project_2/core/theme/app_theme.dart';

class LanguageTile extends StatelessWidget {
  final String title;
  final Locale locale;
  final Locale currentLocale;
  const LanguageTile({
    super.key,
    required this.title,
    required this.locale,
    required this.currentLocale,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentLocale.languageCode == locale.languageCode;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      title: Text(
        title,
        style: context.bodyLarge20.copyWith(
          color: AppColors.black,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      trailing: Radio<Locale>(value: locale, activeColor: AppColors.primary),
      onTap: () {
        context.read<LocalizationCubit>().changeLocale(locale: locale);
      },
    );
  }
}
