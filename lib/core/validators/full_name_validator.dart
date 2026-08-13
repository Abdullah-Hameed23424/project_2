import 'package:project_2/core/storage/app_storage.dart';

const Map<String, Map<String, String>> messages = {
  'ar': {
    'field_required': 'الاسم الكامل لا يمكن أن يكون فارغًا.',
    'fullname_invalid': 'يرجى إدخال الاسم الكامل.',
  },
  'en': {
    'field_required': 'Full name cannot be empty.',
    'fullname_invalid': 'Please enter your full name.',
  },
};

class FullNameValidator {
  static String? validate(String? value) {
    final String locale = AppStorage.getLocale;
    value = value?.trim();

    if (value == null || value.isEmpty) {
      return messages[locale]!['field_required'];
    }

    final parts = value.split(RegExp(r'\s+'));

    if (parts.length < 2) {
      return messages[locale]!['fullname_invalid'];
    }

    return null;
  }
}
