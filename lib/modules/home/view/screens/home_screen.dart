import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_sizes.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/core/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppStatusBarTheme.lightnessStatusBar,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingH),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeInLeft(
                duration: const Duration(seconds: 1),
                child: Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Text(
                    'Thanks For Watching',
                    style: context.titleSmall26.copyWith(
                      color: AppColors.primaryDark,
                    ),
                  ),
                ),
              ),
              FadeInRight(
                duration: const Duration(seconds: 1),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'Abdullah Hameed 😎',
                    style: context.titleSmall26.copyWith(
                      color: AppColors.primaryDark,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
