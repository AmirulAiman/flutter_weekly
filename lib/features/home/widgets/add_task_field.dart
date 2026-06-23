import 'package:flutter/material.dart';

class AddTaskField extends StatelessWidget {
  final ValueChanged<String> onSubmitted;
  const AddTaskField({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: TextField(
        style: const TextStyle(color: Colors.white, fontSize: 14),
        decoration: const InputDecoration(
          hintText: 'Add a new task...',
          hintStyle: TextStyle(color: Color(0xFF555555), fontSize: 14),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
