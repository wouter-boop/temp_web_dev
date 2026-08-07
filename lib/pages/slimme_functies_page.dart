import 'package:flutter/material.dart';

import '../widgets/general/block_container.dart';
import '../widgets/general/demo_cta_banner.dart';
import '../widgets/general/footer.dart';
import '../widgets/general/responsive.dart';
import '../widgets/product_page/comparison_cards.dart';
import '../widgets/product_page/features_List.dart';
import '../widgets/product_page/tab_features.dart';

class SlimmeFunctiesPage extends StatefulWidget {
  const SlimmeFunctiesPage({super.key});

  @override
  State<SlimmeFunctiesPage> createState() => _SlimmeFunctiesPageState();
}

class _SlimmeFunctiesPageState extends State<SlimmeFunctiesPage> {
  static const List<List<_MiniFeatureChip>> _miniFeatureRows = [
    [
      _MiniFeatureChip("Digitale handtekeningen", "Onderteken documenten digitaal"),
      _MiniFeatureChip("WhatsApp", "Contact via het dossier"),
      _MiniFeatureChip("Sms-herinneringen", "Minder no-shows"),
    ],
    [
      _MiniFeatureChip("Bestandsbeheer", "Alles bij de juiste patiënt"),
      _MiniFeatureChip("Koppelingen", "Met bestaande apparatuur"),
      _MiniFeatureChip("Scannen", "Papier direct in het dossier"),
    ],
    [
      _MiniFeatureChip("Bestandsbeheer", "Alles bij de juiste patiënt"),
      _MiniFeatureChip("Koppelingen", "Met bestaande apparatuur"),
      _MiniFeatureChip("Scannen", "Papier direct in het dossier"),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 56),
            BlockContainer(
              screenWidthFactor: 1,
              child: Column(
                children: [
                  Text(
                    "Slimme functies",
                    style: TextStyle(
                      fontSize: mobile ? 28 : 40,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0F382C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Wat Odontium onderscheidt",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF17A8A6)),
                  ),
                  const SizedBox(height: 20),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: const Text(
                      "Van documentbeheer en cloudopslag tot digitale handtekeningen en slimme automatiseringen. "
                      "Odontium helpt uw team sneller werken, met minder fouten en zonder tussen verschillende "
                      "programma's te schakelen.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Color(0xFF616161), height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(37, 106, 130, 1),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Plan een Demo",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: mobile ? 16 : 32,
                  vertical: mobile ? 32 : 48,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(226, 238, 245, 1),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    Text(
                      "Werk met al uw bestanden,\nzonder Odontium te verlaten",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: mobile ? 22 : 28,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0F3B3F),
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 650),
                      child: const Text(
                        "Open, bewerk en beheer documenten, afbeeldingen, PDF's, spreadsheets en e-mails "
                        "rechtstreeks vanuit het patiëntdossier. Geen losse programma's. Geen dubbel werk.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Color(0xFF616161), height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const TabFeatures(),
                  ],
                ),
              ),
            ),
            const ComparisonCards(),
            const FeatureList(),
            BlockContainer(
              screenWidthFactor: 1,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    children: [
                      Text(
                        "Meer slimme fucties",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: mobile ? 24 : 32,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F3B3F),
                        ),
                      ),
                      const SizedBox(height: 32),
                      for (final row in _miniFeatureRows)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: mobile
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (var i = 0; i < row.length; i++) ...[
                                      _MiniFeatureCard(item: row[i]),
                                      if (i != row.length - 1) const SizedBox(height: 16),
                                    ],
                                  ],
                                )
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (var i = 0; i < row.length; i++) ...[
                                      Expanded(child: _MiniFeatureCard(item: row[i])),
                                      if (i != row.length - 1) const SizedBox(width: 24),
                                    ],
                                  ],
                                ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            DemoCtaBanner(
              heading: "Wilt u deze slimme functies\nzelf ervaren?",
              description:
                  "Plan een persoonlijke demonstratie en ontdek hoe Odontium uw praktijk efficiënter maakt.",
            ),
            BlockContainer(
              screenWidthFactor: 1,
              hasHorizontalPadding: false,
              padding: EdgeInsetsGeometry.only(bottom: 0),
              child: WebsiteFooter(),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniFeatureChip {
  final String title;
  final String subtitle;

  const _MiniFeatureChip(this.title, this.subtitle);
}

class _MiniFeatureCard extends StatelessWidget {
  final _MiniFeatureChip item;

  const _MiniFeatureCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF5F1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF1F2D3D)),
          ),
          const SizedBox(height: 4),
          Text(
            item.subtitle,
            style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
          ),
        ],
      ),
    );
  }
}
