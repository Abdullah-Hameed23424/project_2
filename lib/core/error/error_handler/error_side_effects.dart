import 'package:project_2/core/error/error_handler/app_error_type.dart';
import 'package:project_2/core/error/error_reporter/error_reporter.dart';
import 'package:project_2/core/storage/app_storage.dart';

/// [ErrorSideEffects]
/// Handles side effects based on the classified error type.
class ErrorSideEffects {
  /// Handles side effects based on the [AppErrorType].
  /// For example, it can log out the user on unauthorized errors or report server errors.
  static void handle(
    AppErrorType type,
    Object error,
    StackTrace stackTrace,
  ) async {
    switch (type) {
      case AppErrorType.unauthorized:
        if (await AppStorage.hasToken) {
          // await AuthHelper.logout();
        }
        break;

      case AppErrorType.badRequest:
        break;

      case AppErrorType.serverDown:
        ErrorReporter.report(error, stackTrace, feature: 'Server_down');
        break;

      case AppErrorType.serverError:
        ErrorReporter.report(error, stackTrace, feature: 'Server_error');
        break;

      case AppErrorType.forbidden:
        break;

      case AppErrorType.notFound:
        break;

      case AppErrorType.validation:
        break;

      case AppErrorType.unknown:
        ErrorReporter.report(error, stackTrace);
        break;

      default:
        break;
    }
  }
}
