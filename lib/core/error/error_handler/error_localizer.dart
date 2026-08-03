import 'package:project_2/core/error/error_handler/app_error_type.dart';
import 'package:project_2/core/storage/app_storage.dart';

/// [ErrorLocalizer]
/// Provides localized error messages based on the [AppErrorType].
class ErrorLocalizer {
  static const _messages = {
    'ar': {
      AppErrorType.unknown: 'حدث خطأ غير متوقع',
      AppErrorType.connectionTimeout: 'الخادم غير متاح',
      AppErrorType.sendTimeout: 'انتهت مهلة الاتصال',
      AppErrorType.receiveTimeout: 'الخادم غير متاح ):',
      AppErrorType.serverDown: 'الخادم غير متوفر حالياً ):',
      AppErrorType.serverError: 'حدث خطأ في المخدّم ):',
      AppErrorType.unauthorized: 'الوصول غير مصرح به',
      AppErrorType.cancelled: 'تم إلغاء الطلب',
      AppErrorType.internet: 'تحقق من اتصالك بالإنترنت',
      AppErrorType.certificate: 'خطأ في الشهادة',
      AppErrorType.connection: 'خطأ في الاتصال',
      AppErrorType.notFound: 'غير موجود',
      AppErrorType.forbidden: '403 ممنوع',
    },
    'en': {
      AppErrorType.unknown: 'An unknown error occurred',
      AppErrorType.connectionTimeout: 'Server unavailable',
      AppErrorType.sendTimeout: 'Send timeout',
      AppErrorType.receiveTimeout: 'Server unavailable',
      AppErrorType.serverDown: 'Server is currently down',
      AppErrorType.serverError: 'Server error occurred',
      AppErrorType.unauthorized: 'Unauthorized access',
      AppErrorType.validation: 'Validation error',
      AppErrorType.cancelled: 'Request cancelled',
      AppErrorType.internet: 'Check your internet connection',
      AppErrorType.certificate: 'Certificate error',
      AppErrorType.connection: 'Connection error',
      AppErrorType.badRequest: 'Bad request',
      AppErrorType.notFound: 'Not found',
      AppErrorType.forbidden: '403 forbidden',
    },
  };

  static String message(AppErrorType type) {
    final locale = AppStorage.getLocale;
    return _messages[locale]?[type] ??
        _messages['en']?[type] ??
        _messages['en']![AppErrorType.unknown]!;
  }
}
