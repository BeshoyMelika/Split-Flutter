import 'package:intl/intl.dart';

class AppDateFormat {
  static DateFormat appDateFormat(String local) {
    return DateFormat.yMMMMEEEEd(local);
  }

  static DateFormat appDateDayMonthYearFormat(String local) {
    return DateFormat("d MMM,yyy", local);
  }

  static DateFormat appDateMonthDayYearFormat(String local) {
    return DateFormat("MMM d,yyy", local);
  }

  static String formattingDate(DateTime date, String local) {
    return appDateFormat(local).format(date);
  }

  static String formattingDateDayMonthYear(DateTime date, String local) {
    return appDateDayMonthYearFormat(local).format(date);
  }

  static String formattingDateMonthDayYear(DateTime date, String local) {
    return appDateMonthDayYearFormat(local).format(date);
  }

  static String tryFormattingDate(DateTime? date, String local) {
    try {
      return appDateFormat(local).format(date!);
    } catch (e) {
      return "";
    }
  }

  static String formattingTime(DateTime date, String local) {
    return DateFormat.jm(local).format(date);
  }

  static String formattingDateTime(DateTime date, String local) {
    return appDateFormat(local).add_jm().format(date);
  }
}
