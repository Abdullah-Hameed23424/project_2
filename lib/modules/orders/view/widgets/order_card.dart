import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/theme/app_theme.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRoutes.toOrderDetailsScreen(orderId: 1);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border(
            top: BorderSide(width: 10.w, color: AppColors.primary),
            right: BorderSide(width: 1.w, color: AppColors.primary),
            bottom: BorderSide(width: 1.w, color: AppColors.primary),
            left: BorderSide(width: 1.w, color: AppColors.primary),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 60.h,
                  height: 60.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lightBlue,
                  ),
                  child: const Icon(
                    Icons.build_rounded,
                    color: Color(0xff56657C),
                  ),
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Water',
                        style: context.bodyLarge20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '12 أكتوبر 2023 - 10:00 ص',
                        style: TextStyle(color: Color(0xff747784)),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 5.r,
                        backgroundColor: AppColors.primaryDark,
                      ),
                      SizedBox(width: 5.w),
                      const Text('In Progress'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),

            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.lightBlue.withAlpha(100),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: const Text(
                'هناك تسريب مياه مستمر تحت حوض المطبخ، يرجى إرسال فني متخصص لفحصه وإصلاحه في أقرب وقت',
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 20.h),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text.rich(
                  style: context.bodyLarge20.copyWith(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w500,
                  ),
                  const TextSpan(
                    children: <InlineSpan>[
                      TextSpan(text: 'Type: '),
                      TextSpan(text: 'Immediately'),
                    ],
                  ),
                ),

                Text.rich(
                  style: context.bodyLarge20.copyWith(color: AppColors.primary),
                  TextSpan(
                    children: <InlineSpan>[
                      const TextSpan(text: 'Details'),
                      WidgetSpan(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20.sp,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
