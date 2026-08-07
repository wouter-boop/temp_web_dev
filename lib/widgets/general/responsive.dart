import 'package:flutter/material.dart';

/// Shared breakpoints so every page agrees on what counts as "mobile".
///
/// mobile   : < 700   (phones)
/// tablet   : 700–999 (small tablets, split-view windows)
/// desktop  : >= 1000 (laptops, 1080p, 4K — content width is then capped by
///            BlockContainer.maxContentWidth so it never stretches edge to
///            edge on very wide screens)
const double kMobileBreakpoint = 700;
const double kTabletBreakpoint = 1000;

enum ScreenSize { mobile, tablet, desktop }

ScreenSize screenSizeOf(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < kMobileBreakpoint) return ScreenSize.mobile;
  if (width < kTabletBreakpoint) return ScreenSize.tablet;
  return ScreenSize.desktop;
}

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < kMobileBreakpoint;

bool isTablet(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return width >= kMobileBreakpoint && width < kTabletBreakpoint;
}

bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= kTabletBreakpoint;

/// Picks a value based on the current breakpoint, falling back to the next
/// coarser tier when a tier isn't specified (mobile falls back to tablet,
/// then desktop).
T responsiveValue<T>(
  BuildContext context, {
  required T desktop,
  T? tablet,
  T? mobile,
}) {
  switch (screenSizeOf(context)) {
    case ScreenSize.mobile:
      return mobile ?? tablet ?? desktop;
    case ScreenSize.tablet:
      return tablet ?? desktop;
    case ScreenSize.desktop:
      return desktop;
  }
}
