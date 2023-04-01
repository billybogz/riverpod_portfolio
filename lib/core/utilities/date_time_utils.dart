import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatStringDate(
    String dateString, {
    bool hasTime = true,
    DateFormat? dateFormat,
    bool convertToPHT = false,
  }) {
    if (dateString.isEmpty) return '';
    DateFormat format =
        hasTime ? DateFormat.yMEd().add_jms() : DateFormat.yMEd();
    String newDateString = dateFormat == null
        ? format.format(DateTime.parse(dateString))
        : convertToPHT
            ? dateFormat.format(DateTime.parse(dateString).add(const Duration(
                hours: 8,
              ),),)
            : dateFormat.format(DateTime.parse(dateString));
    return newDateString;
  }
}
