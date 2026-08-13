import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/constants/app_shadow.dart';
import 'package:project_2/core/constants/app_sizes.dart';
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
            key: _signUpKey,
            child: Column(
              children: <Widget>[
                FadeInLeft(
                  delay: AppPeriods.animationDelay(3),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text('New Account', style: context.titleSmall26),
                  ),
                ),

                SizedBox(height: AppSizes.largeSpace),
                FadeInLeft(
                  delay: AppPeriods.animationDelay(4),
                  child: const SectionTitle(title: 'Phone Number'),
                ),
                FadeInLeft(
                  delay: AppPeriods.animationDelay(5),
                  child: CustomTextField(
                    controller: _phoneController,
                    hintText: '9XX XXX XXX',
                    radius: AppSizes.mediumRadius,
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                        PhoneValidator.validate(value, country: isoCode.value),
                    prefixIcon: PhoneNumberPrefix(
                      countryCode: countryCode,
                      isoCode: isoCode,
                    ),
                  ),
                ),

                SizedBox(height: AppSizes.tinySpace),
                FadeInLeft(
                  delay: AppPeriods.animationDelay(6),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'We will send you a verification code via SMS',
                      style: context.bodyMedium16.copyWith(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: AppSizes.xLargeSpace),
                FadeInLeft(
                  delay: AppPeriods.animationDelay(7),
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is SignUpError) {
                        snackBarService.showError(message: state.message);
                      } else if (state is SignUpSuccess) {
                        snackBarService.showSuccess(message: 'OTP Sent');
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
                        label: 'Continue',
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
