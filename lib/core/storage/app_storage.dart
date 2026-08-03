import 'package:feature_based_with_mvvm/core/helper/cache_helper.dart';
import 'package:feature_based_with_mvvm/core/helper/secure_storage_helper.dart';

class AppStorage {
  /// [token]
  static String token = 'token';
  static Future<String?> get getToken async =>
      await SecureStorageHelper.readData(key: token);
  static Future<void> saveToken(String value) async =>
      await SecureStorageHelper.writeData(key: token, value: value);
  static Future<bool> get hasToken async =>
      await SecureStorageHelper.containsKey(key: token);
  static Future<void> removeToken() async =>
      await SecureStorageHelper.deleteData(key: token);

  /// [role]
  static String role = 'role';
  static String get getRole => CacheHelper.getData(key: role) ?? 'user';
  static saveRole(String value) =>
      CacheHelper.saveData(key: role, value: value);
  static bool get hasRole => CacheHelper.contains(role);
  static void removeRole() => CacheHelper.removeData(key: role);

  /// [actualRoleKey]
  /// We use this to know if the user is a provider even when they are in user mode
  static String actualRoleKey = 'actual_role';
  static String get getActualRole =>
      CacheHelper.getData(key: actualRoleKey) ?? 'user';
  static saveActualRole(String value) =>
      CacheHelper.saveData(key: actualRoleKey, value: value);
  static bool get hasActualRole => CacheHelper.contains(actualRoleKey);
  static void removeActualRole() => CacheHelper.removeData(key: actualRoleKey);

  /// [locale]
  static const String locale = 'locale';
  static String get getLocale => CacheHelper.getData(key: locale) ?? 'ar';
  static saveLocale(String value) =>
      CacheHelper.saveData(key: locale, value: value);
  static bool get hasLocale => CacheHelper.contains(locale);
  static void removeLocale() => CacheHelper.removeData(key: locale);

  /// [myId]
  static String myId = 'my-id';
  static int get getMyId => CacheHelper.getData(key: myId) ?? 0;
  static saveMyId(int value) => CacheHelper.saveData(key: myId, value: value);
  static bool get hasMyId => CacheHelper.contains(myId);
  static void removeMyId() => CacheHelper.removeData(key: myId);

  /// [isGuestKey]
  static String isGuestKey = 'is_guest';
  static bool get isGuest => CacheHelper.getData(key: isGuestKey) ?? false;
  static saveIsGuest(bool value) =>
      CacheHelper.saveData(key: isGuestKey, value: value);
  static void removeIsGuest() => CacheHelper.removeData(key: isGuestKey);
}
