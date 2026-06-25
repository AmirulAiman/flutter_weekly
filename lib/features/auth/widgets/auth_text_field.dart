import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final String placeholder;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const AuthTextField({
    super.key,
    required this.placeholder,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary, width: 1.2),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword && _obscure,
        keyboardType: widget.keyboardType,
        style: const TextStyle(
          fontSize: 14.5,
          color: Color(0xFF1A1A1A),
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: widget.placeholder,
          hintStyle: const TextStyle(
            color: Color(0xFFB0B0B0),
            fontSize: 14.5,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 18),
          border: InputBorder.none,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () => setState(() => _obscure = !_obscure),
                )
              : null,
        ),
      ),
    );
  }
}
