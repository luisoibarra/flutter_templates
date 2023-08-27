import 'package:intl/intl.dart';

abstract class Formatters {
  static String formatDate(DateTime date) {
    return DateFormat.yMd().format(date);
  }

  static DateTime? tryParseDate(String value) {
    try {
      return DateFormat.yMd().parseStrict(value);
    } catch (e) {
      return null;
    }
  }
}
