import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';

class BalanceWidget extends StatelessWidget {
  final Widget child;
  const BalanceWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.all(12.h),
      height: 200.h,
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Transform(
              transform: Matrix4.rotationZ(75),
              child: Icon(
                Icons.attach_money_outlined,
                size: 100.sp,
                color: AppColors.primary.withAlpha(100),
              ),
            ),
          ),
          Positioned.fill(
            child: Transform.rotate(
              angle: 75,
              child: Transform.translate(
                offset: const Offset(-50, -75),
                child: Icon(
                  Icons.attach_money_outlined,
                  size: 75.sp,
                  color: AppColors.primary.withAlpha(100),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Transform.rotate(
              angle: 75,
              child: Transform.translate(
                offset: const Offset(-50, 75),
                child: Icon(
                  Icons.attach_money_outlined,
                  size: 89.sp,
                  color: AppColors.primary.withAlpha(100),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Transform.rotate(
              angle: 75,
              child: Transform.translate(
                offset: const Offset(50, 75),
                child: Icon(
                  Icons.attach_money_outlined,
                  size: 89.sp,
                  color: AppColors.primary.withAlpha(100),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Transform.rotate(
              angle: 75,
              child: Transform.translate(
                offset: const Offset(-160, 25),
                child: Icon(
                  Icons.attach_money_outlined,
                  size: 120.sp,
                  color: AppColors.primary.withAlpha(100),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Transform.rotate(
              angle: 75,
              child: Transform.translate(
                offset: const Offset(160, 25),
                child: Icon(
                  Icons.attach_money_outlined,
                  size: 60.sp,
                  color: AppColors.primary.withAlpha(100),
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
