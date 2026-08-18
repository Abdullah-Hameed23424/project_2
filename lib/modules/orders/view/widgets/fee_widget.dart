import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/theme/app_theme.dart';

class FeeWidget extends StatelessWidget {
  final String fee;
  const FeeWidget({super.key, required this.fee});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: AppPeriods.animationDelay(5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.lightBlue,
        ),
        child: Row(
          children: <Widget>[
            const CircleAvatar(
              backgroundColor: AppColors.white,
              child: Icon(Icons.money, color: AppColors.primary),
            ),
            SizedBox(width: 5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Inspection Fees', style: context.bodyLarge20),
                Text(
                  'Deducted from the final cost',
                  style: context.bodyMedium16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const Spacer(),
            Text(
              '$fee S.P',
              style: context.titleSmall26.copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
