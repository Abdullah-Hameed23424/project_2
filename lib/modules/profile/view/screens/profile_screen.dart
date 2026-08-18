import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/modules/profile/view/widgets/logout_tile.dart';
import 'package:project_2/modules/profile/view/widgets/main_info_card.dart';
import 'package:project_2/modules/profile/view/widgets/profile_option.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        systemOverlayStyle: AppStatusBarTheme.lightnessStatusBar,
        title: Text(
          translate('profile.title', context),
          style: context.titleSmall26.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const MainInfoCard(),
              SizedBox(height: 20.h),
              const ProfileOption(),
              SizedBox(height: 20.h),
              const LogoutTile(),
              SizedBox(height: 20.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red.withAlpha(25),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12.r),
                  ),
                  splashColor: Colors.red.withAlpha(40),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  leading: const Icon(Icons.delete_outline, color: Colors.red),
                  title: Text(
                    translate('profile.delete_account_tile_label', context),
                    style: const TextStyle(color: Colors.red),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
