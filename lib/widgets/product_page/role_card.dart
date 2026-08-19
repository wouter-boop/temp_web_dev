import 'package:flutter/material.dart';
import '../general/type_scale.dart';

class RoleCardData {
  final IconData icon;
  final String title;
  final String description;

  /// Per-role accent used for the icon badge, hover border/glow and the
  /// underline; defaults to the site teal.
  final Color accentColor;

  const RoleCardData({
    required this.icon,
    required this.title,
    required this.description,
    this.accentColor = const Color(0xFF17A8A6),
  });
}

/// Role tile on the product page. Sizing is left to the parent (the 2x2
/// grid hands out widths), so the card just fills what it's given.
///
/// Hover: lifts with an accent-tinted glow and border, the icon badge pops,
/// and the accent underline stretches out.
class RoleCard extends StatefulWidget {
  final RoleCardData data;

  const RoleCard({super.key, required this.data});

  @override
  State<RoleCard> createState() => _RoleCardState();
}

class _RoleCardState extends State<RoleCard> {
  static const _navy = Color(0xFF16324A);
  static const _darkTeal = Color(0xFF0F3B3F);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final accent = widget.data.accentColor;
    final badgeGradientEnd = Color.lerp(accent, _darkTeal, 0.45)!;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _hovering ? -6 : 0, 0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _hovering ? accent.withValues(alpha: 0.55) : Colors.transparent,
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: _hovering
                  ? accent.withValues(alpha: 0.28)
                  : Colors.black.withValues(alpha: 0.06),
              blurRadius: _hovering ? 22 : 12,
              offset: Offset(0, _hovering ? 12 : 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedScale(
                  scale: _hovering ? 1.15 : 1.0,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutBack,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [accent, badgeGradientEnd],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: accent.withValues(alpha: _hovering ? 0.45 : 0.3),
                          blurRadius: _hovering ? 14 : 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(widget.data.icon, size: 22, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    widget.data.title,
                    style: TextStyle(fontSize: AppFont.h3(context), fontWeight: FontWeight.bold, color: _navy),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              widget.data.description,
              style: const TextStyle(fontSize: 14, color: Color(0xFF6B6B6B), height: 1.5),
            ),
            const SizedBox(height: 14),
            // Accent underline stretches on hover.
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              height: 3,
              width: _hovering ? 64 : 26,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
