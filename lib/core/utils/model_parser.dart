import 'package:feature_based_with_mvvm/core/storage/app_storage.dart';

/// [MODEL_PARSER]
/// This class is responsible for parsing and converting dynamic values into specific data types.
class ModelParser {
  /// [CONVERTING_TO_INT]
  static int intValue(dynamic value, {int defaultValue = 0}) {
    if (value == null) return defaultValue;
    if (value is int) return value;
    return int.tryParse(value.toString()) ?? defaultValue;
  }

  /// [CONVERTING_TO_DOUBLE]
  static double doubleValue(dynamic value, {double defaultValue = 0.0}) {
    if (value == null) return defaultValue;
    if (value is double) return value;
    return double.tryParse(value.toString()) ?? defaultValue;
  }

  /// [CONVERTING_TO_STRING]
  static String stringValue(dynamic value, {String defaultValue = ''}) {
    if (value == null) return defaultValue;
    if (value is Map?) {
      /// Check for language-specific keys in the map
      final String language = AppStorage.getLocale;
      final val = language == 'ar' ? (value?['ar']) : (value?['en']);
      return val != null ? val.toString() : defaultValue;
    }
    return value.toString();
  }

  /// [CONVERTING_TO_BOOLEAN]
  static bool boolValue(dynamic value, {bool defaultValue = false}) {
    if (value == null) return defaultValue;
    if (value is bool) return value;
    if (value is int) return value == 1;
    if (value is String) {
      return value == '1' ||
              value == 'yes' ||
              value == 'Yes' ||
              value == 'YES' ||
              value == 'ok' ||
              value == 'Ok' ||
              value == 'OK' ||
              value == 'true'
          ? true
          : false;
    }
    return defaultValue;
  }

  /// [CONVERTING_TO_DATETIME]
  static DateTime dateTimeValue(dynamic value, {DateTime? defaultValue}) {
    if (value == null) {
      return defaultValue ?? DateTime.now();
    }

    if (value is DateTime) return value;

    return DateTime.tryParse(value.toString()) ??
        defaultValue ??
        DateTime.now();
  }

  /// [CONVERTING_TO_LIST_OF_STRINGS]
  static List<T> listValue<T>(
    dynamic value, {
    required T Function(Map<String, dynamic>) defaultValue,
  }) {
    if (value == null || value is! List) return [];
    return value.map((e) {
      if (e is Map) {
        final Map<String, dynamic> map = {};
        e.forEach((k, v) {
          map[k.toString()] = v;
        });
        return defaultValue(map);
      }
      return defaultValue({});
    }).toList();
  }

  /// [CONVERTING_TO_LIST_OF_STRINGS]
  static List<String> listStringValue(dynamic value) {
    if (value == null) return [];

    List<String> results = [];

    if (value is List) {
      for (var item in value) {
        String s = item.toString().trim();
        if (s.isEmpty || s.toLowerCase() == 'null') continue;
        // Even if it's a list, some items might be comma-separated strings
        if (s.contains(',')) {
          results.addAll(
            s.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty),
          );
        } else {
          results.add(s);
        }
      }
    } else if (value is String && value.isNotEmpty) {
      String content = value.trim();
      if (content.startsWith('[') && content.endsWith(']')) {
        content = content.substring(1, content.length - 1);
      }
      results.addAll(
        content
            .split(',')
            .map((e) => e.trim().replaceAll('"', '').replaceAll("'", ""))
            .where((e) => e.isNotEmpty),
      );
    }

    return results.toSet().toList(); // Remove duplicates
  }

  /// [CONVERTING_TO_MAP]
  static Map<String, dynamic> mapValue(dynamic value) {
    final Map<String, dynamic> result = {};
    if (value != null && value is Map) {
      value.forEach((k, v) {
        result[k.toString()] = v;
      });
    }
    return result;
  }
}
