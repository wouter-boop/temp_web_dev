import 'package:flutter/material.dart';

class ArrowButton extends StatefulWidget {
  const ArrowButton({super.key, required this.text, required this.function, this.white = false});

  final String text;
  final Function function;
  final bool white;

  @override
  State<ArrowButton> createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final baseColor = widget.white ? Colors.white : const Color(0xFF0F382C);
    // On hover the outline fills with the base color and the text/arrow
    // invert, with the arrow nudging forward.
    final contentColor = _hovering
        ? (widget.white ? const Color(0xFF0F382C) : Colors.white)
        : baseColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: OutlinedButton(
        onPressed: () => {widget.function()},
        style: OutlinedButton.styleFrom(
          foregroundColor: contentColor,
          backgroundColor: _hovering ? baseColor : Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          side: BorderSide(color: baseColor, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            AnimatedSlide(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              offset: _hovering ? const Offset(0.25, 0) : Offset.zero,
              child: const Icon(Icons.arrow_forward, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
