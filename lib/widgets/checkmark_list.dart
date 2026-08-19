import 'package:flutter/material.dart';

class FeatureChecklist extends StatelessWidget {
  final List<String> items;
  final double spacing;
  final double runSpacing;

  const FeatureChecklist({
    super.key,
    required this.items,
    this.spacing = 28,
    this.runSpacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: spacing,
      runSpacing: runSpacing,
      children: [
        for (final item in items) _ChecklistItem(label: item),
      ],
    );
  }
}

/// One checkmark entry; on hover the check pops and the label tints teal.
class _ChecklistItem extends StatefulWidget {
  const _ChecklistItem({required this.label});

  final String label;

  @override
  State<_ChecklistItem> createState() => _ChecklistItemState();
}

class _ChecklistItemState extends State<_ChecklistItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedScale(
            scale: _hovering ? 1.35 : 1.0,
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutBack,
            child: Icon(
              Icons.check_circle,
              size: 18,
              color: _hovering ? Colors.tealAccent : Color(0xFF83d4d4),
            ),
          ),
          const SizedBox(width: 8),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 180),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: _hovering ? const Color(0xFF0F3B3F) : Colors.black,
            ),
            child: Text(widget.label),
          ),
        ],
      ),
    );
  }
}
