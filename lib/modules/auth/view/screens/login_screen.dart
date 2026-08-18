import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/modules/auth/cubit/auth_cubit.dart';
import 'package:project_2/modules/auth/view/widgets/login_footer.dart';
import 'package:project_2/modules/auth/view/widgets/login_form.dart';
import 'package:project_2/modules/auth/view/widgets/sign_up_login_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final GlobalKey<FormState> _loginKey;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late final ValueNotifier<String> countryCode;
  late final ValueNotifier<IsoCode> isoCode;

  @override
  void initState() {
    _loginKey = GlobalKey<FormState>();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    countryCode = ValueNotifier<String>('+963');
    isoCode = ValueNotifier<IsoCode>(IsoCode.SY);
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Blue Part
              SignUpLoginHeader(title: translate('login.welcome', context)),

              // Floating Card
              LoginForm(
                loginKey: _loginKey,
                phoneController: _phoneController,
                isoCode: isoCode,
                countryCode: countryCode,
                passwordController: _passwordController,
              ),

              // Login Footer
              const LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
