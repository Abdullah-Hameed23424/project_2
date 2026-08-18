import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/widgets/custom_button.dart';

class ActionBtns extends StatelessWidget {
  const ActionBtns({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: CustomButton(label: 'Warranty', onPressed: () {}),
        ),

        SizedBox(width: 8.w),

        Expanded(
          child: CustomButton(label: 'Sponsorship', onPressed: () {}),
        ),
      ],
    );
  }
}
