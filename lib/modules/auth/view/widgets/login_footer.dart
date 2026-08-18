import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/theme/app_theme.dart';

class LoginFooter extends StatefulWidget {
  const LoginFooter({super.key});

  @override
  State<LoginFooter> createState() => _LoginFooterState();
}

class _LoginFooterState extends State<LoginFooter> {
  late final TapGestureRecognizer _signUpRecognizer;

  @override
  void initState() {
    super.initState();

    _signUpRecognizer = TapGestureRecognizer()..onTap = _goToSignUpScreen;
  }

  void _goToSignUpScreen() {
    AppRoutes.toSignUpScreen();
  }

  @override
  void dispose() {
    _signUpRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: AppPeriods.animationDelay(10),
      child: Text.rich(
        style: context.bodyMedium16,
        TextSpan(
          children: <InlineSpan>[
            TextSpan(text: translate('login.sign_up_q', context)),
            TextSpan(
              text: translate('login.sign_up_a', context),
              style: context.bodyMedium16.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
              recognizer: _signUpRecognizer,
            ),
          ],
        ),
      ),
    );
  }
}
