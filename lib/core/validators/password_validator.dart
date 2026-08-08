import 'package:project_2/core/storage/app_storage.dart';

const Map<String, Map<String, String>> messages = {
  'ar': {
    'field_required': 'كلمة المرور لا يمكن أن تكون فارغة.',
    'password_min_length': 'كلمة المرور يجب أن تكون 8 أحرف على الأقل.',
  },
  'en': {
    'field_required': 'cannot be empty',
    'password_min_length': 'must be at least 8 characters',
  },
};

class PasswordValidator {
  static String? validate(String? value) {
    final String locale = AppStorage.getLocale;
    value = value?.trim();

    if (value == null || value.isEmpty) {
      return messages[locale]!['field_required'];
    } else if (value.length < 8) {
      return messages[locale]!['password_min_length'];
    }

    return null;
  }
}
