import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String text;
  const CustomDivider({super.key, this.text = 'Or Register with'});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Theme.of(context).colorScheme.onSurface, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.5,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(child: Divider(color: Theme.of(context).colorScheme.primary, thickness: 1)),
      ],
    );
  }
}
