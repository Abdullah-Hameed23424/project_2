import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_images.dart';

class DemoImage extends StatelessWidget {
  const DemoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: 1.sw,
        height: 280.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.fakeLocation),
            fit: BoxFit.cover,
          ),
        ),
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white.withAlpha(120), Colors.black.withAlpha(75)],
          ),
        ),
      ),
    );
  }
}
