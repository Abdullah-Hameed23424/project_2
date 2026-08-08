import 'package:project_2/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/dimensions.dart';
import 'package:project_2/core/widgets/app_loading.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final TextStyle? buttonStyle;
  final Size? size;
  final Color? backgroundColor;
  final BorderSide? border;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final bool isEnabled;
  final double? elevation;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.label,
    this.buttonStyle,
    this.size,
    this.padding,
    this.icon,
    required this.onPressed,
    this.borderRadius,
    this.backgroundColor,
    this.border,
    this.elevation = 2,
    this.isEnabled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const AppLoading()
        : ElevatedButton.icon(
            iconAlignment: IconAlignment.end,
            icon: icon,
            label: Text(
              textAlign: TextAlign.center,
              label,
              style:
                  buttonStyle ??
                  context.bodyLarge20.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            onPressed: isEnabled ? onPressed : null,
            style: ElevatedButton.styleFrom(
              animationDuration: const Duration(milliseconds: 300),
              elevation: elevation,
              minimumSize:
                  size ??
                  Size(
                    MediaQuery.sizeOf(context).width,
                    Dimensions.autoSize(48),
                  ),
              backgroundColor: backgroundColor ?? AppColors.primary,
              disabledBackgroundColor: const Color(0XFFAEAEEA),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                side: border ?? BorderSide.none,
                borderRadius:
                    borderRadius ??
                    BorderRadius.circular(Dimensions.autoSize(50)),
              ),
            ),
          );
  }
}
