import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/core/widgets/try_again.dart';
import 'package:project_2/modules/orders/cubit/orders_cubit.dart';
import 'package:project_2/modules/orders/view/widgets/action_btns.dart';
import 'package:project_2/modules/orders/view/widgets/customer_card.dart';
import 'package:project_2/modules/orders/view/widgets/download_btn.dart';
import 'package:project_2/modules/orders/view/widgets/fee_widget.dart';
import 'package:project_2/modules/orders/view/widgets/invoice_card.dart';
import 'package:project_2/modules/orders/view/widgets/order_info_card.dart';
import 'package:project_2/modules/orders/view/widgets/problem_card.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int orderId;
  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrdersCubit>(
      create: (context) => OrdersCubit()..getOrderDetails(orderId: orderId),
      child: Scaffold(
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
            child: BlocBuilder<OrdersCubit, OrdersState>(
              builder: (context, state) {
                if (state is OrderLoading) {
                  return const AppLoading();
                } else if (state is OrderError) {
                  return TryAgain(
                    onTap: () {
                      context.read<OrdersCubit>().getOrderDetails(
                        orderId: orderId,
                      );
                    },
                    message: state.message,
                  );
                } else if (state is OrderSuccess) {
                  return Column(
                    children: <Widget>[
                      const CustomerCard(),
                      SizedBox(height: 20.h),

                      OrderInfoCard(
                        category: state.orderData.serviceCategoryName,
                        scheduleAt: state.orderData.scheduledAt,
                        status:
                            state.orderData.status.value[0].toUpperCase() +
                            state.orderData.status.value.substring(1),
                      ),
                      SizedBox(height: 20.h),

                      ProblemCard(description: state.orderData.description),
                      SizedBox(height: 20.h),

                      // const InvoiceCard(),
                      FeeWidget(fee: state.orderData.inspectionFee),
                      SizedBox(height: 150.h),

                      const DownloadBtn(),
                      SizedBox(height: 12.h),

                      const ActionBtns(),
                      SizedBox(height: 12.h),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
