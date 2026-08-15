import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/constants/app_shadow.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/services/snackbar_service.dart';
import 'package:project_2/core/validators/phone_validator.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/core/widgets/custom_button.dart';
import 'package:project_2/core/widgets/custom_textfield.dart';
import 'package:project_2/modules/auth/cubit/auth_cubit.dart';
import 'package:project_2/modules/auth/view/screens/helper/otp_type.dart';
import 'package:project_2/modules/auth/view/widgets/phone_number_prefix.dart';
import 'package:project_2/modules/auth/view/widgets/section_title.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({
    super.key,
    required GlobalKey<FormState> forgetPasswdKey,
    required TextEditingController phoneController,
    required this.isoCode,
    required this.countryCode,
  }) : _forgetPasswdKey = forgetPasswdKey,
       _phoneController = phoneController;

  final GlobalKey<FormState> _forgetPasswdKey;
  final TextEditingController _phoneController;
  final ValueNotifier<IsoCode> isoCode;
  final ValueNotifier<String> countryCode;

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  late final AuthCubit cubit;

  @override
  void initState() {
    cubit = AuthCubit();
    super.initState();
  }

  void handleForgetPasswd(BuildContext context, {required AuthCubit cubit}) {
    if (!widget._forgetPasswdKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    cubit.forgetPasswd(
      phoneNumber:
          widget.countryCode.value + widget._phoneController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: AppShadow.cardShadow,
      ),
      child: Form(
        key: widget._forgetPasswdKey,
        child: BlocProvider<AuthCubit>.value(
          value: cubit,
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is ForgetPasswdError) {
                snackBarService.showError(message: state.message);
              } else if (state is ForgetPasswdSuccess) {
                snackBarService.showSuccess(message: 'OTP Sent');
                AppRoutes.toOtpScreen(
                  otpType: OtpType.forgetPasswd,
                  phoneNumber:
                      widget.countryCode.value +
                      widget._phoneController.text.trim(),
                );
              }
            },

            child: Column(
              children: <Widget>[
                FadeInLeft(
                  delay: AppPeriods.animationDelay(4),
                  child: const SectionTitle(title: 'Phone Number'),
                ),
                Builder(
                  builder: (context) {
                    return FadeInLeft(
                      delay: AppPeriods.animationDelay(5),
                      child: CustomTextField(
                        controller: widget._phoneController,
                        hintText: '9XX XXX XXX',
                        radius: 12.r,
                        keyboardType: TextInputType.phone,
                        validator: (value) => PhoneValidator.validate(
                          value,
                          country: widget.isoCode.value,
                        ),
                        prefixIcon: PhoneNumberPrefix(
                          countryCode: widget.countryCode,
                          isoCode: widget.isoCode,
                        ),
                        onEditingComplete: () => handleForgetPasswd(
                          context,
                          cubit: context.read<AuthCubit>(),
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: 35.h),

                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    final AuthCubit cubit = context.read<AuthCubit>();
                    if (state is ForgetPasswdLoading) return const AppLoading();
                    return FadeInLeft(
                      delay: AppPeriods.animationDelay(6),
                      child: CustomButton(
                        label: 'Send OTP',
                        onPressed: () =>
                            handleForgetPasswd(context, cubit: cubit),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
