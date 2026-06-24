import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({super.key, required this.label, this.isExpanded = false});
  final String label;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 15,
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
