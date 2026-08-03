import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:feature_based_with_mvvm/core/error/error_handler/error_classifier.dart';
import 'package:feature_based_with_mvvm/core/error/error_handler/error_localizer.dart';
import 'package:feature_based_with_mvvm/core/error/error_handler/error_side_effects.dart';

/// [ErrorHandler]
/// Handles errors by classifying them, executing side effects, and returning localized messages.
class ErrorHandler {
  /// Handles the given error by classifying it, executing side effects, and returning a localized message.
  static String handle(Object error, {StackTrace? stackTrace}) {
    final trace = stackTrace ?? StackTrace.current;

    final type = ErrorClassifier.classify(error);

    ErrorSideEffects.handle(type, error, trace);

    if (error is DioException) {
      final responseData = error.response?.data;
      if (responseData is Map) {
        final message = responseData['message'];
        if (message is String && message.trim().isNotEmpty) {
          return message;
        }
        if (message != null) {
          return message.toString();
        }
      }
    }

    return ErrorLocalizer.message(type);
  }
}

/// [handleError]
/// A convenience function to handle errors using the [ErrorHandler].
String handleError(Object error, {StackTrace? stackTrace}) {
  return ErrorHandler.handle(error, stackTrace: stackTrace);
}

/// [logApiName]
/// Logs the API name for debugging purposes.
void logApiName(String apiName) {
  log('===============================================');
  log('================ [ $apiName ] =================');
  log('===============================================');
}
