import 'package:flutter/material.dart';
import 'package:feature_based_with_mvvm/core/widgets/app_shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    super.key,
    required this.height,
    required this.width,
    this.margin,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
  });
  final double height, width;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final Color? baseColor, highlightColor;

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
