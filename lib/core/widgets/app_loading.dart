import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, this.color, this.size = 36});
  final Color? color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        thirdRingColor: AppColors.white,
        secondRingColor: AppColors.primary,
        color: color ?? AppColors.white,
        size: size.sp,
      ),
    );
  }
}
