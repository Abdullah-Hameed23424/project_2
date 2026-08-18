import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';

class ServiceMenu extends StatelessWidget {
  const ServiceMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownMenu(
        width: 1.sw - 32.w,
        hintText: 'Location',
        leadingIcon: const Icon(Icons.location_on_outlined),
        textStyle: context.bodyMedium16,
        menuStyle: const MenuStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: '', label: 'Home'),
          DropdownMenuEntry(value: '', label: 'Home'),
          DropdownMenuEntry(value: '', label: 'Home'),
        ],
      ),
    );
  }
}
