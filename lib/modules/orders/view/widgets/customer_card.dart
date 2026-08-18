import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/modules/orders/view/widgets/custom_card.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        children: <Widget>[
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryDark.withAlpha(125),
                width: 2,
              ),
            ),
            child: Icon(
              Icons.person_outline_rounded,
              size: 30.sp,
              color: AppColors.primaryDark.withAlpha(125),
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Ahmad Maud', style: context.bodyLarge20),
                SizedBox(height: 8.h),
                Text('Car', style: context.bodyMedium16),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.star_rounded,
                  size: 24.sp,
                  color: const Color(0xFFF3B800),
                ),
                SizedBox(width: 2.w),
                Text('5.0', style: context.bodyMedium16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
