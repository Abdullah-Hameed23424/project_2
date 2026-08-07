import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/routing/navigation_service.dart';

class SigninRequiredDialog extends StatelessWidget {
  const SigninRequiredDialog({super.key});

  static show() {
    showDialog(
      context: NavigationService.navigatorKey.currentContext!,
      barrierDismissible: true,
      builder: (context) => const SigninRequiredDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: ZoomIn(
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(25),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon
              ZoomIn(
                delay: const Duration(milliseconds: 200),
                child: Container(
                  width: 80.w,
                  height: 80.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lock_outline_rounded,
                    size: 40.sp,
                    color: AppColors.primary,
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              Text(
                'تسجيل الدخول مطلوب',
                style: context.headlineSmall14.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 12.h),

              Text(
                'يجب عليك تسجيل الدخول للقيام بهذا الإجراء',
                style: context.headlineSmall14.copyWith(
                  color: AppColors.white,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32.h),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          'إلغاء',
                          style: context.headlineSmall14.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 12.w),

                  // Sign In Button
                  Expanded(
                    child: Container(
                      height: 48.h,
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
                          Navigator.of(context).pop();
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
            ],
          ),
        ),
      ),
    );
  }
}
