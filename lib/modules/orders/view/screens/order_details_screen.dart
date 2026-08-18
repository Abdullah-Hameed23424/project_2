import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/modules/orders/view/widgets/action_btns.dart';
import 'package:project_2/modules/orders/view/widgets/customer_card.dart';
import 'package:project_2/modules/orders/view/widgets/download_btn.dart';
import 'package:project_2/modules/orders/view/widgets/invoice_card.dart';
import 'package:project_2/modules/orders/view/widgets/order_info_card.dart';
import 'package:project_2/modules/orders/view/widgets/problem_card.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int orderId;
  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: AppStatusBarTheme.lightnessStatusBar,
        leading: const PopButton(color: AppColors.black),
        title: Text(
          'Order Details',
          style: context.titleSmall26.copyWith(fontWeight: FontWeight.normal),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            children: <Widget>[
              const CustomerCard(),
              SizedBox(height: 20.h),

              const OrderInfoCard(),
              SizedBox(height: 20.h),

              const ProblemCard(),
              SizedBox(height: 20.h),

              const InvoiceCard(),
              SizedBox(height: 20.h),

              const DownloadBtn(),
              SizedBox(height: 12.h),

              const ActionBtns(),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
