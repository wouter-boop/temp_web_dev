import 'package:flutter/material.dart';

import 'responsive.dart';

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final effectivePadding = padding ??
        (isMobile(context)
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 40)
            : const EdgeInsets.symmetric(horizontal: 48, vertical: 72));

    return Container(
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
            : EdgeInsets.symmetric(horizontal: 0, vertical: effectivePadding.vertical),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth * screenWidthFactor,
          ),
          child: child,
        ),
      ),
    );
  }
}