import 'dart:convert';
import 'dart:developer';
import 'package:project_2/core/error/error_reporter/error_context.dart';
import 'package:project_2/core/routing/app_route_observer.dart';
import 'package:project_2/core/routing/navigation_service.dart';
import 'package:project_2/core/storage/app_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sentry/sentry.dart';

/// [ErrorReporter]
/// Reports errors to Sentry and a custom error reporting service.
class ErrorReporter {
  static const _workerUrl = '';
  // 'https://......'; // Replace with your actual error reporting service URL

  /// [report]
  /// Reports the given error to Sentry and a custom error reporting service.
  static Future<void> report(
    Object error,
    StackTrace stackTrace, {
    String? feature,
    String level = 'error',
  }) async {
    final userId = AppStorage.getMyId.toString();

    final currentRoute = AppRouteObserver.currentRoute ?? 'Unknown Screen';
    final updatedFeature = feature != null
        ? '$feature ($currentRoute)'
        : currentRoute;

    final context = await ErrorContext.collect(
      feature: updatedFeature,
      userId: userId,
    );

    final eventId = await Sentry.captureException(
      error,
      stackTrace: stackTrace,
      withScope: (scope) {
        scope.setUser(SentryUser(id: userId));

        if (feature != null) {
          scope.setTag('feature', feature);
        }
      },
    );

    await _sendToWorker(
      title: context['feature'],
      message: error.toString(),
      level: level,
      fingerprint: '${error.runtimeType}-${stackTrace.hashCode}',
      stack: stackTrace.toString().split('\n').take(5).join('\n'),
      context: context,
      sentryEventId: eventId.toString(),
    );
  }

  /// [_sendToWorker]
  /// Sends error details to a custom error reporting service.
  static Future<void> _sendToWorker({
    required String title,
    required String message,
    required String level,
    required String fingerprint,
    required String stack,
    required Map<String, dynamic> context,
    required String sentryEventId,
  }) async {
    try {
      await http.post(
        Uri.parse(_workerUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': title,
          'message': message,
          'level': level,
          'fingerprint': fingerprint,
          'stack': stack,
          'context': context,
          'sentryEventId': sentryEventId,
        }),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
