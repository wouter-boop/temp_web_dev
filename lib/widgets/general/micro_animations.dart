import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Scales its child up slightly while hovered. The go-to micro-interaction
/// for buttons, chips and badges.
class HoverScale extends StatefulWidget {
  const HoverScale({
    super.key,
    required this.child,
    this.scale = 1.04,
    this.duration = const Duration(milliseconds: 180),
  });

  final Widget child;
  final double scale;
  final Duration duration;

  @override
  State<HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? widget.scale : 1.0,
        duration: widget.duration,
        curve: Curves.easeOutCubic,
        child: widget.child,
      ),
    );
  }
}

/// A soft, continuously breathing glow behind its child. Use sparingly on
/// the one primary CTA per screen you want the eye drawn to.
class PulseGlow extends StatefulWidget {
  const PulseGlow({
    super.key,
    required this.child,
    this.color = const Color(0xFF17A8A6),
    this.borderRadius = 30,
    this.duration = const Duration(milliseconds: 1800),
  });

  final Widget child;
  final Color color;
  final double borderRadius;
  final Duration duration;

  @override
  State<PulseGlow> createState() => _PulseGlowState();
}

class _PulseGlowState extends State<PulseGlow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = Curves.easeInOut.transform(_controller.value);
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: [
              BoxShadow(
                color: widget.color.withValues(alpha: 0.15 + 0.20 * t),
                blurRadius: 8 + 14 * t,
                spreadRadius: 1 + 2 * t,
              ),
            ],
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

/// Gives its child a short, gentle rotational wiggle every [interval] to
/// draw attention. Each instance staggers its own start so multiple wiggles
/// on one page never fire in lockstep.
class Wiggle extends StatefulWidget {
  const Wiggle({
    super.key,
    required this.child,
    this.angle = 0.06,
    this.interval = const Duration(seconds: 4),
  });

  final Widget child;

  /// Maximum rotation in radians (0.06 ≈ 3.5°).
  final double angle;
  final Duration interval;

  @override
  State<Wiggle> createState() => _WiggleState();
}

class _WiggleState extends State<Wiggle> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 650),
  );
  late final Animation<double> _swing = TweenSequence<double>([
    TweenSequenceItem(tween: Tween(begin: 0, end: 1), weight: 1),
    TweenSequenceItem(tween: Tween(begin: 1, end: -1), weight: 2),
    TweenSequenceItem(tween: Tween(begin: -1, end: 0.5), weight: 2),
    TweenSequenceItem(tween: Tween(begin: 0.5, end: 0), weight: 1),
  ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  Timer? _startTimer;
  Timer? _repeatTimer;

  @override
  void initState() {
    super.initState();
    // Desynchronize instances: start after a pseudo-random slice of the
    // interval so a row of icons ripples instead of jerking in unison.
    final offsetMs = identityHashCode(this) % widget.interval.inMilliseconds;
    _startTimer = Timer(Duration(milliseconds: 600 + offsetMs), () {
      _kick();
      _repeatTimer = Timer.periodic(widget.interval, (_) => _kick());
    });
  }

  void _kick() {
    if (mounted) _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _startTimer?.cancel();
    _repeatTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _swing,
      builder: (context, child) => Transform.rotate(
        angle: _swing.value * widget.angle,
        child: child,
      ),
      child: widget.child,
    );
  }
}

/// Slowly drifts its child up and down forever — ambient motion for
/// decorative shapes and illustrations. [phase] (0..1) offsets the cycle so
/// sibling elements float out of sync.
class Floating extends StatefulWidget {
  const Floating({
    super.key,
    required this.child,
    this.amplitude = 6,
    this.duration = const Duration(milliseconds: 3200),
    this.phase = 0,
  });

  final Widget child;
  final double amplitude;
  final Duration duration;
  final double phase;

  @override
  State<Floating> createState() => _FloatingState();
}

class _FloatingState extends State<Floating>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..repeat();

  @override
  void initState() {
    super.initState();
    _controller.value = widget.phase % 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(
          0,
          math.sin(_controller.value * 2 * math.pi) * widget.amplitude,
        ),
        child: child,
      ),
      child: widget.child,
    );
  }
}

/// Number that counts up from zero to [target] the first time it scrolls
/// into view (mirroring [RevealOnScroll]'s trigger). Renders as
/// `prefix + value + suffix`, so "99.99%" is `target: 99.99, decimals: 2,
/// suffix: "%"`.
class AnimatedCount extends StatefulWidget {
  const AnimatedCount({
    super.key,
    required this.target,
    this.decimals = 0,
    this.prefix = '',
    this.suffix = '',
    this.duration = const Duration(milliseconds: 1400),
    this.curve = Curves.easeOutCubic,
    this.style,
    this.textAlign,
  });

  final double target;
  final int decimals;
  final String prefix;
  final String suffix;
  final Duration duration;
  final Curve curve;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  State<AnimatedCount> createState() => _AnimatedCountState();
}

class _AnimatedCountState extends State<AnimatedCount>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );
  ScrollPosition? _position;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _attach());
  }

  void _attach() {
    if (!mounted) return;
    _position = Scrollable.maybeOf(context)?.position;
    if (_position == null) {
      _start();
      return;
    }
    _position!.addListener(_check);
    _check();
  }

  void _check() {
    if (_started || !mounted) return;
    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.attached || !renderObject.hasSize) return;
    final viewportHeight = MediaQuery.of(context).size.height;
    final top = renderObject.localToGlobal(Offset.zero).dy;
    if (top < viewportHeight * 0.9) _start();
  }

  void _start() {
    if (_started) return;
    _started = true;
    _position?.removeListener(_check);
    _controller.forward();
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
      builder: (context, _) {
        final t = widget.curve.transform(_controller.value);
        final value = widget.target * t;
        return Text(
          '${widget.prefix}${value.toStringAsFixed(widget.decimals)}${widget.suffix}',
          style: widget.style,
          textAlign: widget.textAlign,
        );
      },
    );
  }
}

/// Circular progress ring that refills with an ease-in-out sweep every time
/// [trigger] changes (and once on first build). Draw attention to a swap —
/// e.g. the selected certificate on the security page.
class ProgressRing extends StatefulWidget {
  const ProgressRing({
    super.key,
    required this.trigger,
    required this.child,
    this.color = const Color(0xFF17A8A6),
    this.trackColor = const Color(0xFFD8EAE4),
    this.strokeWidth = 3.5,
    this.gap = 10,
    this.duration = const Duration(milliseconds: 900),
  });

  /// Any value; when it changes the ring animates from empty to full again.
  final Object trigger;
  final Widget child;
  final Color color;
  final Color trackColor;
  final double strokeWidth;

  /// Space between the child and the ring.
  final double gap;
  final Duration duration;

  @override
  State<ProgressRing> createState() => _ProgressRingState();
}

class _ProgressRingState extends State<ProgressRing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..forward();

  @override
  void didUpdateWidget(covariant ProgressRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.trigger != widget.trigger) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => CustomPaint(
        painter: _RingPainter(
          progress: Curves.easeInOutCubic.transform(_controller.value),
          color: widget.color,
          trackColor: widget.trackColor,
          strokeWidth: widget.strokeWidth,
        ),
        child: Padding(
          padding: EdgeInsets.all(widget.gap + widget.strokeWidth),
          child: child,
        ),
      ),
      child: widget.child,
    );
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color trackColor;
  final double strokeWidth;

  _RingPainter({
    required this.progress,
    required this.color,
    required this.trackColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - strokeWidth / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final track = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth * 0.8;
    canvas.drawCircle(center, radius, track);

    if (progress <= 0) return;

    const startAngle = -math.pi / 2;
    final sweep = progress * 2 * math.pi;
    final arc = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, startAngle, sweep, false, arc);

    // Glowing dot at the head of the arc while it travels.
    if (progress < 1) {
      final headAngle = startAngle + sweep;
      final head = center + Offset(math.cos(headAngle), math.sin(headAngle)) * radius;
      canvas.drawCircle(
        head,
        strokeWidth * 1.6,
        Paint()..color = color.withValues(alpha: 0.25),
      );
      canvas.drawCircle(head, strokeWidth * 0.9, Paint()..color = color);
    }
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.color != color ||
      oldDelegate.trackColor != trackColor;
}
