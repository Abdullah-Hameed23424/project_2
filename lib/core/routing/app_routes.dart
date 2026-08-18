import 'package:project_2/core/routing/navigation_service.dart';
import 'package:project_2/core/routing/routes.dart';
import 'package:project_2/modules/addresses/view/screens/addresses_screen.dart';
import 'package:project_2/modules/auth/view/screens/complete_sign_up_screen.dart';
import 'package:project_2/modules/auth/view/screens/forget_passwd_screen.dart';
import 'package:project_2/modules/auth/view/screens/helper/otp_type.dart';
import 'package:project_2/modules/auth/view/screens/login_screen.dart';
import 'package:project_2/modules/auth/view/screens/otp_screen.dart';
import 'package:project_2/modules/auth/view/screens/reset_passwd_screen.dart';
import 'package:project_2/modules/auth/view/screens/sign_up_screen.dart';
import 'package:project_2/modules/home/view/screens/home_screen.dart';
import 'package:project_2/modules/home/view/screens/nav_bar_screen.dart';
import 'package:project_2/modules/orders/view/screens/create_order_screen.dart';
import 'package:project_2/modules/orders/view/screens/order_details_screen.dart';
import 'package:project_2/modules/profile/view/screens/language_screen.dart';
import 'package:project_2/modules/services/view/screens/services_screen.dart';
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
      Routes.signUpScreen: (_) => const SignUpScreen(),

      Routes.navBarScreen: (_) => const NavBarScreen(),
      Routes.homeScreen: (_) => const HomeScreen(),

      Routes.languageScreen: (_) => const LanguageScreen(),

      Routes.addressesScreen: (_) => const AddressesScreen(),
      Routes.createOrderScreen: (_) => const CreateOrderScreen(),
    };
  }

  /// [onGenerateRoute]
  /// A method that generates routes based on the provided [RouteSettings].
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.otpScreen:
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => OtpScreen(
            phoneNumber: args['phoneNumber'],
            otpType: args['otpType'],
          ),
        );
      case Routes.resetPasswdScreen:
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ResetPasswdScreen(
            phoneNumber: args['phoneNumber'],
            ticket: args['ticket'],
          ),
        );
      case Routes.completeSignUpScreen:
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CompleteSignUpScreen(
            phoneNumber: args['phoneNumber'],
            ticket: args['ticket'],
          ),
        );
      case Routes.servicesScreen:
        final int id = settings.arguments as int;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ServicesScreen(categoryId: id),
        );
      case Routes.orderDetailsScreen:
        final int id = settings.arguments as int;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => OrderDetailsScreen(orderId: id),
        );

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

  static Future<dynamic>? toSignUpScreen() {
    return NavigationService.navigateTo(Routes.signUpScreen);
  }

  static Future<dynamic>? toCompleteSignUpScreen({
    required String phoneNumber,
    required String ticket,
  }) {
    return NavigationService.navigateTo(
      Routes.completeSignUpScreen,
      arguments: {'phoneNumber': phoneNumber, 'ticket': ticket},
    );
  }

  static Future<dynamic>? toForgetPasswdScreen() {
    return NavigationService.navigateTo(Routes.forgetPasswdScreen);
  }

  static Future<dynamic>? toOtpScreen({
    required String phoneNumber,
    required OtpType otpType,
  }) {
    return NavigationService.navigateTo(
      Routes.otpScreen,
      arguments: {'phoneNumber': phoneNumber, 'otpType': otpType},
    );
  }

  static Future<dynamic>? toResetPasswdScreen({
    required String phoneNumber,
    required String ticket,
  }) {
    return NavigationService.navigateTo(
      Routes.resetPasswdScreen,
      arguments: {'phoneNumber': phoneNumber, 'ticket': ticket},
    );
  }

  static Future<dynamic>? toNavBarScreen() {
    return NavigationService.navigateAndRemoveUntil(Routes.navBarScreen);
  }

  static Future<dynamic>? toHomeScreen() {
    return NavigationService.navigateAndRemoveUntil(Routes.homeScreen);
  }

  static Future<dynamic>? toLanguageScreen() {
    return NavigationService.navigateTo(Routes.languageScreen);
  }

  static Future<dynamic>? toAddressesScreen() {
    return NavigationService.navigateTo(Routes.addressesScreen);
  }

  static Future<dynamic>? toCreateOrderScreen() {
    return NavigationService.navigateTo(Routes.createOrderScreen);
  }

  static Future<dynamic>? toServicesScreen({required int categoryId}) {
    return NavigationService.navigateTo(
      Routes.servicesScreen,
      arguments: categoryId,
    );
  }

  static Future<dynamic>? toOrderDetailsScreen({required int orderId}) {
    return NavigationService.navigateTo(
      Routes.orderDetailsScreen,
      arguments: orderId,
    );
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
