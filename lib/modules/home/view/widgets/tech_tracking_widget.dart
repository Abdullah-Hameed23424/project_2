import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/custom_button.dart';

class TechTrackingWidget extends StatelessWidget {
  const TechTrackingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FadeInLeft(
        delay: AppPeriods.animationDelay(2),
        child: Container(
          height: 150.h,
          margin: EdgeInsets.only(top: 15.h),
          padding: EdgeInsets.all(12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border(
              top: BorderSide(width: 1.w, color: AppColors.deepGreen),
              right: BorderSide(width: 1.w, color: AppColors.deepGreen),
              bottom: BorderSide(width: 1.w, color: AppColors.deepGreen),
              left: BorderSide(width: 10.w, color: AppColors.deepGreen),
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: CircleAvatar(
                            radius: 5.r,
                            backgroundColor: AppColors.deepGreen,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Flexible(
                          child: Text(
                            'Technician Ahmed is on his way to you',
                            style: context.bodyLarge20,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    Text(
                      'Time remaining: 15 minutes',
                      style: context.bodyMedium16.copyWith(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CustomButton(
                  label: 'Tracking',
                  onPressed: () {},
                  backgroundColor: AppColors.deepGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
