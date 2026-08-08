import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_sizes.dart';
import 'package:project_2/core/constants/dimensions.dart';
import 'package:project_2/core/theme/app_theme.dart';

class OtpPinput extends StatelessWidget {
  final TextEditingController otpController;
  final void Function(String code) onCompleted;
  final bool enable;

  OtpPinput({
    super.key,
    required this.otpController,
    required this.onCompleted,
    required this.enable,
  });

  final baseDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(12.r),
    border: Border.all(color: Colors.grey.shade300),
    color: const Color(0xFFF9F9F9),
  );

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: Dimensions.autoSize(70),
      height: Dimensions.autoSize(70),
      textStyle: context.bodyLarge20.copyWith(
        fontSize: Dimensions.autoSize(20),
        fontWeight: FontWeight.bold,
      ),
      decoration: baseDecoration,
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: baseDecoration.copyWith(
        border: Border.all(color: AppColors.primary, width: 0.5),
        color: AppColors.primary.withAlpha(100),
      ),
    );
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        enabled: enable,
        separatorBuilder: (index) => SizedBox(width: AppSizes.mediumRadius),
        onSubmitted: onCompleted,
        controller: otpController,
        length: 4,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        onCompleted: onCompleted,
      ),
    );
  }
}
