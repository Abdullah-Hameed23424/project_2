import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_images.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/constants/app_sizes.dart';
import 'package:project_2/core/theme/app_theme.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 55.h),
      height: 340.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: AppSizes.xLargeSpace),

          FadeInLeft(child: Image.asset(AppImages.appLogo, width: 150.w)),

          SizedBox(height: AppSizes.tinySpace),

          FadeInLeft(
            delay: AppPeriods.animationDelay(2),
            child: Text('Welcome back', style: context.titleMedium36),
          ),
        ],
      ),
    );
  }
}
