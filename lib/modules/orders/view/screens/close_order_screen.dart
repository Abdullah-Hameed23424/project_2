import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/custom_button.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/modules/orders/view/widgets/order_closure_number_card.dart';

class CloseOrderScreen extends StatelessWidget {
  const CloseOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: AppStatusBarTheme.lightnessStatusBar,
        leading: const PopButton(color: AppColors.black),
        title: Text(
          'Close Order',
          style: context.titleSmall26.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  child: Column(
                    children: <Widget>[
                      const OrderClosureNumberCard(),

                      const Spacer(),

                      Text(
                        'Hasn\'t the fault been fixed?',
                        style: context.bodyMedium16.copyWith(
                          color: AppColors.black,
                        ),
                      ),

                      SizedBox(height: 10.h),

                      CustomButton(
                        label: 'Submitting Objection',
                        onPressed: () {},
                        backgroundColor: AppColors.errorColor,
                      ),

                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
