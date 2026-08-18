import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/read_more_text.dart';

class ProblemCard extends StatelessWidget {
  const ProblemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.info_outline_rounded,
              size: 25.sp,
              color: const Color(0xFF245DC4),
            ),
            SizedBox(width: 5.w),
            Text('Problem description', style: context.bodyLarge20),
          ],
        ),

        SizedBox(height: 8.h),

        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: AppColors.lightBlue.withAlpha(100),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: ReadMoreText(
            text:
                'The car is not running properly; there is an engine problem, and I need a comprehensive inspection and repair of the fault.',
            textStyle: context.bodyMedium16,
            maxLengthFirstly: 100,
          ),
        ),
      ],
    );
  }
}
