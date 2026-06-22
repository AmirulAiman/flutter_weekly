class AppUtils {
  static Map<String, String> weekdays({DateTime? date}) {
    final currentDate = date ?? DateTime.now();

    final daysSinceSunday = currentDate.weekday % 7;
    final startOfWeek = currentDate.subtract(Duration(days: daysSinceSunday));
    final weekStart = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
    final weekEnd = weekStart.add(const Duration(days: 6));
    return {"start": weekStart.toIso8601String(), "end": weekEnd.toIso8601String()};
  }
}
