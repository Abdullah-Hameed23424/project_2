import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/constants/app_sizes.dart';
import 'package:project_2/core/services/snackbar_service.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/constants/app_shadow.dart';
import 'package:project_2/core/validators/phone_validator.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/core/widgets/custom_button.dart';
import 'package:project_2/core/widgets/custom_textfield.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/modules/auth/cubit/auth_cubit.dart';
import 'package:project_2/modules/auth/view/widgets/forget_passwd_header.dart';
import 'package:project_2/modules/auth/view/widgets/phone_number_prefix.dart';
import 'package:project_2/modules/auth/view/widgets/section_title.dart';

class ForgetPasswdScreen extends StatefulWidget {
  const ForgetPasswdScreen({super.key});

  @override
  State<ForgetPasswdScreen> createState() => _ForgetPasswdScreenState();
}

class _ForgetPasswdScreenState extends State<ForgetPasswdScreen> {
  late final GlobalKey<FormState> _forgetPasswdKey;
  late final TextEditingController _phoneController;
  late final ValueNotifier<String> countryCode;
  late final ValueNotifier<IsoCode> isoCode;

  @override
  void initState() {
    _forgetPasswdKey = GlobalKey<FormState>();
    _phoneController = TextEditingController();
    countryCode = ValueNotifier<String>('+963');
    isoCode = ValueNotifier<IsoCode>(IsoCode.SY);
    super.initState();
  }

  void test(BuildContext context, {required AuthCubit cubit}) {
    if (!_forgetPasswdKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    cubit.forgetPasswd(
      phoneNumber: countryCode.value + _phoneController.text.trim(),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    countryCode.dispose();
    isoCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        animateColor: true,
        leading: const PopButton(color: AppColors.primaryDark),
        title: Text(
          'Forget Password',
          style: context.titleSmall26.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.primaryDark,
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topLeft,
              radius: 1,
              colors: <Color>[
                AppColors.primary.withAlpha(80),
                AppColors.primary.withAlpha(60),
                AppColors.primary.withAlpha(0),
              ],
              stops: const <double>[0.0, 0.3, 1.0],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingH),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Top Space
                  SizedBox(height: AppSizes.xxxLargeSpace),

                  const ForgetPasswdHeader(),

                  SizedBox(height: AppSizes.largeSpace),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingH,
                      vertical: AppSizes.paddingV,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(AppSizes.radius),
                      boxShadow: AppShadow.cardShadow,
                    ),
                    child: Form(
                      key: _forgetPasswdKey,
                      child: BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is ForgetPasswdError) {
                            snackBarService.showError(message: state.message);
                          } else if (state is ForgetPasswdSuccess) {
                            snackBarService.showSuccess(message: 'OTP Sent');
                          }
                        },
                        builder: (context, state) {
                          final AuthCubit cubit = context.read<AuthCubit>();
                          return Column(
                            children: <Widget>[
                              FadeInLeft(
                                delay: AppPeriods.animationDelay(4),
                                child: const SectionTitle(
                                  title: 'Phone Number',
                                ),
                              ),
                              FadeInLeft(
                                delay: AppPeriods.animationDelay(5),
                                child: CustomTextField(
                                  controller: _phoneController,
                                  hintText: '9XX XXX XXX',
                                  radius: AppSizes.radius,
                                  keyboardType: TextInputType.phone,
                                  validator: (value) => PhoneValidator.validate(
                                    value,
                                    country: isoCode.value,
                                  ),
                                  prefixIcon: PhoneNumberPrefix(
                                    countryCode: countryCode,
                                    isoCode: isoCode,
                                  ),
                                  onEditingComplete: () =>
                                      test(context, cubit: cubit),
                                ),
                              ),

                              SizedBox(height: AppSizes.largeSpace),
                              if (state is ForgetPasswdLoading)
                                const AppLoading()
                              else
                                FadeIn(
                                  delay: AppPeriods.animationDelay(6),
                                  child: CustomButton(
                                    label: 'Send OTP',
                                    onPressed: () =>
                                        test(context, cubit: cubit),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
