import 'package:flutter/material.dart';
import 'package:feature_based_with_mvvm/core/constants/dimensions.dart';

class StarsReviewWidget extends StatelessWidget {
  final int starsEnabled;
  final Color? diableColor;
  final Color? disabledBorderColor;
  const StarsReviewWidget({
    super.key,
    required this.starsEnabled,
    required this.diableColor,
    required this.disabledBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// <Stars> <enabled>
        /// النجوم المطابقة للتقيم
        ...List.generate(
          starsEnabled,
          (index) => ShaderMask(
            shaderCallback: (Rect bounds) {
              return const RadialGradient(
                colors: [Color(0xffF4C431), Color(0xffFBEAB5)],
              ).createShader(bounds);
            },
            child: Icon(
              Icons.star,
              size: Dimensions.autoSize(22.5),
              color: Colors.white,
              shadows: const [
                Shadow(blurRadius: 4, color: Color.fromARGB(255, 255, 197, 25)),
              ],
            ),
          ),
        ),

        /// <Stars> <enabled>
        ...List.generate(
          5 - starsEnabled,
          (index) => Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Icon(
                  Icons.star,
                  size: Dimensions.autoSize(22.5),
                  color: disabledBorderColor,
                ),
              ),
              Center(
                child: Icon(
                  Icons.star,
                  size: Dimensions.autoSize(15),
                  color: diableColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
