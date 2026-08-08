import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_sizes.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/modules/auth/cubit/auth_cubit.dart';
import 'package:project_2/modules/auth/view/widgets/forget_passwd_header.dart';
import 'package:project_2/modules/auth/view/widgets/forget_password_form.dart';

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
      body: Container(
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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingH),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Top Space
              SizedBox(height: AppSizes.xxxLargeSpace),

              const ForgetPasswdHeader(),

              SizedBox(height: AppSizes.largeSpace),

              ForgetPasswordForm(
                forgetPasswdKey: _forgetPasswdKey,
                phoneController: _phoneController,
                isoCode: isoCode,
                countryCode: countryCode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
