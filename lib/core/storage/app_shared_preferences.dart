import 'package:feature_based_with_mvvm/core/helper/cache_helper.dart';

/// [AppSharedPreferences]
/// A helper class for managing application-specific shared preferences.
class AppSharedPreferences {
  /// [token]
  static String token = 'token';
  static String get getToken => CacheHelper.getData(key: token) ?? 'no token';
  static saveToken(String value) =>
      CacheHelper.saveData(key: token, value: value);
  static bool get hasToken => CacheHelper.contains(token);
  static Future<void> removeToken() async =>
      await CacheHelper.removeData(key: token);

  /// [uid]
  static String uid = 'uid';
  static int get getMyId => CacheHelper.getData(key: uid) ?? 0;
  static saveMyId(int value) => CacheHelper.saveData(key: uid, value: value);
  static bool get hasMyId => CacheHelper.contains(uid);
  static void removeMyId() => CacheHelper.removeData(key: uid);

  /// [temp]
  static const String temp = 'temp';
  static String get getTemp => CacheHelper.getData(key: temp) ?? 'ar';
  static saveTemp(String value) =>
      CacheHelper.saveData(key: temp, value: value);
  static bool get hasTemp => CacheHelper.contains(temp);
  static void removeTemp() => CacheHelper.removeData(key: temp);
}
