import 'package:flutter/material.dart';

const _darkTeal = Color(0xFF0F3B3F);
const _teal = Color(0xFF17A8A6);

/// A white bordered card listing checkmark bullets under an icon + title.
/// Used for side-by-side "who does what" comparisons (e.g. "Wat wij doen" vs
/// "Wat wij van u vragen"). At rest both cards look identical with a neutral
/// border; hovering lifts the card and colors the border.
class ResponsibilityCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final List<String> bullets;

  const ResponsibilityCard({
    super.key,
    required this.icon,
    required this.title,
    required this.bullets,
  });

  @override
  State<ResponsibilityCard> createState() => _ResponsibilityCardState();
}

class _ResponsibilityCardState extends State<ResponsibilityCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _hovering ? -4 : 0, 0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _hovering ? _teal : _darkTeal.withValues(alpha: 0.2),
            width: _hovering ? 1.5 : 1,
          ),
          boxShadow: _hovering
              ? [BoxShadow(color: _teal.withValues(alpha: 0.22), blurRadius: 18, offset: const Offset(0, 8))]
              : const [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(color: _darkTeal, borderRadius: BorderRadius.circular(10)),
                  child: Icon(widget.icon, size: 18, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _darkTeal),
                ),
              ],
            ),
            const SizedBox(height: 16),
            for (final bullet in widget.bullets)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check, size: 15, color: _teal),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(bullet, style: const TextStyle(fontSize: 13, color: Colors.black87)),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
