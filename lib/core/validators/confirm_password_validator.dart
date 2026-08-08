import 'package:project_2/core/storage/app_storage.dart';

const Map<String, Map<String, String>> confirmPasswordMessages = {
  'ar': {
    'required': 'تأكيد كلمة المرور لا يمكن أن يكون فارغاً.',
    'not_match': 'كلمتا المرور غير متطابقتين.',
  },
  'en': {'required': 'cannot be empty', 'not_match': 'passwords do not match'},
};

class ConfirmPasswordValidator {
  static String? validate(String? value, String? password) {
    final String locale = AppStorage.getLocale;
    final confirmPassword = value?.trim();

    if (confirmPassword == null || confirmPassword.isEmpty) {
      return confirmPasswordMessages[locale]!['required'];
    }

    if (confirmPassword != password) {
      return confirmPasswordMessages[locale]!['not_match'];
    }

    return null;
  }
}
