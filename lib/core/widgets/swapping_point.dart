import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/dimensions.dart';

class SwappingPoints extends StatefulWidget {
  const SwappingPoints({
    super.key,
    required this.length,
    required this.pageController,
    this.activeColor,
  });

  final PageController pageController;
  final int length;
  final Color? activeColor;

  @override
  State<SwappingPoints> createState() => _SwappingPointsState();
}

class _SwappingPointsState extends State<SwappingPoints> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      final int page = widget.pageController.page?.round() ?? 0;
      if (page != currentIndex) {
        setState(() {
          currentIndex = page;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.length,
        (index) => InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            widget.pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.linear,
            padding: const EdgeInsets.all(2),
            width: index == currentIndex
                ? Dimensions.autoSize(20)
                : Dimensions.autoSize(4),
            height: Dimensions.autoSize(4),
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              color: index == currentIndex
                  ? (widget.activeColor ?? AppColors.primary)
                  : AppColors.white,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
