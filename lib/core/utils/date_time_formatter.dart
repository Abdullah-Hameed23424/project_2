// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class DateTimeFormatter {
  DateTimeFormatter._();

  /// [TIME]

  ///
  ///

  /// [24:59]
  static String formatTimeHM(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  /// [24:59:59]
  static String formatTimeHMS(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }

  /// [DATA]
  /// [24 APR]
  static String formatDateDayMonthShort(DateTime dateTime) {
    return DateFormat('dd MMM', 'en').format(dateTime).toUpperCase();
  }

  /// [24/04/2026]
  static String formatDateDMYSplashed(DateTime? date) {
    if (date == null) return '';
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatDateDMYDashed(DateTime? date) {
    if (date == null) return '';
    return DateFormat('yyyy-MM-dd').format(date);
  }

  /// [FULL]
  /// As [الجمعة 30-01-2025 , 20:30 AM]
  static String formatFullDateWithTime(DateTime dateTime) {
    final date = DateFormat('dd-MM-yyyy').format(dateTime); // 30-01-2025
    final time = DateFormat('hh:mm a').format(dateTime); // 08:30 AM
    return '$date , $time';
  }

  static String formatFullWithMemSad(DateTime dateTime) {
    final DateFormat formatter = DateFormat(
      'dd-MM-yyyy, HH:mm',
      'ar',
    );
    final String formatted = formatter.format(dateTime);
    final String period = dateTime.hour >= 12 ? 'م' : 'ص';
    return '$formatted $period';
  }

  static String formatDateTimeCreative(DateTime dateTime) {
    return DateFormat('h:mm a - dd MMM', 'en').format(dateTime).toUpperCase();
  }
}
