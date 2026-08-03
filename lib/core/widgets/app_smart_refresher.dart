import 'package:project_2/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppSmartRefresher extends StatelessWidget {
  final RefreshController controller;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;
  final Widget? child;
  final bool enablePullDown;
  final bool enablePullUp;
  final Widget? footer;
  final Widget? header;

  const AppSmartRefresher({
    super.key,
    required this.controller,
    this.onRefresh,
    this.onLoading,
    this.child,
    this.enablePullDown = true,
    this.enablePullUp = true,
    this.footer,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller,
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      onRefresh: onRefresh,
      onLoading: onLoading,
      header: header ?? const WaterDropHeader(),
      footer:
          footer ??
          CustomFooter(
            builder: (context, mode) {
              if (mode == LoadStatus.noMore) {
                return SizedBox(
                  height: 50.h,
                  child: Center(
                    child: Text(
                      'لا يوجد المزيد...',
                      style: context.headlineSmall14.copyWith(
                        color: AppColors.primaryBase,
                      ),
                    ),
                  ),
                );
              }
              return SizedBox(height: 50.h, child: const AppLoading());
            },
          ),
      child: child,
    );
  }
}
