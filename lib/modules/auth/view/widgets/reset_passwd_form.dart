import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/constants/app_shadow.dart';
import 'package:project_2/core/constants/app_sizes.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/services/snackbar_service.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/validators/confirm_password_validator.dart';
import 'package:project_2/core/validators/password_validator.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/core/widgets/custom_button.dart';
import 'package:project_2/core/widgets/custom_textfield.dart';
import 'package:project_2/modules/auth/cubit/auth_cubit.dart';
import 'package:project_2/modules/auth/view/screens/reset_passwd_screen.dart';
import 'package:project_2/modules/auth/view/widgets/section_title.dart';

class ResetPasswdForm extends StatelessWidget {
  const ResetPasswdForm({
    super.key,
    required GlobalKey<FormState> resetKey,
    required TextEditingController passwdController,
    required TextEditingController confirmPasswdController,
    required this.widget,
  }) : _resetKey = resetKey,
       _passwdController = passwdController,
       _confirmPasswdController = confirmPasswdController;

  final GlobalKey<FormState> _resetKey;
  final TextEditingController _passwdController;
  final TextEditingController _confirmPasswdController;
  final ResetPasswdScreen widget;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -55),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingH),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.paddingH,
            vertical: AppSizes.paddingV,
          ),
          decoration: BoxDecoration(
            color: AppColors.bgWhite,
            borderRadius: BorderRadius.circular(AppSizes.mediumRadius),
            boxShadow: AppShadow.cardShadow,
          ),
          child: Form(
            key: _resetKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FadeInLeft(
                  delay: AppPeriods.animationDelay(2),
                  child: Text(
                    'New Password',
                    style: context.headlineLarge30.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: AppSizes.tinySpace),
                FadeInLeft(
                  delay: AppPeriods.animationDelay(3),
                  child: Text(
                    'Please enter your new password',
                    style: context.bodyLarge20,
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: AppSizes.largeSpace),
                FadeInLeft(
                  delay: AppPeriods.animationDelay(4),
                  child: const SectionTitle(title: 'Password'),
                ),
                FadeInLeft(
                  delay: AppPeriods.animationDelay(5),
                  child: CustomTextField(
                    controller: _passwdController,
                    hintText: '••••••••',
                    radius: AppSizes.mediumRadius,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                    validator: PasswordValidator.validate,
                  ),
                ),

                SizedBox(height: AppSizes.mediumSpace),

                FadeInLeft(
                  delay: AppPeriods.animationDelay(5),
                  child: const SectionTitle(title: 'Confirm Password'),
                ),
                FadeInLeft(
                  delay: AppPeriods.animationDelay(6),
                  child: CustomTextField(
                    controller: _confirmPasswdController,
                    hintText: '••••••••',
                    radius: AppSizes.mediumRadius,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                    validator: (confirmedPasswd) =>
                        ConfirmPasswordValidator.validate(
                          confirmedPasswd,
                          _passwdController.text,
                        ),
                  ),
                ),

                SizedBox(height: AppSizes.xLargeSpace),
                BlocProvider(
                  create: (context) => AuthCubit(),
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is ResetPasswdError) {
                        snackBarService.showError(message: state.message);
                      } else if (state is ResetPasswdSuccess) {
                        snackBarService.showSuccess(
                          message: 'Reset password has been done successfully',
                        );
                        AppRoutes.toLoginScreen();
                      }
                    },
                    builder: (context, state) {
                      final AuthCubit cubit = context.read<AuthCubit>();
                      if (state is ResetPasswdLoading) {
                        return const AppLoading();
                      }
                      return FadeInLeft(
                        delay: AppPeriods.animationDelay(7),
                        child: CustomButton(
                          label: 'Reset',
                          onPressed: () {
                            if (!_resetKey.currentState!.validate()) return;
                            FocusScope.of(context).unfocus();
                            cubit.resetPasswd(
                              phoneNumber: widget.phoneNumber,
                              ticket: widget.ticket,
                              passwd: _passwdController.text.trim(),
                              confirmPasswd: _confirmPasswdController.text
                                  .trim(),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
