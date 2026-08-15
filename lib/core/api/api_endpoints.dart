/// [ApiEndpoints]
/// Contains the endpoints for the API used in the app.
class ApiEndpoints {
  /// [Auth]
  static const String login = 'auth/login';
  static const String signUp = 'auth/register/start';
  static const String completeSignUpInfo = 'auth/register/client';
  static const String forgetPasswd = 'auth/password/forgot';
  static const String verifyOtp = 'auth';
  static const String resetPasswd = 'auth/password/reset';

  /// [Home]
  static const String categories = 'categories';

  /// [Profile]
  static const String profile = 'auth/me';

  static const String testEndpoint = 'test';
  static String testEndpointByAttribute({required Object id}) =>
      'test/$id/test(maybe)';
}
