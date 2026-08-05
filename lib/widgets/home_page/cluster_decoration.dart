import 'dart:math' as math;

import 'package:flutter/material.dart';

enum ClusterSide { left, right }

class _ClusterPiece {
  final String asset;
  final double topFraction;
  final double overhang;

  const _ClusterPiece({required this.asset, required this.topFraction, required this.overhang});
}

/// Three overlapping accent squares cascading down one edge of the parent
/// [Stack]. Size and position are derived from that Stack's own constraints
/// (via [LayoutBuilder]), not the device screen, so the layout holds up
/// whatever size container it's dropped into.
class ClusterDecoration extends StatelessWidget {
  final ClusterSide side;
  final double scale;
  final double verticalOffset;

  const ClusterDecoration({
    super.key,
    this.side = ClusterSide.right,
    this.scale = 2.0,
    this.verticalOffset = 0.0,
  });

  static const _pieces = [
    _ClusterPiece(asset: "lib/assets/rect_licht.png", topFraction: 0.35, overhang: 0.4),
    _ClusterPiece(asset: "lib/assets/rect_groen.png", topFraction: 0.4, overhang: 0.1),
    _ClusterPiece(asset: "lib/assets/rect_donker.png", topFraction: 0.45, overhang: 0.6),
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = (constraints.maxWidth * 0.1 * scale).clamp(40.0 * scale, 140.0 * scale);
          final maxTop = math.max(0.0, constraints.maxHeight - size);
          return Stack(
            clipBehavior: Clip.none,
            children: [
              for (final piece in _pieces)
                Positioned(
                  top: (piece.topFraction * constraints.maxHeight + verticalOffset).clamp(0.0, maxTop),
                  left: side == ClusterSide.left ? -piece.overhang * size : null,
                  right: side == ClusterSide.right ? -piece.overhang * size : null,
                  width: size,
                  height: size,
                  child: Image.asset(piece.asset, fit: BoxFit.fill),
                ),
            ],
          );
        },
      ),
    );
  }
}





