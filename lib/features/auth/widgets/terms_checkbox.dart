import 'package:flutter/material.dart';

class TermsCheckbox extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  const TermsCheckbox({super.key, this.onChanged});

  @override
  State<TermsCheckbox> createState() => _TermsCheckboxState();
}

class _TermsCheckboxState extends State<TermsCheckbox> {
  bool _checked = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() => _checked = !_checked);
            widget.onChanged?.call(_checked);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: _checked ? Theme.of(context).colorScheme.primary : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: _checked ? Theme.of(context).colorScheme.onPrimary : const Color(0xFFCCCCCC),
                width: 1.5,
              ),
            ),
            child: _checked ? const Icon(Icons.check, color: Colors.white, size: 13) : null,
          ),
        ),
        const SizedBox(width: 10),
        const Text.rich(
          TextSpan(
            text: 'I accept the ',
            style: TextStyle(fontSize: 13, color: Color(0xFF555555)),
            children: [
              TextSpan(
                text: 'terms and privacy policy',
                style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF1A1A1A)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
