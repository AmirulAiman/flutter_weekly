import 'package:flutter/material.dart';
import 'package:weekly/core/constants/app_strings.dart';
import 'package:weekly/core/widgets/menu_item.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  static final _weekdays = AppStrings.dayFullNames;
  static final _months = AppStrings.months;

  String _fullDate(DateTime d) =>
      '${_weekdays[d.weekday - 1]}, ${_months[d.month - 1]} ${d.day} ${d.year}';

  void _showMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Navigator.of(context).overlay!.context.findRenderObject() as RenderBox;
    final offset = button.localToGlobal(
      Offset(button.size.width, button.size.height),
      ancestor: overlay,
    );
    final position = RelativeRect.fromLTRB(offset.dx - 90, offset.dy + 4, offset.dx, offset.dy + 4);

    showMenu<String>(
      context: context,
      position: position,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      items: const [
        PopupMenuItem(
          value: 'profile',
          child: MenuItem(icon: Icons.person_outline, label: 'Profile'),
        ),
        PopupMenuItem(
          value: 'logout',
          child: MenuItem(icon: Icons.settings_outlined, label: 'Settings'),
        ),
      ],
    ).then((value) {
      if (value == null) return;
      if (value == 'profile') null;
      if (value == 'logout') null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Weekly',
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
          Builder(
            builder: (ctx) => InkWell(
              onTap: () => _showMenu(ctx),
              borderRadius: BorderRadius.circular(20),
              child: const Padding(
                padding: EdgeInsets.all(6),
                child: Icon(Icons.more_vert, size: 22, color: Color(0xFF444444)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
