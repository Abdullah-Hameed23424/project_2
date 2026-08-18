import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/services/snackbar_service.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/modules/auth/cubit/auth_cubit.dart';
import 'package:project_2/modules/auth/view/screens/helper/otp_type.dart';
import 'package:project_2/modules/auth/view/widgets/custom_timer.dart';
import 'package:project_2/modules/auth/view/widgets/custom_header.dart';
import 'package:project_2/modules/auth/view/widgets/otp_footer.dart';
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
            snackBarService.showSuccess(
              message: translate('otp.snack_success', context),
            );
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
            snackBarService.showSuccess(
              message: translate('forget_passwd.snack_success', context),
            );
            _timer.start(59);
          }
          if (state is SignUpError) {
            snackBarService.showError(message: state.message);
          } else if (state is SignUpSuccess) {
            snackBarService.showSuccess(
              message: translate('forget_passwd.snack_success', context),
            );
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
                OtpFooter(timer: _timer, widget: widget),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
