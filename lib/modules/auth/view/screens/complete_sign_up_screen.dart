import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/modules/auth/view/widgets/complete_sign_up_info_footer.dart';
import 'package:project_2/modules/auth/view/widgets/complete_sign_up_info_form.dart';
import 'package:project_2/modules/auth/view/widgets/custom_header_icon.dart';

class CompleteSignUpScreen extends StatefulWidget {
  final String phoneNumber;
  final String ticket;
  const CompleteSignUpScreen({
    super.key,
    required this.phoneNumber,
    required this.ticket,
  });

  @override
  State<CompleteSignUpScreen> createState() => _CompleteSignUpScreenState();
}

class _CompleteSignUpScreenState extends State<CompleteSignUpScreen> {
  late final GlobalKey<FormState> _completeInfoKey;
  late final TextEditingController _fullNameController;
  late final TextEditingController _passwdController;
  late final TextEditingController _confirmPasswdController;

  @override
  void initState() {
    _completeInfoKey = GlobalKey<FormState>();
    _fullNameController = TextEditingController();
    _passwdController = TextEditingController();
    _confirmPasswdController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: FadeInLeft(child: const PopButton(color: AppColors.black)),
        title: FadeInLeft(
          child: Text(
            'Complete Your Info',
            style: context.titleSmall26.copyWith(fontWeight: FontWeight.normal),
          ),
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
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 150.h),

              FadeInLeft(
                delay: AppPeriods.animationDelay(2),
                child: const CustomHeaderIcon(
                  iconData: Icons.handyman,
                  iconColor: AppColors.primaryDark,
                ),
              ),

              SizedBox(height: 45.h),

              CompleteSignUpInfoForm(
                completeInfoKey: _completeInfoKey,
                fullNameController: _fullNameController,
                passwdController: _passwdController,
                confirmPasswdController: _confirmPasswdController,
              ),

              SizedBox(height: 90.h),

              CompleteSignUpInfoFooter(
                phoneNumber: widget.phoneNumber,
                ticket: widget.ticket,
                completeInfoKey: _completeInfoKey,
                fullNameController: _fullNameController,
                passwdController: _passwdController,
                confirmPasswdController: _confirmPasswdController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
