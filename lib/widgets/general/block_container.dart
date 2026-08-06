import 'package:flutter/material.dart';

class BlockContainer extends StatelessWidget {
  const BlockContainer({
    super.key,
    required this.child,
    this.height,
    this.backgroundColor = const Color(0xFFF8F9FB),
    this.gradient,
    this.padding = const EdgeInsets.symmetric(horizontal: 48, vertical: 72),
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
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double maxContentWidth;
  final Alignment alignment;
  final double screenWidthFactor;
  final bool hasHorizontalPadding;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
            ? padding
            : EdgeInsets.symmetric(horizontal: 0, vertical: padding.vertical),
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