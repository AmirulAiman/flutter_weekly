import 'package:flutter/material.dart';

class AddTaskField extends StatefulWidget {
  final ValueChanged<String> onSubmitted;
  const AddTaskField({super.key, required this.onSubmitted});

  @override
  State<AddTaskField> createState() => _AddTaskFieldState();
}

class _AddTaskFieldState extends State<AddTaskField> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: TextField(
        controller: _textController,
        style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Add a new task...',
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 14),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
        onSubmitted: (value) {
          if (value.trim().isEmpty) {
            return;
          }
          widget.onSubmitted(value);
        },
      ),
    );
  }
}
