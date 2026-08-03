import 'package:project_2/core/storage/app_storage.dart';

/// This map for translation
const Map<String, Map<String, String>> messages = {
  'ar': {
    'field_required': 'اسم المستخدم لا يمكن أن يكون فارغًا.',
    'username_min_length': 'اسم المستخدم يجب أن يكون 3 أحرف على الأقل.',
    'username_max_length': 'اسم المستخدم لا يمكن أن يزيد عن 255 حرفًا.',
  },
  'en': {
    'field_required': 'Username cannot be empty.',
    'username_min_length': 'Username must be at least 3 characters long.',
    'username_max_length': 'Username cannot be more than 255 characters long.',
  },
};

/// [UsernameValidator]
/// This class is responsible about the validation in `username` TextField
class UsernameValidator {
  static String? validate(String? value) {
    final String locale = AppStorage.getLocale; // Fetch the user's locale
    value = value?.trim();

    if (value == null || value.isEmpty) {
      return messages[locale]!['field_required'];
    } else if (value.length < 3) {
      return messages[locale]!['username_min_length'];
    } else if (value.length > 255) {
      return messages[locale]!['username_max_length'];
    }
    return null;
  }
}
