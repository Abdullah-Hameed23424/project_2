import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_sizes.dart' show AppSizes;

class CustomHeader extends StatelessWidget {
  final IconData iconData;
  const CustomHeader({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: AppSizes.authUpperCardHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
          colors: <Color>[AppColors.primaryDark, AppColors.primary],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSizes.largeRadius),
          bottomRight: Radius.circular(AppSizes.largeRadius),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: AppSizes.smallSpace),

          FadeInLeft(
            child: Icon(iconData, size: 100.sp, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
