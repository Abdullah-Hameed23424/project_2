import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/theme/app_theme.dart';
import 'package:project_2/core/widgets/pop_button.dart';
import 'package:project_2/modules/auth/view/widgets/custom_header.dart';
import 'package:project_2/modules/auth/view/widgets/reset_passwd_form.dart';

class ResetPasswdScreen extends StatefulWidget {
  final String phoneNumber;
  final String ticket;
  const ResetPasswdScreen({
    super.key,
    required this.phoneNumber,
    required this.ticket,
  });

  @override
  State<ResetPasswdScreen> createState() => _ResetPasswdScreenState();
}

class _ResetPasswdScreenState extends State<ResetPasswdScreen> {
  late final GlobalKey<FormState> _resetKey;
  late final TextEditingController _passwdController;
  late final TextEditingController _confirmPasswdController;

  @override
  void initState() {
    _resetKey = GlobalKey<FormState>();
    _passwdController = TextEditingController();
    _confirmPasswdController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwdController.dispose();
    _confirmPasswdController.dispose();
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
            const CustomHeader(iconData: Icons.lock_open),

            // Floating Card
            ResetPasswdForm(
              resetKey: _resetKey,
              passwdController: _passwdController,
              confirmPasswdController: _confirmPasswdController,
              widget: widget,
            ),

            // Footer
            FadeIn(
              delay: AppPeriods.animationDelay(10),
              child: Text(
                'Your security, always a priority',
                style: context.bodyLarge20.copyWith(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
