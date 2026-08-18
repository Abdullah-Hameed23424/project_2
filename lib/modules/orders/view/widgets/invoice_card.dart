import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/modules/orders/view/widgets/invoice_row.dart';

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: <Color>[AppColors.lightBlue, AppColors.white],
          stops: <double>[0.05, 0.3],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const <BoxShadow>[
          BoxShadow(offset: Offset.zero, color: Colors.black12, blurRadius: 8),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.receipt_long_outlined,
                size: 25.sp,
                color: const Color(0xFF245DC4),
              ),
              SizedBox(width: 6.w),
              Text('Invoice Details', style: context.bodyLarge20),
            ],
          ),

          SizedBox(height: 20.h),
          const InvoiceRow(title: 'Inspection fees', value: '50 S.P'),

          SizedBox(height: 10.h),
          const InvoiceRow(title: 'Service Start', value: '150 S.P'),

          SizedBox(height: 10.h),
          const InvoiceRow(title: 'Spare Parts', value: '200 S.P'),

          SizedBox(height: 20.h),
          const Divider(color: Color(0xFFD8DCEC), height: 1),
          SizedBox(height: 20.h),

          const InvoiceRow(title: 'Total', value: '400 S.P', isTotal: true),
        ],
      ),
    );
  }
}
