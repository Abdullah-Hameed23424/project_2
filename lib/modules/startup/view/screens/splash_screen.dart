import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_images.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/storage/app_storage.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:animate_do/animate_do.dart';
import 'package:project_2/core/theme/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3), () async {
        final bool authorizedUser = await AppStorage.hasToken;
        if (authorizedUser) {
          AppRoutes.toNavBarScreen();
        } else {
          AppRoutes.toLoginScreen();
        }
      }),
      builder: (context, asyncSnapshot) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: AppStatusBarTheme.darknessBackground,
          child: Scaffold(
            body: LayoutBuilder(
              builder: (context, constraints) => Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryDark],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /// App Logo
                    FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: Image.asset(AppImages.appLogo, width: 200.w),
                    ),
                    SizedBox(height: 8.h),

                    /// Title
                    FadeIn(
                      duration: const Duration(milliseconds: 500),
                      delay: AppPeriods.animationDelay(10),
                      child: Text(
                        translate('app_name', context),
                        style: context.titleLarge40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
