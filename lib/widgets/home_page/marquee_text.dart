import 'package:flutter/material.dart';

class TextMarquee extends StatefulWidget {
  const TextMarquee({
    super.key,
    required this.children,
    this.itemWidth = 200,
    this.itemHeight, // Added optional height (defaults to intrinsic height)
    this.spacing = 32,
    this.speed = 30,
    this.hoverScale = 1.03,
  });

  final List<String> children;
  final double itemWidth;
  final double? itemHeight;
  final double spacing;
  final double speed;
  final double hoverScale;

  @override
  State<TextMarquee> createState() => _TextMarqueeState();
}

class _TextMarqueeState extends State<TextMarquee> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  int _hoverCount = 0;

  double get _itemExtent => widget.itemWidth + widget.spacing * 2;
  double get _singleSetWidth => widget.children.length * _itemExtent;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController.unbounded(vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _start();
    });
  }

  void _start() {
    if (!mounted || widget.children.isEmpty || _hoverCount > 0) return;

    final duration = Duration(
      milliseconds: ((_singleSetWidth / widget.speed) * 1000).round(),
    );

    _controller.repeat(min: 0, max: _singleSetWidth, period: duration);
  }

  void _onItemHoverChanged(bool hovered) {
    if (hovered) {
      _hoverCount++;
      _controller.stop();
    } else {
      _hoverCount = (_hoverCount - 1).clamp(0, 999);

      if (_hoverCount == 0) {
        _start();
      }
    }
  }

  @override
  void didUpdateWidget(covariant TextMarquee oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.children.length != widget.children.length ||
        oldWidget.itemWidth != widget.itemWidth ||
        oldWidget.spacing != widget.spacing ||
        oldWidget.speed != widget.speed) {
      _controller.stop();
      _start();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final item in widget.children)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.spacing, vertical: 0),
            child: Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 16), child: Text(
              item,
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Segoe UI",
                fontWeight: FontWeight.bold,
                color: Colors.black54
              ),
            ))
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.children.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final offset = -(_controller.value % _singleSetWidth);

          return Transform.translate(
            offset: Offset(offset, 0),
            child: OverflowBox(
              alignment: Alignment.centerLeft,
              minWidth: 0,
              maxWidth: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [_buildRow(), _buildRow()],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MarqueeItemContainer extends StatefulWidget {
  const _MarqueeItemContainer({
    required this.width,
    this.height,
    required this.hoverScale,
    required this.onHoverChanged,
    required this.child,
  });

  final double width;
  final double? height;
  final double hoverScale;
  final ValueChanged<bool> onHoverChanged;
  final Widget child;

  @override
  State<_MarqueeItemContainer> createState() => _MarqueeItemContainerState();
}

class _MarqueeItemContainerState extends State<_MarqueeItemContainer> {
  bool _hovered = false;

  void _setHovered(bool hovered) {
    if (_hovered == hovered) return;

    setState(() => _hovered = hovered);
    widget.onHoverChanged(hovered);
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()
          ..translate(0.0, _hovered ? -8.0 : 0.0)
          ..scale(_hovered ? widget.hoverScale : 1.0),
        transformAlignment: Alignment.center,
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _hovered ? primary : Colors.black12,
            width: 1.4,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _hovered ? .12 : .05),
              blurRadius: _hovered ? 24 : 10,
              offset: Offset(0, _hovered ? 12 : 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}