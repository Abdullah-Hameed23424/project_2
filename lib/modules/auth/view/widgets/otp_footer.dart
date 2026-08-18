import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/modules/auth/cubit/auth_cubit.dart';
import 'package:project_2/modules/auth/view/screens/helper/otp_type.dart';
import 'package:project_2/modules/auth/view/screens/otp_screen.dart';
import 'package:project_2/modules/auth/view/widgets/custom_timer.dart';

class OtpFooter extends StatelessWidget {
  const OtpFooter({super.key, required CustomTimer timer, required this.widget})
    : _timer = timer;

  final CustomTimer _timer;
  final OtpScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FadeInLeft(
          delay: AppPeriods.animationDelay(6),
          child: ValueListenableBuilder<int>(
            valueListenable: _timer.remainingSeconds,
            builder: (context, seconds, child) {
              return Text.rich(
                style: context.headlineMedium18,
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: translate('otp.resend_otp_instructions', context),
                    ),
                    TextSpan(text: '00:${seconds.toString().padLeft(2, '0')}'),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 5.h),
        FadeInLeft(
          delay: AppPeriods.animationDelay(7),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final AuthCubit cubit = context.read<AuthCubit>();
              return ValueListenableBuilder(
                valueListenable: _timer.remainingSeconds,
                builder: (context, seconds, child) {
                  if (state is ForgetPasswdLoading) {
                    return const AppLoading();
                  }
                  return TextButton(
                    onPressed: (seconds != 0)
                        ? null
                        : () {
                            if (widget.otpType == OtpType.forgetPasswd) {
                              cubit.forgetPasswd(
                                phoneNumber: widget.phoneNumber,
                              );
                            } else if (widget.otpType == OtpType.register) {
                              cubit.signUp(phoneNumber: widget.phoneNumber);
                            }
                          },
                    child: Text(
                      translate('otp.text_btn_title', context),
                      style: context.bodyLarge20.copyWith(
                        fontWeight: FontWeight.w500,
                        color: (seconds != 0)
                            ? Colors.grey.shade400
                            : AppColors.primary,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
