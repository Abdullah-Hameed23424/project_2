import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';

class OrderClosureNumberCard extends StatelessWidget {
  const OrderClosureNumberCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Give this code to the technician to close the request',
            style: context.bodyMedium16.copyWith(
              color: const Color(0xff56657C),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 25.h),
          Text(
            '4812',
            style: context.titleMedium36.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
              letterSpacing: 12.w,
            ),
          ),
          SizedBox(height: 25.h),
          Text(
            'Please ensure the work is completed before providing the code',
            style: context.bodyMedium16.copyWith(
              color: const Color(0xff56657C),
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
