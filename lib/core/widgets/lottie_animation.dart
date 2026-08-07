import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_animations.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/custom_button.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {
  final bool? repeat;
  final String label;
  final bool showLabel;
  final Color? labelColor;
  final String animationImage;
  final bool enableButton;
  final String btnLabel;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry? btnBorderRadius;
  final Size? btnSize;
  final Color? btnColor;
  final double width;
  final Color? btnLabelColor;
  const LottieAnimation({
    this.repeat,
    super.key,
    this.label = '',
    this.showLabel = false,
    this.labelColor = AppColors.primary,
    required this.animationImage,
    this.enableButton = false,
    this.btnLabel = 'إعادة المحاولة',
    this.onPressed,
    this.btnBorderRadius,
    this.btnSize,
    this.btnColor = AppColors.white,
    this.width = 250,
    this.btnLabelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeIn(
          animate: true,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 250),
          child: Lottie.asset(
            animationImage,
            width: width,
            repeat: repeat,
            animate: true,
          ),
        ),
        if (showLabel) SizedBox(height: 20.h),
        if (showLabel)
          FadeIn(
            animate: true,
            curve: Curves.linear,
            duration: const Duration(milliseconds: 250),
            child: Text(
              label,
              style: context.headlineSmall14.copyWith(
                color: labelColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        if (enableButton) SizedBox(height: 20.h),
        if (enableButton)
          CustomButton(
            label: btnLabel,
            buttonStyle: context.headlineSmall14.copyWith(color: btnLabelColor),
            onPressed: onPressed,
            borderRadius: btnBorderRadius,
            size: btnSize,
            backgroundColor: btnColor,
          ),
      ],
    );
  }
}
