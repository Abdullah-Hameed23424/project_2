import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';

class AddressesList extends StatelessWidget {
  const AddressesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 16.h),
      sliver: SliverList.separated(
        itemCount: 4,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(width: 1, color: const Color(0xffE2E2EA)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 30.r,
                backgroundColor: AppColors.lightBlue,
                child: Icon(Icons.location_on_outlined, size: 32.sp),
              ),
              SizedBox(width: 8.w),
              Text('Home', style: context.bodyLarge20),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_outlined,
                  color: AppColors.primary,
                  size: 28.sp,
                ),

                style: IconButton.styleFrom(
                  backgroundColor: AppColors.lightBlue.withAlpha(100),
                ),
              ),
              SizedBox(width: 5.w),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_outline,
                  color: AppColors.errorColor,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.errorColor.withAlpha(40),
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 10.h),
      ),
    );
  }
}
