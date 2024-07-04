import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  DateTime getFirstDayOfMonth() {
    return DateTime(year, month, 1);
  }

  DateTime getLastDayOfMonth() {
    return DateTime(year, month + 1, 0);
  }

  DateTime getFirstDayOfTheWeek() {
    return subtract(Duration(days: weekday - 1));
  }

  String format({String pattern = "dd/MM/yyyy", int substring = -1}) {
    try {
      return DateFormat(pattern)
          .format(this)
          .substring(0, substring == -1 ? null : substring);
    } catch (e) {
      return "";
    }
  }

  bool isSameDay(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }

  bool isWeekend() {
    return weekday == 6 || weekday == 7;
  }

  bool isToday() {
    return isSameDay(DateTime.now());
  }

  bool isTomorrow() {
    return isSameDay(DateTime.now().add(const Duration(days: 1)));
  }

  bool isYesterday() {
    return isSameDay(DateTime.now().subtract(const Duration(days: 1)));
  }

  static List<String> getMonths({String pattern = "MMMM"}) {
    var months = <DateTime>[];
    for (var i = 1; i <= 12; i++) {
      months.add(DateTime(2021, i, 1));
    }
    return months.map((a) => a.format(pattern: pattern)).toList();
  }

  static List<String> getWeekDays({String pattern = "EEE"}) {
    var days = <DateTime>[];
    for (var i = 0; i < 7; i++) {
      days.add(DateTime.now().add(Duration(days: i)));
    }
    days.sort((a, b) => a.weekday - b.weekday);
    return days.map((a) => a.format(pattern: pattern)).toList();
  }
}
