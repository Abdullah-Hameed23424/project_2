import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/validators/confirm_password_validator.dart';
import 'package:project_2/core/validators/full_name_validator.dart';
import 'package:project_2/core/validators/password_validator.dart';
import 'package:project_2/core/widgets/custom_textfield.dart';
import 'package:project_2/modules/auth/view/widgets/section_title.dart';

class CompleteSignUpInfoForm extends StatelessWidget {
  final GlobalKey<FormState> completeInfoKey;
  final TextEditingController fullNameController;
  final TextEditingController passwdController;
  final TextEditingController confirmPasswdController;
  const CompleteSignUpInfoForm({
    super.key,
    required this.completeInfoKey,
    required this.fullNameController,
    required this.passwdController,
    required this.confirmPasswdController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: completeInfoKey,
      child: Column(
        children: <Widget>[
          FadeInLeft(
            delay: AppPeriods.animationDelay(3),
            child: SectionTitle(title: translate('full_name_label', context)),
          ),
          FadeInLeft(
            delay: AppPeriods.animationDelay(4),
            child: CustomTextField(
              controller: fullNameController,
              hintText: 'ex: Mohammad Al....',
              radius: 12.r,
              keyboardType: TextInputType.name,
              validator: FullNameValidator.validate,
              prefixIcon: const Icon(Icons.person_outline),
            ),
          ),

          SizedBox(height: 20.h),

          FadeInLeft(
            delay: AppPeriods.animationDelay(5),
            child: SectionTitle(title: translate('passwd_label', context)),
          ),
          FadeInLeft(
            delay: AppPeriods.animationDelay(6),
            child: CustomTextField(
              controller: passwdController,
              hintText: '........',
              radius: 12.r,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) => PasswordValidator.validate(value),
              prefixIcon: const Icon(Icons.lock_outline),
              isPassword: true,
            ),
          ),

          SizedBox(height: 20.h),

          FadeInLeft(
            delay: AppPeriods.animationDelay(7),
            child: SectionTitle(
              title: translate('confirm_passwd_label', context),
            ),
          ),
          FadeInLeft(
            delay: AppPeriods.animationDelay(8),
            child: CustomTextField(
              controller: confirmPasswdController,
              hintText: '........',
              radius: 12.r,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) => ConfirmPasswordValidator.validate(
                value,
                passwdController.text.trim(),
              ),
              prefixIcon: const Icon(Icons.lock_clock_outlined),
              isPassword: true,
            ),
          ),
        ],
      ),
    );
  }
}
