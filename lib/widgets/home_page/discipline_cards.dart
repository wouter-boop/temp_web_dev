import 'package:flutter/material.dart';

class DisciplineCardData {
    final String imageAsset;
  final String title;
  final List<String> items;

  DisciplineCardData({required this.imageAsset, required this.title, required this.items});
}

class DisciplineShowcaseSection extends StatelessWidget {
  final VoidCallback? onViewFeaturesPressed;
  DisciplineShowcaseSection({super.key, this.onViewFeaturesPressed});

  static final _cards = [
    DisciplineCardData(
      imageAsset: 'lib/assets/tandarts.jpg',
      title: 'Tandartsen',
      items: ['Compleet patiëntendossier', 'Gebitsregistratie & PPS', 'Declaraties en röntgenkoppelingen'],
    ),
    DisciplineCardData(
      imageAsset: 'lib/assets/mondhygienist.jpg',
      title: 'Mondhygiënist',
      items: ['Parodontologie', 'Pocketregistratie', 'Overzichtelijke patiëntkaarten'],
    ),
    DisciplineCardData(
      imageAsset: 'lib/assets/tandprotheticus.jpg',
      title: 'Tandprotheticus',
      items: ['Prothetische behandelingen', 'Declaraties', 'Patiëntoverzicht'],
    ),
    DisciplineCardData(
      imageAsset: 'lib/assets/tandtechnicus.jpg',
      title: 'Tandtechnicus',
      items: ['Orderbeheer', '3Shape-integratie', 'Planning'],
    ),
  ];


  final _showcaseTop = Color(0xFF1B4E63);
  final _showcaseBottom = Color(0xFF6BB7D6);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 56),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_showcaseTop, _showcaseBottom],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Eén softwarepakket voor\niedere discipline',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white, height: 1.3),
          ),
          const SizedBox(height: 12),
          const Text(
            'Of u nu tandarts, mondhygiënist, tandprotheticus of tandtechnicus bent: Odontium '
                'ondersteunt de dagelijkse workflow van uw praktijk.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.white70, height: 1.5),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [for (final data in _cards) DisciplineCard(data: data)],
          ),
          const SizedBox(height: 32),
          OutlinedButton(
            onPressed: onViewFeaturesPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white70),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Bekijk functionaliteiten', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, size: 16, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DisciplineCard extends StatelessWidget {
  final DisciplineCardData data;

  const DisciplineCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    bool largeScreen = MediaQuery.of(context).size.width > 2000 ? true : false;
    return SizedBox(
      width: largeScreen ? 440 : 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                data.imageAsset,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.white24,
                  alignment: Alignment.center,
                  child: const Icon(Icons.image_outlined, color: Colors.white70, size: 32),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(data.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 10),
          for (final item in data.items)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check, size: 16, color: Colors.tealAccent),
                  const SizedBox(width: 8),
                  Expanded(child: Text(item, style: const TextStyle(fontSize: 13, color: Colors.white))),
                ],
              ),
            ),
        ],
      ),
    );
  }
}