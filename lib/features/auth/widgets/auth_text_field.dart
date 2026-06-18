import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isObscure;
  final String label;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
    );
  }
}
