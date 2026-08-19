import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'responsive.dart';

/// Fraction of the viewport the centered content column occupies on desktop.
const double kContentWidthFactor = 0.78;

/// Ceiling for that column. Without it, 78% of a 4K screen would be ~3000px
/// and body text would run far past a comfortable reading measure.
const double kContentMaxWidth = 1760;

/// Comfortable measure for a single column of running text (~70-80 chars).
/// Paragraphs and FAQ lists should stay near this even inside a wide
/// [ContentContainer].
const double kProseMaxWidth = 720;

/// Width the content column is never squeezed below by [ContentContainer.padding].
const double kMinContentWidth = 280;

/// Width of the centred content column, and the horizontal inset actually used.
///
/// [padding] is clamped so it can never consume the column: a 400px inset on a
/// 375px phone would otherwise leave nothing to lay out in, collapsing every
/// section to a sliver. At least [kMinContentWidth] always survives.
({double width, double inset}) contentColumnMetrics({
  required double available,
  required double limit,
  required double padding,
}) {
  if (!available.isFinite) {
    return (width: limit, inset: padding.clamp(0.0, double.infinity));
  }
  final maxInset = math.max(0.0, (available - kMinContentWidth) / 2);
  final inset = padding.clamp(0.0, maxInset);
  return (width: math.min(limit, available - inset * 2), inset: inset);
}

/// The [BlockContainer.screenWidthFactor] that yields the same width as a
/// [ContentContainer], for sections that constrain through the block itself
/// rather than wrapping their content in a shell widget.
///
/// `screenWidth * factor == min(78% of screenWidth, kContentMaxWidth)`.
double contentWidthFactor(BuildContext context) {
  if (!isDesktop(context)) return 1;
  final screenWidth = MediaQuery.sizeOf(context).width;
  return math.min(kContentWidthFactor, kContentMaxWidth / screenWidth);
}

/// The site's shared content column: centered, `min(78% of viewport, 1760px)`
/// wide on desktop, and full width (minus the section's gutters) below the
/// desktop breakpoint.
///
/// Use this as the *single* shell inside a [BlockContainer] — the block stays
/// full-bleed so its background or gradient reaches both screen edges, while
/// every section's content lines up on one common left/right edge:
///
/// ```dart
/// BlockContainer(
///   screenWidthFactor: 1,
///   child: ContentContainer(child: ...),
/// )
/// ```
///
/// Nested prose still wants its own narrower cap ([kProseMaxWidth]); this
/// widget is for the section shell, not for paragraphs.
class ContentContainer extends StatelessWidget {
  const ContentContainer({
    super.key,
    required this.child,
    this.maxWidth = kContentMaxWidth,
    this.widthFactor = kContentWidthFactor,
    this.alignment = Alignment.center,
    this.padding = 0,
  });

  final Widget child;

  /// Extra horizontal inset *inside* the column, on top of the gutters
  /// [BlockContainer] already applies. Defaults to none; it is clamped against
  /// the available width (see [contentColumnMetrics]) so a large value degrades
  /// instead of collapsing the layout on a narrow screen.
  final double padding;
  /// Override the ceiling for sections that should stay tighter.
  final double maxWidth;
  final double widthFactor;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    // Below desktop the layout has already reflowed to fewer columns, so the
    // content should use whatever width the section's padding leaves it
    // rather than shrinking to a percentage of a narrow screen.
    final limit = isDesktop(context)
        ? math.min(MediaQuery.sizeOf(context).width * widthFactor, maxWidth)
        : double.infinity;

    return LayoutBuilder(
      builder: (context, constraints) {
        // The column is sized *tightly* rather than shrink-wrapped: content
        // must fill the full column width so that left-aligned children in
        // different sections share one left edge. Shrink-wrapping would
        // centre each section on its own intrinsic width, so a section with
        // four cards would sit further left than one with two.
        final metrics = contentColumnMetrics(
          available: constraints.maxWidth,
          limit: limit,
          padding: padding,
        );

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: metrics.inset),
          child: Align(
            alignment: alignment,
            child: SizedBox(
              width: metrics.width.isFinite ? metrics.width : null,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
