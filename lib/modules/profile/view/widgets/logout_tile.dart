import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/routing/app_routes.dart';
import 'package:project_2/core/services/snackbar_service.dart';
import 'package:project_2/core/widgets/app_loading.dart';
import 'package:project_2/modules/auth/cubit/auth_cubit.dart';

class LogoutTile extends StatelessWidget {
  const LogoutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginError) {
            snackBarService.showError(message: state.message);
          } else if (state is LogoutSuccess) {
            snackBarService.showSuccess(
              message: 'You have successfully logged out',
            );
            AppRoutes.toLoginScreen();
          }
        },
        builder: (context, state) {
          if (state is LogoutLoading) {
            return const AppLoading();
          }
          return Container(
            decoration: BoxDecoration(
              color: Colors.red.withAlpha(25),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12.r),
              ),
              splashColor: Colors.red.withAlpha(40),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              leading: const Icon(Icons.logout, color: Colors.red),
              title: Text(
                translate('profile.logout_tile_label', context),
                style: const TextStyle(color: Colors.red),
              ),
              onTap: () {
                context.read<AuthCubit>().logout();
              },
            ),
          );
        },
      ),
    );
  }
}
