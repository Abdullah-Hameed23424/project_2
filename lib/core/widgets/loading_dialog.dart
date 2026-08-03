import 'package:feature_based_with_mvvm/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:feature_based_with_mvvm/core/constants/app_colors.dart';
import 'package:feature_based_with_mvvm/core/constants/dimensions.dart';

import 'dart:ui';

import 'package:feature_based_with_mvvm/core/routing/app_routes.dart';
import 'package:feature_based_with_mvvm/core/routing/navigation_service.dart';

class LoadingDialog extends StatefulWidget {
  const LoadingDialog({super.key});
  static void hide(GlobalKey<LoadingDialogState> key) {
    if (key.currentState != null) {
      AppRoutes.goBack();
    }
  }

  static void show(GlobalKey<LoadingDialogState> key) {
    showDialog(
      context: NavigationService.navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => LoadingDialog(key: key),
    );
  }

  @override
  State<LoadingDialog> createState() => LoadingDialogState();
}

class LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return const Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: LoadingDialogWidget(),
    );
  }
}

class LoadingDialogWidget extends StatelessWidget {
  const LoadingDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Center(
        child: Container(
          width: Dimensions.autoSize(150),
          height: Dimensions.autoSize(150),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Dimensions.autoSize(40),
                height: Dimensions.autoSize(40),
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primaryBase,
                  ),
                ),
              ),
              SizedBox(height: Dimensions.autoSize(15)),
              Text(
                'Loading...',
                textAlign: TextAlign.center,
                style: context.headlineSmall14.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
