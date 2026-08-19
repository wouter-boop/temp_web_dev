import 'package:flutter/material.dart';

/// Fades and slides its child into view the first time it is scrolled into
/// the viewport. Renders the child immediately (invisible) so layout is
/// unaffected; the animation runs exactly once.
///
/// Wrap any section that should "arrive" as the visitor scrolls:
///
/// ```dart
/// RevealOnScroll(child: FeatureHighlightsSection(...))
/// ```
class RevealOnScroll extends StatefulWidget {
  const RevealOnScroll({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.delay = Duration.zero,
    this.offset = const Offset(0, 40),
    this.curve = Curves.easeOutCubic,
    this.visibleFraction = 0.9,
  });

  final Widget child;
  final Duration duration;

  /// Extra wait after the widget becomes visible, for staggering siblings.
  final Duration delay;

  /// Starting translation in logical pixels (slides to zero).
  final Offset offset;
  final Curve curve;

  /// The widget reveals once its top edge passes this fraction of the
  /// viewport height (0.9 = 90% down the screen).
  final double visibleFraction;

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );
  ScrollPosition? _position;
  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _attach());
  }

  void _attach() {
    if (!mounted) return;
    _position = Scrollable.maybeOf(context)?.position;
    if (_position == null) {
      // Not inside a scrollable: just play the animation.
      _reveal();
      return;
    }
    _position!.addListener(_check);
    _check();
  }

  void _check() {
    if (_revealed || !mounted) return;
    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.attached || !renderObject.hasSize) return;

    final viewportHeight = MediaQuery.of(context).size.height;
    final top = renderObject.localToGlobal(Offset.zero).dy;
    if (top < viewportHeight * widget.visibleFraction) {
      _reveal();
    }
  }

  void _reveal() {
    if (_revealed) return;
    _revealed = true;
    _position?.removeListener(_check);
    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _position?.removeListener(_check);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = widget.curve.transform(_controller.value);
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(
              widget.offset.dx * (1 - t),
              widget.offset.dy * (1 - t),
            ),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

/// A lightweight hover lift for cards: translates up and adds a soft shadow
/// while the pointer is over the child. Purely decorative — taps pass through.
class HoverLift extends StatefulWidget {
  const HoverLift({
    super.key,
    required this.child,
    this.lift = 6,
    this.borderRadius = 18,
  });

  final Widget child;
  final double lift;
  final double borderRadius;

  @override
  State<HoverLift> createState() => _HoverLiftState();
}

class _HoverLiftState extends State<HoverLift> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _hovering ? -widget.lift : 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.10),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : const [],
        ),
        child: widget.child,
      ),
    );
  }
}
