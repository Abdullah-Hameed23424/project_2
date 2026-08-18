import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_images.dart';
import 'package:project_2/core/theme/app_theme.dart';

class NoAddresses extends StatelessWidget {
  const NoAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(AppImages.noAddresses),
        SizedBox(height: 20.h),
        Text(
          'No saved locations yet',
          style: context.bodyLarge20.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          'You haven\'t saved any locations yet; tap the add button to save a new location',
          style: context.bodyMedium16.copyWith(color: const Color(0xff43474E)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
