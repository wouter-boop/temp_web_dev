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
        for (final item in items)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, size: 18, color: Colors.tealAccent),
              const SizedBox(width: 8),
              Text(
                item,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.black),
              ),
            ],
          ),
      ],
    );
  }
}