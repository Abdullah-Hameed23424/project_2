import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/constants/app_shadow.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/core/widgets/custom_button.dart';
import 'package:project_2/modules/auth/cubit/auth_cubit.dart';
import 'package:project_2/modules/auth/view/screens/helper/otp_type.dart';
import 'package:project_2/modules/auth/view/screens/otp_screen.dart';
import 'package:project_2/modules/auth/view/widgets/otp_pinput.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({
    super.key,
    required GlobalKey<FormState> otpKey,
    required this.widget,
    required TextEditingController otpController,
  }) : _otpKey = otpKey,
       _otpController = otpController;

  final GlobalKey<FormState> _otpKey;
  final OtpScreen widget;
  final TextEditingController _otpController;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -55),
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
            key: _otpKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FadeInLeft(
                  delay: AppPeriods.animationDelay(2),
                  child: Text(
                    'Verification Code',
                    style: context.headlineLarge30.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 5.h),
                FadeInLeft(
                  delay: AppPeriods.animationDelay(3),
                  child: Text(
                    'Enter the 4-digit code sent\nto ${widget.phoneNumber}',
                    style: context.bodyLarge20,
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 35.h),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        final AuthCubit cubit = context.read<AuthCubit>();
                        return FadeInLeft(
                          delay: AppPeriods.animationDelay(4),
                          child: OtpPinput(
                            enable: state is! VerifyOtpLoading,
                            otpController: _otpController,
                            onCompleted: (code) {
                              if (!_otpKey.currentState!.validate()) return;
                              FocusScope.of(context).unfocus();
                              cubit.verifyOtp(
                                endPoint:
                                    (widget.otpType == OtpType.forgetPasswd)
                                    ? 'password/verify'
                                    : 'register/verify',
                                phoneNumber: widget.phoneNumber,
                                code: _otpController.text.trim(),
                              );
                            },
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 45.h),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        final AuthCubit cubit = context.read<AuthCubit>();
                        if (state is VerifyOtpLoading) {
                          return const AppLoading();
                        }
                        return FadeInLeft(
                          delay: AppPeriods.animationDelay(5),
                          child: CustomButton(
                            label: 'Verify',
                            onPressed: () {
                              if (!_otpKey.currentState!.validate()) return;
                              FocusScope.of(context).unfocus();
                              cubit.verifyOtp(
                                endPoint:
                                    (widget.otpType == OtpType.forgetPasswd)
                                    ? 'password/verify'
                                    : 'register/verify',
                                phoneNumber: widget.phoneNumber,
                                code: _otpController.text.trim(),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
