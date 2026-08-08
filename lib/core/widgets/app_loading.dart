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
        thirdRingColor: const Color.fromARGB(255, 89, 155, 255),
        secondRingColor: const Color.fromARGB(255, 5, 109, 255),
        color: color ?? AppColors.primaryDark,
        size: size.sp,
      ),
    );
  }
}
