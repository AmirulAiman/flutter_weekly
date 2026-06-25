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
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Center(child: Image.asset('assets/icons/launcher.png')),
    );
  }
}
