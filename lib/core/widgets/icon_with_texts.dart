import 'package:flutter/material.dart';
import 'package:feature_based_with_mvvm/core/constants/dimensions.dart';
import 'package:feature_based_with_mvvm/core/theme/app_theme.dart';

class IconWithTexts extends StatelessWidget {
  final Color? cardColor;
  final Widget? child;
  final String title;
  final String subTitle;

  const IconWithTexts({
    super.key,
    this.cardColor,
    required this.child,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.autoSize(16),
        vertical: Dimensions.autoSize(16),
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(Dimensions.autoSize(8)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: CircleAvatar(
              backgroundColor: const Color(0xffffffff),
              child: child,
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.headlineSmall14.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: Dimensions.autoSize(4)),
                Text(subTitle, style: context.headlineSmall14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
