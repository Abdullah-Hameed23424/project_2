import 'package:flutter/material.dart';

/// [AppConfig]
/// Centralized place for all app configurations
/// Application configuration
class AppConfig {
  // API Configuration
  static const String domain = 'https://home-maintenance.me';
  static const String baseUrl = '$domain/api/';
  static const String storageUrl = '$domain/storage/';
  static const int apiTimeout = 30; // seconds

  // App Configuration
  static const String appName = 'base_project';
  static const String appVersion = '1.0.0';

  // Cache Configuration
  static const int maxCacheSize = 100; // MB
  static const Duration cacheExpiration = Duration(days: 7);

  // Pagination Configuration
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // UI Configuration
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Curve curve = Curves.linear;

  /// [CUSTOM_DELAY_FOR_ANIMATIONS]
  /// * multiply the delay by the number an value that you want to delay the animation
  ///
  /// * example: animationDelay(2) => delay: 200ms
  /// * example: animationDelay(3) => delay: 300ms
  /// * baseDelay: the base delay for the animation (default: 100ms)
  static const Duration splashDuration = Duration(seconds: 2);
  static const Cubic animationCurve = Curves.easeInOut;
  static const String defaultFontFamily = 'Tajawal';
  static const String defaultLocale = 'ar';

  /// Check if running in debug mode
  static bool get isDebugMode {
    return const bool.fromEnvironment('dart.vm.product') == false;
  }
}
