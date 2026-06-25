import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;

  const SocialButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 76,
        height: 52,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Theme.of(context).colorScheme.onPrimary, width: 1.2),
        ),
        child: Center(child: icon),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Facebook "f" icon (inline painted)
// ─────────────────────────────────────────────
class FacebookIcon extends StatelessWidget {
  const FacebookIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: const BoxDecoration(color: Color(0xFF1877F2), shape: BoxShape.circle),
      child: const Center(
        child: Text(
          'f',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Google "G" icon (coloured letters)
// ─────────────────────────────────────────────
class GoogleIcon extends StatelessWidget {
  const GoogleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 26, height: 26, child: CustomPaint(painter: _GooglePainter()));
  }
}

class _GooglePainter extends CustomPainter {
  const _GooglePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width / 2;

    // Draw coloured quadrant arcs to approximate the Google logo
    final segments = [
      const Color(0xFF4285F4), // blue (right)
      const Color(0xFF34A853), // green (bottom)
      const Color(0xFFFBBC05), // yellow (left)
      const Color(0xFFEA4335), // red (top)
    ];

    for (int i = 0; i < 4; i++) {
      final paint = Paint()
        ..color = segments[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: r - 1.5),
        (-90 + i * 90) * 3.14159 / 180,
        85 * 3.14159 / 180,
        false,
        paint,
      );
    }

    // White bar (the horizontal bar of G)
    final barPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(cx, cy - 2, r - 1, 4), barPaint);

    // Blue fill for right half of circle to match
    final bluePaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(cx, cy - 2, r - 1, 4), bluePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─────────────────────────────────────────────
// Apple icon (system icon approximation)
// ─────────────────────────────────────────────
class AppleIcon extends StatelessWidget {
  const AppleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.apple, size: 26, color: Color(0xFF1A1A1A));
  }
}
