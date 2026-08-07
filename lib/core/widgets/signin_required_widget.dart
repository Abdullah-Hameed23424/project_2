import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/theme/app_theme.dart';

class SigninRequiredWidget extends StatelessWidget {
  const SigninRequiredWidget({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ZoomIn(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              ZoomIn(
                delay: const Duration(milliseconds: 200),
                child: Container(
                  width: 100.w,
                  height: 100.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lock_outline_rounded,
                    size: 50.sp,
                    color: AppColors.primary,
                  ),
                ),
              ),

              SizedBox(height: 32.h),

              Text(
                'تسجيل الدخول مطلوب',
                style: context.headlineSmall14.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 16.h),

              Text(
                description,
                style: context.headlineSmall14.copyWith(
                  color: AppColors.white,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40.h),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primary.withOpacity(0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      // AppRoutes.toCreateAccountScreen();
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      'إنشاء حساب',
                      style: context.headlineSmall14.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
