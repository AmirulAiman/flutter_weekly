import 'package:flutter/widgets.dart';
import 'package:weekly/app/constants/day_strings.dart';
import 'package:weekly/app/constants/month_strings.dart';

class EventHeader extends StatelessWidget {
  const EventHeader({super.key});

  static final _weekdays = DayStrings.dayFullNames;
  static final _months = MonthStrings.months;

  String _fullDate(DateTime d) =>
      '${_weekdays[d.weekday - 1]}, ${_months[d.month - 1]} ${d.day} ${d.year} ';

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Planner',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF888888),
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _fullDate(now),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
