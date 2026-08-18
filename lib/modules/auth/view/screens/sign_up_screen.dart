import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/modules/auth/cubit/auth_cubit.dart';
import 'package:project_2/modules/auth/view/widgets/sign_up_form.dart';
import 'package:project_2/modules/auth/view/widgets/sign_up_login_header.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final GlobalKey<FormState> _signUpKey;
  late final TextEditingController _phoneController;
  late final ValueNotifier<String> countryCode;
  late final ValueNotifier<IsoCode> isoCode;

  @override
  void initState() {
    _signUpKey = GlobalKey<FormState>();
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
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        extendBodyBehindAppBar: true,

        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
          ),
          leading: const PopButton(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SignUpLoginHeader(title: translate('sign_up.welcome', context)),

              SignUpForm(
                signUpKey: _signUpKey,
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
