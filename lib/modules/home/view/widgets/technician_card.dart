import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/modules/home/view/widgets/action_button.dart';

class TechnicianCard extends StatelessWidget {
  const TechnicianCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.14),
            blurRadius: 18,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          /// Top information
          Row(
            children: <Widget>[
              /// Technician image
              Container(
                width: 52.w,
                height: 52.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.lightBlue, width: 2),
                ),
                child: ClipOval(
                  child: Container(
                    color: AppColors.lightBlue,
                    child: Icon(
                      Icons.person,
                      size: 30.sp,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              /// Name
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Mohammad Mahmoud',
                      style: context.bodyMedium16.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 7.w,
                          height: 7.h,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'Technician is on the way',
                          style: context.bodyMedium16.copyWith(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// ETA
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '8 min',
                    style: context.bodyLarge20.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  Text(
                    'Estimated',
                    style: context.bodyMedium16.copyWith(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 14.h),

          /// Buttons
          Row(
            children: <Widget>[
              Expanded(
                child: ActionButton(
                  icon: Icons.phone_outlined,
                  label: 'Call',
                  onTap: () {},
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: ActionButton(
                  icon: Icons.chat_bubble_outline_rounded,
                  label: 'Chat',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
