import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:project_2/core/storage/app_storage.dart';

const Map<String, Map<String, String>> messages = {
  'ar': {
    'field_required': 'رقم الهاتف لا يمكن أن يكون فارغًا.',
    'invalid_phone': 'رقم الهاتف غير صالح.',
  },
  'en': {
    'field_required': 'Phone number cannot be empty.',
    'invalid_phone': 'Invalid phone number.',
  },
};

class PhoneValidator {
  static String? validate(String? value, {required IsoCode country}) {
    final String locale = AppStorage.getLocale;
    value = value?.trim();

    if (value == null || value.isEmpty) {
      return messages[locale]!['field_required'];
    }

    try {
      final phone = PhoneNumber.parse(value, destinationCountry: country);

      if (!phone.isValid()) {
        return messages[locale]!['invalid_phone'];
      }

      return null;
    } catch (_) {
      return messages[locale]!['invalid_phone'];
    }
  }
}
