import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/constants/app_periods.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/services/snackbar_service.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/core/widgets/custom_button.dart';
import 'package:project_2/modules/auth/cubit/auth_cubit.dart';

class CompleteSignUpInfoFooter extends StatelessWidget {
  final String phoneNumber;
  final String ticket;
  final GlobalKey<FormState> completeInfoKey;
  final TextEditingController fullNameController;
  final TextEditingController passwdController;
  final TextEditingController confirmPasswdController;
  const CompleteSignUpInfoFooter({
    super.key,
    required this.phoneNumber,
    required this.ticket,
    required this.completeInfoKey,
    required this.fullNameController,
    required this.passwdController,
    required this.confirmPasswdController,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: AppPeriods.animationDelay(9),
      child: BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is CompleteSignUpError) {
              snackBarService.showError(message: state.message);
            } else if (state is CompleteSignUpSuccess) {
              snackBarService.showSuccess(message: 'Welcome to Domiq');
              AppRoutes.toHomeScreen();
            }
          },
          builder: (context, state) {
            final AuthCubit cubit = context.read<AuthCubit>();
            if (state is CompleteSignUpLoading) {
              return const AppLoading();
            }
            return CustomButton(
              label: 'Register Now',
              icon: const Icon(Icons.verified_outlined, color: AppColors.white),
              onPressed: () {
                if (!completeInfoKey.currentState!.validate()) return;

                cubit.completeSignUpInfo(
                  phoneNumber: phoneNumber,
                  fullName: fullNameController.text.trim(),
                  passwd: passwdController.text.trim(),
                  confirmPasswd: confirmPasswdController.text.trim(),
                  ticket: ticket,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
