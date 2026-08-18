import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/modules/services/view/widgets/evaluation_card.dart';

class EvaluationCards extends StatelessWidget {
  const EvaluationCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const EvaluationCard(
          label: 'Workplace cleanliness',
          iconData: Icons.cleaning_services,
        ),
        SizedBox(height: 20.h),
        const EvaluationCard(
          label: 'Work quality',
          iconData: Icons.verified_outlined,
        ),
        SizedBox(height: 20.h),
        const EvaluationCard(label: 'Price', iconData: Icons.money),
      ],
    );
  }
}
