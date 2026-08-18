import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/theme/app_status_bar_theme.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/custom_button.dart';
import 'package:project_2/core/widgets/custom_textfield.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/modules/services/view/widgets/evaluation_cards.dart';
import 'package:project_2/modules/services/view/widgets/service_evaluation_header.dart';

class ServiceEvaluation extends StatefulWidget {
  const ServiceEvaluation({super.key});

  @override
  State<ServiceEvaluation> createState() => _ServiceEvaluationState();
}

class _ServiceEvaluationState extends State<ServiceEvaluation> {
  late final GlobalKey<FormState> evaluateKey;
  late final TextEditingController additionalNotesController;

  @override
  void initState() {
    evaluateKey = GlobalKey<FormState>();
    additionalNotesController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: AppStatusBarTheme.lightnessStatusBar,
        leading: const PopButton(color: AppColors.black),
        title: Text(
          'Service Evaluation',
          style: context.titleSmall26.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  child: Column(
                    children: <Widget>[
                      const ServiceEvaluationHeader(),

                      SizedBox(height: 20.h),
                      const EvaluationCards(),

                      SizedBox(height: 20.h),
                      const Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text('Additional Notes(Optional)'),
                      ),
                      Form(
                        key: evaluateKey,
                        child: CustomTextField(
                          controller: additionalNotesController,
                          keyboardType: TextInputType.text,
                          radius: 12.r,
                          maxLines: 7,
                          hintText:
                              'Share the details of your experience with us...',
                        ),
                      ),

                      SizedBox(height: 40.h),
                      CustomButton(label: 'Submit rating', onPressed: () {}),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
