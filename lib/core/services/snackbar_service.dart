import 'package:project_2/core/routing/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

/// [SnackBarType]
/// An enumeration representing different types of snack bars.
enum SnackBarType { success, error, warning, info }

/// [SnackBarService]
/// A service class for displaying snack bars in the application.
class SnackBarService {
  // Singleton Setup
  static final SnackBarService _instance = SnackBarService._internal();
  factory SnackBarService() => _instance;
  SnackBarService._internal();

  /// [_overlay]
  /// A getter that retrieves the current overlay state from the navigation service's navigator key.
  OverlayState get _overlay =>
      NavigationService.navigatorKey.currentState!.overlay!;

  /// [show]
  /// Displays a snack bar with the specified message, type, and duration.
  void show({
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 2),
  }) {
    switch (type) {
      case SnackBarType.success:
        showTopSnackBar(_overlay, CustomSnackBar.success(message: message));
        break;

      case SnackBarType.error:
        showTopSnackBar(
          _overlay,
          CustomSnackBar.error(message: message, maxLines: 3),
        );
        break;

      case SnackBarType.warning:
        showTopSnackBar(
          _overlay,
          CustomSnackBar.info(message: message, backgroundColor: Colors.orange),
        );
        break;

      case SnackBarType.info:
        showTopSnackBar(_overlay, CustomSnackBar.info(message: message));
        break;
    }
  }

  /// [Quick Show Methods]
  /// These methods provide quick access to show snack bars of specific types without needing to specify the type each time.
  void showSuccess({required String message}) =>
      show(message: message, type: SnackBarType.success);

  void showError({required String message}) =>
      show(message: message, type: SnackBarType.error);

  void showWarning({required String message}) =>
      show(message: message, type: SnackBarType.warning);

  void showInfo({required String message}) =>
      show(message: message, type: SnackBarType.info);
}

/// [Global SnackBarService Instance]
final SnackBarService snackBarService = SnackBarService();
