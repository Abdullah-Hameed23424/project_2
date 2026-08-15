import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/custom_textfield.dart';
import 'package:project_2/core/widgets/pop_button.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {'name': 'AC Maintenance', 'icon': Icons.ac_unit_outlined},
      {'name': 'Plumbing', 'icon': Icons.plumbing_outlined},
      {'name': 'Electrical', 'icon': Icons.electrical_services_outlined},
      {'name': 'Carpentry', 'icon': Icons.handyman_outlined},
      {'name': 'Painting', 'icon': Icons.format_paint_outlined},
      {'name': 'Cleaning', 'icon': Icons.cleaning_services_outlined},
    ];

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: AppStatusBarTheme.lightnessStatusBar,
        leading: const PopButton(color: AppColors.primaryDark),
        title: Text(
          'Category Name',
          style: context.titleSmall26.copyWith(fontWeight: FontWeight.normal),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            /// Search
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: CustomTextField(
                  radius: 12.r,
                  controller: TextEditingController(),
                  hintText: 'Search service...',
                  prefixIcon: const Icon(Icons.search),
                  color: AppColors.lightBlue.withValues(alpha: 0.35),
                ),
              ),
            ),

            /// Services
            SliverList.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];

                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withAlpha(125),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 48.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.25),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            service['icon'] as IconData,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: Text(
                            service['name'] as String,
                            style: context.bodyMedium16.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16.sp,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
