import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';

class OrderInfoCard extends StatelessWidget {
  const OrderInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 60.w,
                height: 60.w,
                decoration: const BoxDecoration(
                  color: AppColors.lightBlue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.build_rounded,
                  color: const Color(0xFF56657C),
                  size: 27.5.sp,
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Maintenance', style: context.bodyLarge20),
                    SizedBox(height: 3.h),
                    Text(
                      '12 OCT 2023، 12 AM',
                      style: context.bodyMedium16.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 5.r,
                      backgroundColor: AppColors.primary,
                    ),
                    SizedBox(width: 5.w),
                    const Text('In Progress'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
