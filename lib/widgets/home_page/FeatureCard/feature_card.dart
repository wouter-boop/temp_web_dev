import 'package:flutter/material.dart';

class FeatureCard extends StatefulWidget {
  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.onTap,
    this.color = const Color(0xFFF6F7F9),
  });

  final String title;
  final String description;
  final IconData icon;
  final VoidCallback? onTap;
  final Color color;

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, hovering ? -8 : 0, 0),
          height: 270,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: hovering ? primary : Colors.black12,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: hovering ? .12 : .05),
                blurRadius: hovering ? 28 : 14,
                offset: Offset(0, hovering ? 16 : 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: hovering
                      ? primary.withValues(alpha: .12)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  widget.icon,
                  color: hovering ? primary : Colors.black87,
                ),
              ),

              const Spacer(),

              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: hovering ? primary : Colors.black,
                ),
                child: Text(widget.title),
              ),

              const SizedBox(height: 14),

              Text(
                widget.description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.55,
                  color: Colors.grey.shade700,
                ),
              ),

              const Spacer(),

              Row(
                children: [
                  Text(
                    "Meer informatie",
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(width: 8),

                  AnimatedSlide(
                    duration: const Duration(milliseconds: 200),
                    offset: hovering ? const Offset(.25, 0) : Offset.zero,
                    child: Icon(Icons.arrow_forward_rounded, color: primary),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
