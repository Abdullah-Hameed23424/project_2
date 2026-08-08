/// [Routes]
/// A class that defines the application's route names as static constants.
class Routes {
  /// [Startup]
  static const String splashScreen = '/';

  /// [Auth]
  static const String loginScreen = '/loginScreen';
  static const String forgetPasswdScreen = '/forgetPasswdScreen';
  static const String otpScreen = '/otpScreen';
  static const String resetPasswdScreen = '/resetPasswdScreen';

  /// [Home]
  static const String homeScreen = '/homeScreen';
}

/// [NOTE]
/// Just splash screen start with only /, because the splash screen is the first screen to be displayed when the app starts, and it doesn't require any additional path or parameters. The other routes start with / because they are accessed through navigation and may have additional parameters or paths.
