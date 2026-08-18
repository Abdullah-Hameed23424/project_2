import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/modules/orders/view/widgets/order_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                  Tab(text: 'Objections'),
                  Tab(text: 'Guarantees'),
                ],
              ),
            ),
          ],

          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: TabBarView(
              children: <Widget>[
                ListView.separated(
                  itemBuilder: (context, index) => const OrderCard(),
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemCount: 10,
                ),
                const Center(child: Text('Objections')),
                const Center(child: Text('Guarantees')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
