import 'package:animate_do/animate_do.dart';
import 'package:project_2/modules/template_feature/cubit/template_feature_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/core/routing/app_routes.dart';

import 'package:project_2/core/services/snackbar_service.dart';
import 'package:project_2/core/widgets/confirmation_dialog.dart';
import 'package:project_2/core/widgets/loading_dialog.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({super.key});

  static show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => BlocProvider(
        create: (context) => TemplateFeatureCubit(),
        child: const LogoutDialog(),
      ),
    );
  }

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  // تم الاستغناء عن الـ GlobalKey والتحول لـ Overlay داخلي لضمان الاستقرار

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TemplateFeatureCubit, TemplateFeatureState>(
      listener: (context, state) {
        if (state is TemplateFeatureSuccess) {
          if (mounted) {
            Navigator.of(context, rootNavigator: true).pop();
          }

          // AppRoutes.toSigninScreen();

          snackBarService.showSuccess(
            message: translate('logged_out_succes_msg', context),
          );
        } else if (state is TemplateFeatureError) {
          snackBarService.showError(message: state.message);
        }
      },
      builder: (context, state) {
        final TemplateFeatureCubit cubit = context.read<TemplateFeatureCubit>();
        final bool isLoading = state is TemplateFeatureLoading || state is TemplateFeatureSuccess;

        return ZoomIn(
          child: isLoading
              ? const LoadingDialogWidget()
              : ConfirmationDialog(
                  title: translate('logout', context),
                  content: translate('logout_confirmation', context),
                  onConfirm: () {
                    // cubit.logout();
                  },
                  status: ConfirmationStatus.danger,
                  autoPopConfirm: false,
                ),
        );
      },
    );
  }
}
