import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/constants/app_shadow.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/services/snackbar_service.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/validators/phone_validator.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/core/widgets/custom_button.dart';
import 'package:project_2/core/widgets/custom_textfield.dart';
import 'package:project_2/modules/auth/cubit/auth_cubit.dart';
import 'package:project_2/modules/auth/view/screens/helper/otp_type.dart';
import 'package:project_2/modules/auth/view/widgets/phone_number_prefix.dart';
import 'package:project_2/modules/auth/view/widgets/section_title.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required GlobalKey<FormState> signUpKey,
    required TextEditingController phoneController,
    required this.isoCode,
    required this.countryCode,
  }) : _signUpKey = signUpKey,
       _phoneController = phoneController;

  final GlobalKey<FormState> _signUpKey;
  final TextEditingController _phoneController;
  final ValueNotifier<IsoCode> isoCode;
  final ValueNotifier<String> countryCode;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -50),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.bgWhite,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: AppShadow.cardShadow,
          ),
          child: Form(
            key: _signUpKey,
            child: Column(
              children: <Widget>[
                FadeInLeft(
                  delay: AppPeriods.animationDelay(3),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      translate('sign_up.title', context),
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

                SizedBox(height: 5.h),
                FadeInLeft(
                  delay: AppPeriods.animationDelay(6),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      translate('sign_up.screen_hint', context),
                      style: context.bodyMedium16.copyWith(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 45.h),
                FadeInLeft(
                  delay: AppPeriods.animationDelay(7),
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is SignUpError) {
                        snackBarService.showError(message: state.message);
                      } else if (state is SignUpSuccess) {
                        snackBarService.showSuccess(
                          message: translate(
                            'forget_passwd.snack_success',
                            context,
                          ),
                        );
                        AppRoutes.toOtpScreen(
                          phoneNumber:
                              countryCode.value + _phoneController.text.trim(),
                          otpType: OtpType.register,
                        );
                      }
                    },
                    builder: (context, state) {
                      final AuthCubit cubit = context.read<AuthCubit>();
                      if (state is SignUpLoading) {
                        return const AppLoading();
                      }
                      return CustomButton(
                        label: translate('sign_up.btn_label', context),
                        onPressed: () {
                          if (!_signUpKey.currentState!.validate()) return;

                          cubit.signUp(
                            phoneNumber:
                                countryCode.value +
                                _phoneController.text.trim(),
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
