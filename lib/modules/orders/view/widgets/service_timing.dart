import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/custom_button.dart';

class ServiceTiming extends StatelessWidget {
  final ValueNotifier<String> type;
  const ServiceTiming({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade500),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ValueListenableBuilder<String>(
        valueListenable: type,
        builder: (context, value, child) {
          return Row(
            children: <Widget>[
              Expanded(
                child: CustomButton(
                  label: 'Urgent',
                  borderRadius: BorderRadius.circular(12.r),
                  onPressed: () {
                    type.value = 'urgent';
                  },
                  backgroundColor: (value == 'urgent')
                      ? AppColors.lightBlue
                      : Colors.transparent,
                  buttonStyle: context.bodyLarge20,
                  elevation: 0,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: CustomButton(
                  label: 'By Appointment',
                  borderRadius: BorderRadius.circular(12.r),
                  onPressed: () {
                    type.value = 'by_appointment';
                  },
                  backgroundColor: (value == 'by_appointment')
                      ? AppColors.lightBlue
                      : Colors.transparent,
                  buttonStyle: context.bodyLarge20,
                  elevation: 0,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
