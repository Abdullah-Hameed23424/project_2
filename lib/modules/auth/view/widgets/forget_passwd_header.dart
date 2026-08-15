import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/modules/auth/view/widgets/custom_header_icon.dart';

class ForgetPasswdHeader extends StatelessWidget {
  const ForgetPasswdHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const CustomHeaderIcon(
          iconData: Icons.lock_reset,
          iconColor: AppColors.primary,
        ),
        SizedBox(height: 35.h),
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
        SizedBox(height: 10.h),
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
