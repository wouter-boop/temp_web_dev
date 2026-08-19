import 'package:flutter/material.dart';

import '../general/responsive.dart';

class FAQItem {
  final String question;
  final String answer;

  const FAQItem({required this.question, required this.answer});
}

class FAQSection extends StatelessWidget {
  const FAQSection({
    super.key,
    required this.items,
    this.title = "Veelgestelde vragen",
    this.titleFontSize = 48,
    this.showTitle = true,
    this.useChevronIcon = false,
    this.showTopDivider = false,
    this.trailing,
  });

  final String title;
  final List<FAQItem> items;
  final double titleFontSize;
  final bool showTitle;
  final bool useChevronIcon;
  final bool showTopDivider;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final effectiveTitleFontSize = isMobile(context)
        ? (titleFontSize < 28 ? titleFontSize : 28.0)
        : titleFontSize;

    return Column(
      children: [
        if (showTitle) ...[
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: effectiveTitleFontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0B4A53),
            ),
          ),
          SizedBox(height: isMobile(context) ? 32 : 56),
        ],
        if (showTopDivider) const Divider(height: 1, thickness: 1, color: Color(0xFF7FA5AF)),
        ...items.map((e) => _FAQTile(item: e, useChevronIcon: useChevronIcon)),
        if (trailing != null) ...[
          const SizedBox(height: 32),
          trailing!,
        ],
      ],
    );
  }
}

class _FAQTile extends StatefulWidget {
  const _FAQTile({required this.item, this.useChevronIcon = false});

  final FAQItem item;
  final bool useChevronIcon;

  @override
  State<_FAQTile> createState() => _FAQTileState();
}

class _FAQTileState extends State<_FAQTile>
    with SingleTickerProviderStateMixin {
  bool expanded = false;
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => setState(() => expanded = !expanded),
          onHover: (hovering) => setState(() => _hovering = hovering),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            decoration: BoxDecoration(
              color: _hovering ? const Color(0xFF17A8A6).withValues(alpha: 0.06) : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.only(
              top: 22,
              bottom: 22,
              right: 8,
              left: _hovering ? 14 : 4,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.item.question,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: _hovering ? FontWeight.w600 : FontWeight.w400,
                      color: _hovering ? const Color(0xFF0F3B3F) : const Color(0xFF222222),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                AnimatedRotation(
                  turns: widget.useChevronIcon
                      ? (expanded ? 0.5 : 0)
                      : (expanded ? 0.125 : 0),
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    widget.useChevronIcon
                        ? Icons.keyboard_arrow_down
                        : (expanded ? Icons.remove : Icons.add),
                    size: widget.useChevronIcon ? 24 : 28,
                    color: const Color(0xFF20343A),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 250),
          crossFadeState: expanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: const SizedBox.shrink(),
          secondChild: Padding(
            padding: const EdgeInsets.only(bottom: 24, right: 48),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.item.answer,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.7,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
        const Divider(height: 1, thickness: 1, color: Color(0xFF7FA5AF)),
      ],
    );
  }
}
