import 'package:flutter/material.dart';

// ─────────────────────────────────────────────
// Logo mark (cursive "L" in a light circle)
// ─────────────────────────────────────────────
class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'ℒ',
          style: TextStyle(
            fontSize: 26,
            fontFamily: 'Georgia',
            fontStyle: FontStyle.italic,
            color: Color(0xFF444444),
            height: 1,
          ),
        ),
      ),
    );
  }
}
