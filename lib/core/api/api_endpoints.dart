/// [ApiEndpoints]
/// Contains the endpoints for the API used in the app.
class ApiEndpoints {
  /// [TEST]
  static const String testEndpoint = 'test';
  static String testEndpointByAttribute({required Object id}) =>
      'test/$id/test(maybe)';
}
