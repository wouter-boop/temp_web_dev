import 'package:flutter/material.dart';

class FadeCarousel extends StatefulWidget {
  final List<Widget> items;

  const FadeCarousel({super.key, required this.items});

  @override
  State<FadeCarousel> createState() => _FadeCarouselState();
}

class _FadeCarouselState extends State<FadeCarousel> {
  int _currentIndex = 0;

  void _nextSlide() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.items.length;
    });
  }

  void _previousSlide() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + widget.items.length) % widget.items.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton.filledTonal(
          icon: const Icon(Icons.arrow_back, size: 32),
          onPressed: _previousSlide,
        ),
        const SizedBox(width: 32),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: KeyedSubtree(
              key: ValueKey<int>(_currentIndex),
              child: widget.items[_currentIndex],
            ),
          ),
        ),
        const SizedBox(width: 32),
        IconButton.filledTonal(
          icon: const Icon(Icons.arrow_forward, size: 32),
          onPressed: _nextSlide,
        ),
      ],
    );
  }
}
