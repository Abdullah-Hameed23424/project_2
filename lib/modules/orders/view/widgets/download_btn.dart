import 'package:flutter/material.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/custom_button.dart';

class DownloadBtn extends StatelessWidget {
  const DownloadBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      label: 'Download Invoice PDF',
      onPressed: () {},
      backgroundColor: AppColors.white,
      border: const BorderSide(width: 1, color: AppColors.primary),
      buttonStyle: context.bodyLarge20.copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
