import 'package:flutter/material.dart';
import 'package:project_2/core/constants/dimensions.dart';
import 'package:project_2/core/constants/app_images.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/widgets/custom_button.dart';

class TryAgain extends StatelessWidget {
  const TryAgain({
    super.key,
    required this.onTap,
    required this.message,
    this.small = false,
    this.title,
    this.textStyle,
    this.withImage = true,
  });

  final VoidCallback onTap;
  final String message;
  final bool small;
  final TextStyle? textStyle;
  final String? title;
  final bool withImage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            withImage
                ? Image.asset(
                    AppImages.testImage,
                    width: small
                        ? Dimensions.autoSize(125)
                        : Dimensions.autoSize(215),
                  )
                : const SizedBox(),
            SizedBox(
              height: small ? Dimensions.autoSize(8) : Dimensions.autoSize(35),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.autoSize(20),
              ),
              child: Text(
                title ?? message,
                textAlign: TextAlign.center,
                maxLines: 3,
                style:
                    textStyle ??
                    TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF00376A),
                      fontSize: Dimensions.autoSize(14),
                    ),
              ),
            ),
            SizedBox(
              height: small ? Dimensions.autoSize(14) : Dimensions.autoSize(35),
            ),
            CustomButton(
              onPressed: onTap,
              label: translate('try_again', context),
              size: Size(
                MediaQuery.of(context).size.width * 0.6,
                Dimensions.autoSize(50),
              ),
              borderRadius: BorderRadius.circular(Dimensions.autoSize(12)),
              buttonStyle: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: Dimensions.autoSize(14),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
