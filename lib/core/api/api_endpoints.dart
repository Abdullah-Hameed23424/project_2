/// [ApiEndpoints]
/// Contains the endpoints for the API used in the app.
class ApiEndpoints {
  /// [Auth]
  static const String login = 'auth/login';
  static const String forgetPasswd = 'auth/password/forgot';

  static const String testEndpoint = 'test';
  static String testEndpointByAttribute({required Object id}) =>
      'test/$id/test(maybe)';
}
