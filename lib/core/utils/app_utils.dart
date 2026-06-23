import 'package:weekly/core/constants/app_strings.dart';

class AppUtilities {
  static Map<String, DateTime> weekdays({DateTime? date}) {
    final currentDate = date ?? DateTime.now();

    final daysSinceSunday = currentDate.weekday % 7;
    final startOfWeek = currentDate.subtract(Duration(days: daysSinceSunday));
    final weekStart = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
    final weekEnd = weekStart.add(const Duration(days: 6));
    return {"start": weekStart, "end": weekEnd};
  }

  static String formattedDate(DateTime d) {
    final months = AppStrings.monthFullNames;
    final h = d.hour > 12 ? d.hour - 12 : (d.hour == 0 ? 12 : d.hour);
    final m = d.minute.toString().padLeft(2, '0');
    final period = d.hour >= 12 ? 'pm' : 'am';
    return '${months[d.month - 1]} ${d.day}, ${d.year}  —  $h:$m$period';
  }
}
