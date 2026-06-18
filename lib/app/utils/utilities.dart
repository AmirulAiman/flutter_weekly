import 'package:weekly/app/constants/month_strings.dart';

class Utilities {
  static String isoDate(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  static DateTime mondayFor(int offset) {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    return monday.add(Duration(days: offset * 7));
  }

  static Map<String, String> getCurrentWeekRange({DateTime? date}) {
    final today = date ?? DateTime.now();
    final daySinceSunday = today.weekday == 7 ? 0 : today.weekday;
    final firstDay = today.subtract(Duration(days: daySinceSunday));
    final lastDay = firstDay.add(const Duration(days: 6));
    String fmt(DateTime date) =>
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    return {'start': fmt(firstDay), 'end': fmt(lastDay)};
  }

  static String formattedDate(DateTime d) {
    final months = MonthStrings.monthFullNames;
    final h = d.hour > 12 ? d.hour - 12 : (d.hour == 0 ? 12 : d.hour);
    final m = d.minute.toString().padLeft(2, '0');
    final period = d.hour >= 12 ? 'pm' : 'am';
    return '${months[d.month - 1]} ${d.day}, ${d.year}  —  $h:$m$period';
  }
}
