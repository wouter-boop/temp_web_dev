import 'package:flutter/material.dart';
import '../../general/type_scale.dart';

import '../../general/micro_animations.dart';
import '../../general/reveal_on_scroll.dart';

const _headingNavy = Color(0xFF16324A);
class FeatureCardData {
  final String title;
  final String description;

  const FeatureCardData({required this.title, required this.description});
}

class FeatureHighlightsSection extends StatelessWidget {
  final VoidCallback? onDiscoverPressed;

  const FeatureHighlightsSection({super.key, this.onDiscoverPressed});

  static const _cards = [
    FeatureCardData(
      title: 'Minder administratie,\nmeer overzicht',
      description: 'Administratieve taken kosten vaak onnodig veel tijd. Met Odontium worden '
          'afspraken, patiëntgegevens, declaraties en documenten centraal beheerd, '
          'waardoor u minder hoeft te zoeken en meer overzicht houdt over uw praktijk.',
    ),
    FeatureCardData(
      title: 'Alles op één\ncentrale plek',
      description: 'U hoeft niet langer te schakelen tussen verschillende programma\'s. Agenda, '
          'patiëntendossiers, communicatie, facturatie en belangrijke documenten zijn '
          'allemaal geïntegreerd in één gebruiksvriendelijk systeem.',
    ),
    FeatureCardData(
      title: 'Persoonlijke\nondersteuning',
      description: 'Bij vragen of problemen staat u er nooit alleen voor. U krijgt direct '
          'contact met een betrokken supportteam dat Odontium door en door kent en u '
          'snel verder helpt – zonder ingewikkelde ticketsystemen.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      decoration: BoxDecoration(
        color: Color.fromRGBO(224,237,244,1),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              style: TextStyle(fontSize: AppFont.h2(context), fontWeight: FontWeight.bold, color: _headingNavy, height: 1.3),
              children: [
                TextSpan(text: 'Wat '),
                TextSpan(text: 'Odontium', style: TextStyle(color: Color.fromRGBO(32,156,160,1), fontWeight: FontWeight.w900)),
                TextSpan(text: ' voor\nuw praktijk betekent.'),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [for (final data in _cards) FeatureCard(data: data)],
          ),
          const SizedBox(height: 32),
          HoverScale(
            child: OutlinedButton(
              onPressed: onDiscoverPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: _headingNavy,
                side: const BorderSide(color: _headingNavy),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Ontdek Odontium', style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final FeatureCardData data;

  const FeatureCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return HoverLift(
      child: Container(
      width: 260,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _headingNavy, height: 1.3),
          ),
          const SizedBox(height: 12),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Colors.black, height: 1.5),
          ),
        ],
      ),
      ),
    );
  }
}

