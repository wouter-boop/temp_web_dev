import 'package:flutter/material.dart';

import 'feature_card.dart';

class FeatureSection extends StatelessWidget {
  FeatureSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.cards,
  });

  final String title;
  final String subtitle;
  final List<FeatureCard> cards;
  final Color darkGreen = Color.fromRGBO(7,87,89,1);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 900;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(
                height: 3,
                width: 30,
                decoration: BoxDecoration(
                  color: darkGreen,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(width: 12),
              Text("DE OUDE MANIER", style: TextStyle(letterSpacing: 3, fontWeight: FontWeight.bold, color: darkGreen),)
            ]),
            SizedBox(height: isMobile ? 8 : 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 750),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: isMobile ? 34 : 46,
                  fontWeight: FontWeight(1000),
                  fontFamily: 'Segoe UI',
                  height: 1.15,
                ),
              ),
            ),

            SizedBox(height: isMobile ? 32 : 48),

            // ConstrainedBox(
            //   constraints: const BoxConstraints(maxWidth: 850),
            //   child: Text(
            //     subtitle,
            //     style: TextStyle(
            //       fontSize: isMobile ? 18 : 22,
            //       color: Colors.grey.shade700,
            //       height: 1.6,
            //     ),
            //   ),
            // ),
            //
            // SizedBox(height: isMobile ? 32 : 48),

            Wrap(
              spacing: 32,
              runSpacing: 32,
              children: cards
                  .map(
                    (card) => SizedBox(
                      width: isMobile
                          ? double.infinity
                          : (constraints.maxWidth - 64) / 3,
                      child: card,
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
