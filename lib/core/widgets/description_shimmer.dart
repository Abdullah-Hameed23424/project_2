import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:feature_based_with_mvvm/core/widgets/app_shimmer.dart';

class DescriptionShimmer extends StatelessWidget {
  const DescriptionShimmer({super.key, required this.linesNumber, this.width});
  final int linesNumber;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          linesNumber,
          (index) => AppShimmer(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 7.h),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2),
              ),
              height: 10,
              width: 1.sw - (index * 70.w),
            ),
          ),
        ),
      ),
    );
  }
}
