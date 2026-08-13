import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_sizes.dart';

class CustomHeaderIcon extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;

  const CustomHeaderIcon({
    super.key,
    required this.iconData,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Container(
        width: 150.w,
        height: 150.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary.withAlpha(50),
        ),
        child: Icon(iconData, size: AppSizes.largeIcon, color: iconColor),
      ),
    );
  }
}
