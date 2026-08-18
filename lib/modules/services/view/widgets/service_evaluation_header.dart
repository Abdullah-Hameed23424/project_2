import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';

class ServiceEvaluationHeader extends StatelessWidget {
  const ServiceEvaluationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.r,
            backgroundColor: AppColors.lightBlue,
            child: Icon(Icons.build_rounded, size: 50.sp),
          ),

          SizedBox(height: 20.h),

          Text(
            'How was your experience?',
            style: context.titleSmall26.copyWith(color: AppColors.primary),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 12.h),

          Text(
            'Share your feedback so we can improve our services',
            style: context.bodyMedium16.copyWith(
              color: const Color(0xff434652),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
