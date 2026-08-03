import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWithTexture extends StatelessWidget {
  final double width;
  final Color borderColor;
  final String imagePath;
  final Widget child;
  final GestureTapCallback onTap;
  final double verticalPadding;
  const ButtonWithTexture({
    super.key,
    required this.width,
    required this.borderColor,
    required this.imagePath,
    required this.child,
    required this.onTap,
    this.verticalPadding = 10,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: verticalPadding.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: borderColor,
            ),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: child,
        ),
      ),
    );
  }
}
