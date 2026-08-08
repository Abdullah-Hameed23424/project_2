import 'package:flutter/material.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/dimensions.dart';

class PopButton extends StatelessWidget {
  const PopButton({
    super.key,
    this.iconColor,
    this.onTap,
    this.color = AppColors.white,
  });

  final Color? iconColor;
  final VoidCallback? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        color: iconColor ?? color,
        size: Dimensions.autoSize(20),
      ),
      onPressed: () {
        if (onTap != null) {
          onTap!();
          return;
        }
        final navigator = Navigator.of(context, rootNavigator: true);
        if (navigator.canPop()) {
          navigator.pop();
        } else {
          Navigator.of(context).pop();
        }
      },
    );
  }
}
