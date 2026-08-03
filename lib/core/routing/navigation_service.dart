import 'package:feature_based_with_mvvm/core/routing/app_route_observer.dart';
import 'package:flutter/material.dart';

/// [NavigationService]
/// A class that provides static methods for navigating between screens in the application.
class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final AppRouteObserver routeObserver = AppRouteObserver();

  static Future<dynamic>? navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic>? navigateAndReplace(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic>? navigateAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static Future<dynamic> openDialog(Widget dialog) {
    return showDialog(
      context: navigatorKey.currentContext!,
      builder: (_) => dialog,
    );
  }

  static void goBack<T extends Object?>([T? result]) {
    return navigatorKey.currentState?.pop(result);
  }
}
