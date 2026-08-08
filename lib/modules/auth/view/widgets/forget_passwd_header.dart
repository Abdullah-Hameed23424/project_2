import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/constants/app_sizes.dart';
import 'package:project_2/core/theme/app_theme.dart';

class ForgetPasswdHeader extends StatelessWidget {
  const ForgetPasswdHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FadeInLeft(
          child: Container(
            width: 150.w,
            height: 150.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withAlpha(50),
            ),
            child: Icon(
              Icons.lock_reset,
              size: AppSizes.largeIcon,
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(height: AppSizes.largeSpace),
        FadeInLeft(
          delay: AppPeriods.animationDelay(2),
          child: Text(
            'Forgot your password?',
            style: context.titleMedium36.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: AppSizes.smallSpace),
        FadeInLeft(
          delay: AppPeriods.animationDelay(3),
          child: Text(
            'Enter your registered phone number so we can send you an access recovery code.',
            style: context.bodyLarge20,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
