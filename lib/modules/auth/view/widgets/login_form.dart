import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/services/snackbar_service.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/constants/app_shadow.dart';
import 'package:project_2/core/validators/password_validator.dart';
import 'package:project_2/core/validators/phone_validator.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/core/widgets/custom_button.dart';
import 'package:project_2/core/widgets/custom_textfield.dart';
import 'package:project_2/modules/auth/cubit/auth_cubit.dart';
import 'package:project_2/modules/auth/view/widgets/phone_number_prefix.dart';
import 'package:project_2/modules/auth/view/widgets/section_title.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required GlobalKey<FormState> loginKey,
    required TextEditingController phoneController,
    required this.isoCode,
    required this.countryCode,
    required TextEditingController passwordController,
  }) : _loginKey = loginKey,
       _phoneController = phoneController,
       _passwordController = passwordController;

  final GlobalKey<FormState> _loginKey;
  final TextEditingController _phoneController;
  final ValueNotifier<IsoCode> isoCode;
  final ValueNotifier<String> countryCode;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -50),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.bgWhite,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: AppShadow.cardShadow,
          ),
          child: Form(
            key: _loginKey,
            child: Column(
              children: <Widget>[
                FadeInLeft(
                  delay: AppPeriods.animationDelay(3),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      translate('login.title', context),
                      style: context.titleSmall26,
                    ),
                  ),
                ),

                SizedBox(height: 35.h),

                FadeInLeft(
                  delay: AppPeriods.animationDelay(4),
                  child: SectionTitle(title: translate('phone_label', context)),
                ),
                FadeInLeft(
                  delay: AppPeriods.animationDelay(5),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: CustomTextField(
                      controller: _phoneController,
                      hintText: '9XX XXX XXX',
                      radius: 12.r,
                      keyboardType: TextInputType.phone,
                      validator: (value) => PhoneValidator.validate(
                        value,
                        country: isoCode.value,
                      ),
                      prefixIcon: PhoneNumberPrefix(
                        countryCode: countryCode,
                        isoCode: isoCode,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                FadeInLeft(
                  delay: AppPeriods.animationDelay(6),
                  child: SectionTitle(
                    title: translate('passwd_label', context),
                  ),
                ),
                FadeInLeft(
                  delay: AppPeriods.animationDelay(7),
                  child: CustomTextField(
                    controller: _passwordController,
                    hintText: '••••••••',
                    radius: 12.r,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                    validator: PasswordValidator.validate,
                  ),
                ),

                FadeInLeft(
                  delay: AppPeriods.animationDelay(8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: AppRoutes.toForgetPasswdScreen,
                      style: TextButton.styleFrom(
                        overlayColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                      ),
                      child: Text(
                        translate('login.forget_passwd_text', context),
                        style: context.bodyMedium16.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                FadeInLeft(
                  delay: AppPeriods.animationDelay(9),
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LoginError) {
                        snackBarService.showError(message: state.message);
                      } else if (state is LoginSuccess) {
                        snackBarService.showSuccess(
                          message: translate('login.snack_success', context),
                        );
                        AppRoutes.toNavBarScreen();
                      }
                    },
                    builder: (context, state) {
                      final AuthCubit cubit = context.read<AuthCubit>();
                      if (state is LoginLoading) {
                        return const AppLoading();
                      }
                      return CustomButton(
                        label: translate('login.title', context),
                        onPressed: () {
                          if (!_loginKey.currentState!.validate()) return;

                          cubit.login(
                            phoneNumber:
                                countryCode.value +
                                _phoneController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                        },
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
