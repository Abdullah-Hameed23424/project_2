import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/foundation.dart';

/// [ErrorContext]
/// Collects contextual information about the app, device, and environment for error reporting.
class ErrorContext {
  /// Collects contextual information about the app, device, and environment.
  /// Returns a map containing details such as app name, version, build number, environment, platform, OS, device model, feature name, user ID, and timestamp.
  static Future<Map<String, dynamic>> collect({
    String? feature,
    String? userId,
  }) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final deviceInfo = DeviceInfoPlugin();

    String device = 'unknown';
    String os = 'unknown';
    String platform = 'web';

    if (!kIsWeb) {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          final info = await deviceInfo.androidInfo;
          device = info.model;
          os = 'Android ${info.version.release}';
          platform = 'android';
          break;

        case TargetPlatform.iOS:
          final info = await deviceInfo.iosInfo;
          device = info.utsname.machine;
          os = 'iOS ${info.systemVersion}';
          platform = 'ios';
          break;

        default:
          platform = defaultTargetPlatform.name;
      }
    }

    return {
      'appName': packageInfo.appName,
      'version': packageInfo.version,
      'build': packageInfo.buildNumber,
      'environment': kReleaseMode ? 'production' : 'debug',
      'platform': platform,
      'os': os,
      'device': device,
      'feature': feature ?? 'Error',
      'userId': userId ?? 'anonymous',
      'timestamp': DateTime.now().toIso8601String(),
    };
  }
}
