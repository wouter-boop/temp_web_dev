import 'package:flutter/material.dart';

class HoverArrowButton extends StatefulWidget {
  const HoverArrowButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.compact = false,
  });

  final String label;
  final VoidCallback onPressed;

  /// Tighter padding, a smaller arrow and no minimum width, so the button
  /// can fill a grid cell instead of forcing its own 200px floor.
  final bool compact;

  static const _navy = Color(0xFF0F382C);
  static const _accent = Color(0xFF17A8A6);
  static const _restingBorder = Color(0xFFE1E9EC);

  @override
  State<HoverArrowButton> createState() => _HoverArrowButtonState();
}

class _HoverArrowButtonState extends State<HoverArrowButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final compact = widget.compact;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: OutlinedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(Colors.white),
          foregroundColor: const WidgetStatePropertyAll(HoverArrowButton._navy),
          padding: WidgetStatePropertyAll(
            compact
                ? const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
                : const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          ),
          // Compact buttons live in grids where the cell sets the width, so
          // they must not impose a minimum of their own.
          minimumSize: compact ? const WidgetStatePropertyAll(Size(0, 44)) : null,
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(compact ? 10 : 12)),
          ),
          side: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return const BorderSide(color: HoverArrowButton._accent, width: 1.5);
            }
            return BorderSide(
              color: compact ? HoverArrowButton._restingBorder : Colors.transparent,
              width: compact ? 1 : 1.5,
            );
          }),
          elevation: WidgetStateProperty.resolveWith((states) {
            if (!states.contains(WidgetState.hovered)) return compact ? 1.0 : 0.0;
            return compact ? 6.0 : 10.0;
          }),
          shadowColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return HoverArrowButton._accent.withValues(alpha: 0.35);
            }
            return compact ? Colors.black.withValues(alpha: 0.10) : Colors.transparent;
          }),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: compact ? 0 : 200),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  widget.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: compact ? 13.5 : null,
                  ),
                ),
              ),
              SizedBox(width: compact ? 10 : 8),
              AnimatedSlide(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                offset: _hovering ? const Offset(0.15, 0) : Offset.zero,
                child: Icon(
                  Icons.arrow_right_alt,
                  size: compact ? 20 : 32,
                  color: _hovering ? HoverArrowButton._accent : HoverArrowButton._navy,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
