import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/localization/cubit/localization_cubit.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/modules/profile/view/widgets/language_tile.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        systemOverlayStyle: AppStatusBarTheme.lightnessStatusBar,
        leading: const PopButton(color: AppColors.black),
        title: Text(
          translate('profile.lang_label', context),
          style: context.titleSmall26.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 8.h),

            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: BlocBuilder<LocalizationCubit, LocalizationState>(
                builder: (context, state) {
                  final cubit = context.read<LocalizationCubit>();

                  return RadioGroup<Locale>(
                    groupValue: cubit.appLocale,
                    onChanged: (Locale? value) {
                      if (value == null) return;

                      cubit.changeLocale(locale: value);
                    },
                    child: Column(
                      children: [
                        LanguageTile(
                          title: 'English',
                          locale: const Locale('en'),
                          currentLocale: cubit.appLocale!,
                        ),

                        Divider(height: 1, indent: 16.w, endIndent: 16.w),

                        LanguageTile(
                          title: 'العربية',
                          locale: const Locale('ar'),
                          currentLocale: cubit.appLocale!,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
