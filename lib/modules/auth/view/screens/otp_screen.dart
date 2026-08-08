import 'package:flutter/material.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_shadow.dart';
import 'package:project_2/core/constants/app_sizes.dart' show AppSizes;
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/custom_button.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/modules/auth/view/widgets/custom_timer.dart';
import 'package:project_2/modules/auth/view/widgets/otp_header.dart';
import 'package:project_2/modules/auth/view/widgets/otp_pinput.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  const OtpScreen({super.key, required this.phoneNumber});

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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(leading: const PopButton()),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const OtpHeader(),

            // Floating Card
            Transform.translate(
              offset: const Offset(0, -55),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingH),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingH,
                    vertical: AppSizes.paddingV,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.bgWhite,
                    borderRadius: BorderRadius.circular(AppSizes.mediumRadius),
                    boxShadow: AppShadow.cardShadow,
                  ),
                  child: Form(
                    key: _otpKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Verification Code',
                          style: context.headlineLarge30.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppSizes.tinySpace),
                        Text(
                          'Enter the 4-digit code sent\nto ${widget.phoneNumber}',
                          style: context.bodyLarge20,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: AppSizes.largeSpace),
                        OtpPinput(
                          otpController: _otpController,
                          onCompleted: (code) {},
                        ),

                        SizedBox(height: AppSizes.xLargeSpace),
                        CustomButton(label: 'Verify', onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Footer
            Column(
              children: <Widget>[
                ValueListenableBuilder<int>(
                  valueListenable: _timer.remainingSeconds,
                  builder: (context, seconds, child) {
                    return Text.rich(
                      style: context.headlineMedium18,
                      TextSpan(
                        children: <InlineSpan>[
                          const TextSpan(text: 'Resend code after '),
                          TextSpan(
                            text: '00:${seconds.toString().padLeft(2, '0')}',
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: AppSizes.tinySpace),
                ValueListenableBuilder(
                  valueListenable: _timer.remainingSeconds,
                  builder: (context, seconds, child) {
                    return TextButton(
                      onPressed: (seconds != 0)
                          ? null
                          : () {
                              _timer.start(59);
                              setState(() {});
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
