import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/services/snackbar_service.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/modules/auth/cubit/auth_cubit.dart';
import 'package:project_2/modules/auth/view/screens/helper/otp_type.dart';
import 'package:project_2/modules/auth/view/widgets/custom_timer.dart';
import 'package:project_2/modules/auth/view/widgets/custom_header.dart';
import 'package:project_2/modules/auth/view/widgets/otp_form.dart';

class OtpScreen extends StatefulWidget {
  final OtpType otpType;
  final String phoneNumber;
  const OtpScreen({
    super.key,
    required this.phoneNumber,
    required this.otpType,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late final GlobalKey<FormState> _otpKey;
  late final TextEditingController _otpController;
  late final CustomTimer _timer;

  @override
  void initState() {
    _otpKey = GlobalKey<FormState>();
    _otpController = TextEditingController();
    _timer = CustomTimer(initialSeconds: 59);
    _timer.start(59);
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is VerifyOtpError) {
            snackBarService.showError(message: state.message);
          } else if (state is VerifyOtpSuccess) {
            snackBarService.showSuccess(message: 'Verifying OTP successfully');
            if (widget.otpType == OtpType.forgetPasswd) {
              AppRoutes.toResetPasswdScreen(
                phoneNumber: widget.phoneNumber,
                ticket: state.otpResponse.ticket,
              );
            } else if (widget.otpType == OtpType.register) {
              AppRoutes.toCompleteSignUpScreen(
                phoneNumber: widget.phoneNumber,
                ticket: state.otpResponse.ticket,
              );
            }
          }
          if (state is ForgetPasswdError) {
            snackBarService.showError(message: state.message);
          } else if (state is ForgetPasswdSuccess) {
            snackBarService.showSuccess(message: 'OTP Sent');
            _timer.start(59);
          }
          if (state is SignUpError) {
            snackBarService.showError(message: state.message);
          } else if (state is SignUpSuccess) {
            snackBarService.showSuccess(message: 'OTP Sent');
          }
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(leading: const PopButton()),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const CustomHeader(iconData: Icons.verified_user_rounded),

                // Floating Card
                OtpForm(
                  otpKey: _otpKey,
                  widget: widget,
                  otpController: _otpController,
                ),

                // Footer
                Column(
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
                                const TextSpan(text: 'Resend code after '),
                                TextSpan(
                                  text:
                                      '00:${seconds.toString().padLeft(2, '0')}',
                                ),
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
                                        if (widget.otpType ==
                                            OtpType.forgetPasswd) {
                                          cubit.forgetPasswd(
                                            phoneNumber: widget.phoneNumber,
                                          );
                                        } else if (widget.otpType ==
                                            OtpType.register) {
                                          cubit.signUp(
                                            phoneNumber: widget.phoneNumber,
                                          );
                                        }
                                      },
                                child: Text(
                                  'Resend',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
