import 'package:flutter/material.dart';

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
  });

  final String title;
  final List<FAQItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0B4A53),
          ),
        ),
        const SizedBox(height: 56),
        ...items.map((e) => _FAQTile(item: e)),
      ],
    );
  }
}

class _FAQTile extends StatefulWidget {
  const _FAQTile({required this.item});

  final FAQItem item;

  @override
  State<_FAQTile> createState() => _FAQTileState();
}

class _FAQTileState extends State<_FAQTile>
    with SingleTickerProviderStateMixin {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => setState(() => expanded = !expanded),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 22),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.item.question,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF222222),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                AnimatedRotation(
                  turns: expanded ? 0.125 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    expanded ? Icons.remove : Icons.add,
                    size: 28,
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
