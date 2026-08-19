import 'package:flutter/material.dart';

import 'responsive.dart';
import 'section_edges.dart';

class BlockContainer extends StatelessWidget {
  const BlockContainer({
    super.key,
    required this.child,
    this.height,
    this.backgroundColor = const Color(0xFFF8F9FB),
    this.gradient,
    this.padding,
    this.margin = EdgeInsets.zero,
    this.maxContentWidth = 1400,
    this.alignment = Alignment.center,
    this.screenWidthFactor = 0.5,
    this.hasHorizontalPadding = true,
    this.softTopEdge,
    this.softBottomEdge,
    this.softEdgeHeight = 48,
  });

  final Widget child;

  final double? height;

  final Color backgroundColor;
  final Gradient? gradient;

  /// Falls back to a mobile-aware default (tighter horizontal/vertical
  /// padding under [kMobileBreakpoint]) when not explicitly set.
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry margin;

  final double maxContentWidth;
  final Alignment alignment;
  final double screenWidthFactor;
  final bool hasHorizontalPadding;

  /// When set, the section's top (resp. bottom) edge is feathered into this
  /// color over [softEdgeHeight] pixels — pass the background color of the
  /// neighboring section to avoid a harsh seam against strongly colored or
  /// gradient sections.
  final Color? softTopEdge;
  final Color? softBottomEdge;
  final double softEdgeHeight;

  Widget _edgeFade(Color color, {required bool top}) {
    return Positioned(
      top: top ? 0 : null,
      bottom: top ? null : 0,
      left: 0,
      right: 0,
      height: softEdgeHeight,
      child: IgnorePointer(
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: BoxBorder.all(color: Colors.transparent),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: top
                  ? [color, color.withValues(alpha: 0)]
                  : [color.withValues(alpha: 0), color],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final effectivePadding = padding ??
        (isMobile(context)
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 40)
            : const EdgeInsets.symmetric(horizontal: 48, vertical: 72));

    final section = Container(
      width: double.infinity,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: gradient == null ? backgroundColor : null,
        gradient: gradient,
      ),
      alignment: alignment,
      child: Padding(
        padding: hasHorizontalPadding
            ? effectivePadding
            : EdgeInsets.symmetric(
            horizontal: 0, vertical: effectivePadding.vertical),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth * screenWidthFactor,
          ),
          child: child,
        ),
      ),
    );

    if (softTopEdge == null && softBottomEdge == null) return section;

    // The feather is opt-in (see [softSectionEdges]). Listening here rather
    // than reading the value once means toggling it restyles every section
    // live, without a reload.
    return ValueListenableBuilder<bool>(
      valueListenable: softSectionEdges,
      builder: (context, enabled, _) {
        if (!enabled) return section;

        return Stack(
          children: [
            section,
            if (softTopEdge != null) _edgeFade(softTopEdge!, top: true),
            if (softBottomEdge != null) _edgeFade(softBottomEdge!, top: false),
          ],
        );
      },
    );
  }
}