import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_icons.dart';
import 'package:project_2/core/constants/app_images.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final GlobalKey<FormState> _loginKey;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _loginKey = GlobalKey<FormState>();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                /// Blue Part
                Container(
                  height: 340.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.r),
                      bottomRight: Radius.circular(25.r),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(AppImages.appLogo, width: 150.w),

                      const SizedBox(height: 5),

                      Text('Welcome back', style: context.titleMedium36),
                    ],
                  ),
                ),

                /// Floating Card
                Transform.translate(
                  offset: const Offset(0, -50),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Card(
                      color: AppColors.white,
                      elevation: 3,
                      shadowColor: AppColors.shadowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: _loginKey,
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  'Login',
                                  style: context.titleSmall26,
                                ),
                              ),

                              const SizedBox(height: 25),

                              CustomTextField(
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                controller: _phoneController,
                                hintText: '09X XXX XXX',
                                radius: 10.r,
                                keyboardType: TextInputType.phone,
                                label: 'Phone Number',
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(20.w),
                                  child: SvgPicture.asset(AppIcons.mobileIcon),
                                ),
                              ),

                              const SizedBox(height: 20),

                              TextField(
                                controller: _passwordController,
                                obscureText: true,
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: const Icon(Icons.visibility),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text('نسيت كلمة المرور؟'),
                                ),
                              ),

                              const SizedBox(height: 10),

                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff0F5CCB),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_forward),
                                  label: const Text(
                                    'دخول',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('ليس لديك حساب؟ '),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'إنشاء حساب جديد',
                        style: TextStyle(
                          color: Color(0xff0F5CCB),
                          fontWeight: FontWeight.bold,
                        ),
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
