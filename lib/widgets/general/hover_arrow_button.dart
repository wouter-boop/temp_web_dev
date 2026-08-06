import 'package:flutter/material.dart';

class HoverArrowButton extends StatelessWidget {
  const HoverArrowButton({super.key, required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  static const _navy = Color(0xFF0F382C);
  static const _accent = Color(0xFF17A8A6);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        foregroundColor: const WidgetStatePropertyAll(_navy),
        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 24, vertical: 18)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        side: WidgetStateProperty.resolveWith((states) {
          return BorderSide(
            color: states.contains(WidgetState.hovered) ? _accent : Colors.transparent,
            width: 1.5,
          );
        }),
        elevation: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.hovered) ? 10.0 : 0.0;
        }),
        shadowColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.hovered)
              ? _accent.withValues(alpha: 0.35)
              : Colors.transparent;
        }),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 200),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
            const Icon(Icons.arrow_right_alt, size: 32),
          ],
        ),
      ),
    );
  }
}
