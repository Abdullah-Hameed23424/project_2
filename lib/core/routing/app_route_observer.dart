import 'package:flutter/material.dart';

/// [AppRoutesObserver]
/// A class that observes route changes in the application and keeps track of the current route.
class AppRouteObserver extends NavigatorObserver {
  static String? currentRoute;

  void _updateRoute(Route<dynamic>? route) {
    if (route != null && route.settings.name != null) {
      currentRoute = route.settings.name;
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _updateRoute(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _updateRoute(previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _updateRoute(newRoute);
  }
}
