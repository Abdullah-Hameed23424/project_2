import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/api/api_endpoints.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/core/widgets/no_data.dart';
import 'package:project_2/core/widgets/try_again.dart';
import 'package:project_2/modules/orders/cubit/orders_cubit.dart';
import 'package:project_2/modules/orders/models/order_data.dart';
import 'package:project_2/modules/orders/view/widgets/order_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              systemOverlayStyle: AppStatusBarTheme.lightnessStatusBar,
              title: Text(
                'Orders',
                style: context.titleSmall26.copyWith(
                  fontWeight: FontWeight.normal,
                  color: AppColors.black,
                ),
              ),
              pinned: false,
            ),

            SliverAppBar(
              pinned: true,
              toolbarHeight: 0,
              systemOverlayStyle: AppStatusBarTheme.lightnessStatusBar,
              surfaceTintColor: AppColors.lightBlue,
              backgroundColor: Colors.white,
              bottom: TabBar(
                dividerColor: Colors.grey.shade200,
                indicator: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                indicatorPadding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 6.h,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabAlignment: TabAlignment.fill,
                labelStyle: context.bodyLarge20.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                tabs: const <Widget>[
                  Tab(text: 'Orders'),
                  Tab(text: 'Guarantees'),
                ],
              ),
            ),
          ],

          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: TabBarView(
              children: <Widget>[
                BlocProvider<OrdersCubit>(
                  create: (context) =>
                      OrdersCubit()..getOrders(endpoint: ApiEndpoints.orders),
                  child: BlocBuilder<OrdersCubit, OrdersState>(
                    builder: (context, state) {
                      if (state is OrdersLoading) {
                        return const AppLoading();
                      } else if (state is OrdersError) {
                        return TryAgain(
                          onTap: () {
                            context.read<OrdersCubit>().getOrders(
                              endpoint: ApiEndpoints.orders,
                            );
                          },
                          message: state.message,
                        );
                      } else if (state is OrdersSuccess) {
                        if (state.orderResponse.data.isEmpty) {
                          return const NoData();
                        }

                        return ListView.separated(
                          itemBuilder: (context, index) {
                            final OrderData order =
                                state.orderResponse.data[index];
                            return OrderCard(order: order);
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10.h),
                          itemCount: state.orderResponse.data.length,
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                BlocProvider<OrdersCubit>(
                  create: (context) => OrdersCubit()
                    ..getOrders(
                      endpoint: ApiEndpoints.warranties,
                      filter: 'claimed',
                    ),
                  child: BlocBuilder<OrdersCubit, OrdersState>(
                    builder: (context, state) {
                      if (state is OrdersLoading) {
                        return const AppLoading();
                      } else if (state is OrdersError) {
                        return TryAgain(
                          onTap: () {
                            context.read<OrdersCubit>().getOrders(
                              endpoint: ApiEndpoints.warranties,
                              filter: 'claimed',
                            );
                          },
                          message: state.message,
                        );
                      } else if (state is OrdersSuccess) {
                        if (state.orderResponse.data.isEmpty) {
                          return const NoData();
                        }

                        return ListView.separated(
                          itemBuilder: (context, index) {
                            final OrderData order =
                                state.orderResponse.data[index];
                            return OrderCard(order: order);
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10.h),
                          itemCount: state.orderResponse.data.length,
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
