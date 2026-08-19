import 'package:auto_scrolling/auto_scrolling.dart';
import 'package:flutter/material.dart';

/// Page-level scroll view with middle-mouse-button auto-scrolling.
///
/// Wraps a [SingleChildScrollView] in an [AutoScroll], giving both the same
/// [ScrollController]. Pass [controller] when the page needs programmatic
/// scrolling (the caller keeps ownership and disposes it); otherwise this
/// widget creates and disposes its own.
class AutoScrollView extends StatefulWidget {
  const AutoScrollView({
    super.key,
    this.controller,
    this.padding,
    required this.child,
  });

  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  @override
  State<AutoScrollView> createState() => _AutoScrollViewState();
}

class _AutoScrollViewState extends State<AutoScrollView> {
  ScrollController? _ownController;

  ScrollController get _controller =>
      widget.controller ?? (_ownController ??= ScrollController());

  @override
  void dispose() {
    _ownController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoScroll(
      controller: _controller,
      child: SingleChildScrollView(
        controller: _controller,
        padding: widget.padding,
        child: widget.child,
      ),
    );
  }
}
