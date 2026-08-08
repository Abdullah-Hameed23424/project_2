import 'package:project_2/core/routing/navigation_service.dart';
import 'package:project_2/core/routing/routes.dart';
import 'package:project_2/modules/auth/view/screens/forget_passwd_screen.dart';
import 'package:project_2/modules/auth/view/screens/login_screen.dart';
import 'package:project_2/modules/auth/view/screens/otp_screen.dart';
import 'package:project_2/modules/home/view/screens/home_screen.dart';
import 'package:project_2/modules/startup/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';

/// [AppRoutes]
/// A class that defines the application's routes and provides methods for navigation.
class AppRoutes {
  /// [getRoutes]
  /// Returns a map of route names to their corresponding widget builders.
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.splashScreen: (_) => const SplashScreen(),
      Routes.loginScreen: (_) => const LoginScreen(),
      Routes.forgetPasswdScreen: (_) => const ForgetPasswdScreen(),
      Routes.otpScreen: (_) => const OtpScreen(),
      Routes.homeScreen: (_) => const HomeScreen(),
    };
  }

  /// [onGenerateRoute]
  /// A method that generates routes based on the provided [RouteSettings].
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.testWithArgsScreen:
      //   final args = settings.arguments as Map;
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => TestWithArgScreen(parameterOne: args['argumentOne']),
      //   );

      default:
        return null;
    }
  }

  /// [Navigation Methods]
  /// A set of static methods for navigating between screens in the application.
  static Future<dynamic>? toSplashScreen() {
    return NavigationService.navigateAndRemoveUntil(Routes.splashScreen);
  }

  static Future<dynamic>? toLoginScreen() {
    return NavigationService.navigateAndRemoveUntil(Routes.loginScreen);
  }

  static Future<dynamic>? toForgetPasswdScreen() {
    return NavigationService.navigateTo(Routes.forgetPasswdScreen);
  }

  static Future<dynamic>? toOtpScreen() {
    return NavigationService.navigateTo(Routes.otpScreen);
  }

  static Future<dynamic>? toHomeScreen() {
    return NavigationService.navigateAndRemoveUntil(Routes.homeScreen);
  }

  /// NOTE:
  /// If there is a need to navigate to a screen with arguments, you can use the `push` method and pass the arguments as a parameter. For example:
  /// ```dart
  /// NavigationService.push(Routes.testWithArgsScreen, arguments: {'argumentOne': 'value'});
  /// and then in the `onGenerateRoute` method, you can retrieve the arguments and pass them to the corresponding screen.

  /// [Helper Navigation Methods]
  /// A set of static helper methods for navigating back and forth between screens in the application.
  static void goBack<T extends Object?>([T? result]) {
    NavigationService.goBack(result);
  }

  static Future<dynamic>? push(String routeName, {Object? arguments}) {
    return NavigationService.navigateTo(routeName, arguments: arguments);
  }

  static Future<dynamic>? replace(String routeName, {Object? arguments}) {
    return NavigationService.navigateAndReplace(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic>? removeAllAndPush(
    String routeName, {
    Object? arguments,
  }) {
    return NavigationService.navigateAndRemoveUntil(
      routeName,
      arguments: arguments,
    );
  }
}
