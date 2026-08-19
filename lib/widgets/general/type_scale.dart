import 'package:flutter/material.dart';

import 'responsive.dart';

/// The canonical steps of the content type scale, at the authored (1080p)
/// tier. [FluidTypeScale] grows these toward the 4K spec, so the numbers here
/// are 4K-size / 1.25.
///
/// Mobile is a separate, tighter tier rather than a single ratio: headings have
/// to compress far harder than body text on a phone (a 52px hero at a phone's
/// proportional factor would leave body text at ~10px).
///
/// |        | mobile | 1080p | 4K |
/// |--------|--------|-------|----|
/// | h1     | 32     | 52    | 64 |
/// | h2     | 26     | 40    | 50 |
/// | h3     | 20     | 24    | 30 |
/// | text1  | 16     | 20    | 25 |
/// | text2  | 14     | 16    | 20 |
class AppFont {
  const AppFont._();

  /// Page hero title.
  static double h1(BuildContext c) => isMobile(c) ? 32 : 52;

  /// Major section heading.
  static double h2(BuildContext c) => isMobile(c) ? 26 : 40;

  /// Sub-heading or card title.
  static double h3(BuildContext c) => isMobile(c) ? 20 : 24;

  /// Lead / intro paragraph.
  static double text1(BuildContext c) => isMobile(c) ? 16 : 20;

  /// Body copy.
  static double text2(BuildContext c) => isMobile(c) ? 14 : 16;
}

/// Fluid typography.
///
/// The design type scale is specified for 4K:
///
/// | role      | 4K size |
/// |-----------|---------|
/// | Heading 1 | 64      |
/// | Heading 2 | 50      |
/// | Heading 3 | 30      |
/// | Text 1    | 25      |
/// | Text 2    | 20      |
///
/// The widgets in this app were authored at the 1080p tier — 52 / 40 / 24 /
/// 20 / 16 — which is that scale divided by exactly 1.25. So rather than
/// rewriting ~270 individual `fontSize` literals (and losing the carefully
/// tuned per-widget mobile sizes in the process), the whole app's text is
/// multiplied by a single viewport-driven factor:
///
///  * at or below [kTypeScaleBaseWidth] (1080p) the factor is 1.0, i.e. the
///    authored sizes, with each widget's own mobile sizes handling phones;
///  * from there it ramps up to [kTypeScaleMax] at [kTypeScaleMaxWidth] (4K),
///    where the scale lands on the spec;
///  * beyond 4K it stays clamped at the spec.
///
/// Because it works through [MediaQuery.textScaler], every `Text` in the tree
/// follows it and the existing hierarchy is preserved proportionally.
const double kTypeScaleBaseWidth = 1920;
const double kTypeScaleMaxWidth = 3840;
const double kTypeScaleMax = 1.25;

/// The text multiplier for a given viewport width.
double typeScaleFactor(double screenWidth) {
  if (screenWidth <= kTypeScaleBaseWidth) return 1;
  final t = ((screenWidth - kTypeScaleBaseWidth) /
          (kTypeScaleMaxWidth - kTypeScaleBaseWidth))
      .clamp(0.0, 1.0);
  return 1 + (kTypeScaleMax - 1) * t;
}

/// The factor currently in effect, for the few components whose box is a fixed
/// size and therefore has to grow with its text (see `_FlipCard`).
double typeScaleOf(BuildContext context) =>
    typeScaleFactor(MediaQuery.sizeOf(context).width);

/// Applies [typeScaleFactor] to everything below it by composing with — rather
/// than replacing — the inherited scaler, so an OS/browser accessibility text
/// setting still takes effect on top of the design scale.
class FluidTypeScale extends StatelessWidget {
  const FluidTypeScale({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final factor = typeScaleFactor(media.size.width);

    if (factor == 1) return child;

    return MediaQuery(
      data: media.copyWith(
        textScaler: _ScaledBy(media.textScaler, factor),
      ),
      child: child,
    );
  }
}

class _ScaledBy extends TextScaler {
  const _ScaledBy(this.inner, this.factor);

  final TextScaler inner;
  final double factor;

  @override
  double scale(double fontSize) => inner.scale(fontSize) * factor;

  @override
  double get textScaleFactor => inner.textScaleFactor * factor;
}
