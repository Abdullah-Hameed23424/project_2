import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:feature_based_with_mvvm/core/constants/app_colors.dart';
import 'package:feature_based_with_mvvm/core/theme/app_theme.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLengthFirstly;
  final TextStyle? textStyle;
  final TextStyle? actionTextStyle;
  final TextAlign textAlign;
  final String readMoreLabel;
  final String readLessLabel;

  const ReadMoreText({
    super.key,
    required this.text,
    this.maxLengthFirstly = 150,
    this.textStyle,
    this.actionTextStyle,
    this.textAlign = TextAlign.start,
    this.readMoreLabel = 'Read more',
    this.readLessLabel = 'Read less',
  });

  @override
  ReadMoreTextState createState() => ReadMoreTextState();
}

class ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.text;
    final maxLength = widget.maxLengthFirstly;

    final baseTextStyle =
        widget.textStyle ??
        context.headlineSmall14.copyWith(
          height: 1.4,
          fontSize: 14.sp,
          color: AppColors.black,
        );

    final actionStyle =
        widget.actionTextStyle ??
        baseTextStyle.copyWith(
          color: AppColors.primaryBase,
          fontWeight: FontWeight.bold,
        );

    var firstHalf = '';
    var secondHalf = '';

    if (text.length > maxLength) {
      firstHalf = text.substring(0, maxLength);
      secondHalf = text.substring(maxLength, text.length);
    } else {
      firstHalf = text;
    }

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: RichText(
        textAlign: widget.textAlign,
        text: TextSpan(
          style: baseTextStyle,
          children: <TextSpan>[
            TextSpan(text: firstHalf),
            if (isExpanded) TextSpan(text: secondHalf, style: baseTextStyle),
            if (!isExpanded && secondHalf.isNotEmpty)
              const TextSpan(text: '... '),
            if (!isExpanded && secondHalf.isNotEmpty)
              TextSpan(
                text: widget.readMoreLabel,
                style: actionStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      isExpanded = true;
                    });
                  },
              ),
            if (isExpanded) const TextSpan(text: ' '),
            if (isExpanded)
              TextSpan(
                text: widget.readLessLabel,
                style: actionStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      isExpanded = false;
                    });
                  },
              ),
          ],
        ),
      ),
    );
  }
}
