import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:feature_based_with_mvvm/core/constants/app_colors.dart';
import 'package:feature_based_with_mvvm/core/constants/app_images.dart';
import 'package:feature_based_with_mvvm/core/constants/dimensions.dart';
import 'package:feature_based_with_mvvm/core/localization/language_constraints.dart';
import 'package:feature_based_with_mvvm/core/theme/app_theme.dart';

class NoData extends StatefulWidget {
  const NoData({super.key});

  @override
  State<NoData> createState() => _NoDataState();
}

class _NoDataState extends State<NoData> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0.1, end: 1).animate(_controller);
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: Dimensions.autoSize(120)),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              return Image.asset(
                AppImages.testImage,
                height:
                    Dimensions.autoSize(120) +
                    (Dimensions.autoSize(7) * _animation.value),
              );
            },
          ),
          const SizedBox(width: double.infinity),
          Text(
            translate('no_data', context),
            style: context.headlineSmall14.copyWith(
              color: AppColors.primaryBase,
            ),
          ),
        ],
      ),
    );
  }
}
