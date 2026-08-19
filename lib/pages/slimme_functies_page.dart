import '../widgets/general/auto_scroll_view.dart';
import 'package:flutter/material.dart';
import '../widgets/general/type_scale.dart';
import '../widgets/general/content_container.dart';
import 'package:go_router/go_router.dart';

import '../widgets/general/block_container.dart';
import '../widgets/general/demo_cta_banner.dart';
import '../widgets/general/footer.dart';
import '../widgets/general/micro_animations.dart';
import '../widgets/general/responsive.dart';
import '../widgets/general/reveal_on_scroll.dart';
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
      _MiniFeatureChip("Webagenda", "Patiënten vragen zelf afspraken aan"),
      _MiniFeatureChip("CCBR-controle", "Curatele en bewind direct gecontroleerd"),
      _MiniFeatureChip("Telefonie", "Patiëntherkenning bij inkomende gesprekken"),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Scaffold(
      body: AutoScrollView(
        child: Column(
          children: [
            const SizedBox(height: 56),
            BlockContainer(
              screenWidthFactor: 1,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // Floating file-type chips flank the hero on desktop as a
                  // wink to the document features below.
                  if (!mobile) ...const [
                    Positioned(left: 40, top: 10, child: _FloatingFormatChip(icon: Icons.description_outlined, label: "DOCX", phase: 0.0, tilt: -0.08)),
                    Positioned(left: 110, bottom: 0, child: _FloatingFormatChip(icon: Icons.image_outlined, label: "JPG", phase: 0.35, tilt: 0.06)),
                    Positioned(right: 40, top: 16, child: _FloatingFormatChip(icon: Icons.picture_as_pdf_outlined, label: "PDF", phase: 0.6, tilt: 0.08)),
                    Positioned(right: 116, bottom: 4, child: _FloatingFormatChip(icon: Icons.table_chart_outlined, label: "XLSX", phase: 0.85, tilt: -0.05)),
                  ],
                  RevealOnScroll(
                    child: Column(
                children: [
                  Text(
                    "Slimme functies",
                    style: TextStyle(
                      fontSize: AppFont.h1(context),
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
                  HoverScale(
                    child: PulseGlow(
                      color: const Color.fromRGBO(37, 106, 130, 1),
                      borderRadius: 20,
                      child: ElevatedButton(
                        onPressed: () => context.go('/contact'),
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
                    ),
                  ),
                ],
                    ),
                  ),
                ],
              ),
            ),
            BlockContainer(
              screenWidthFactor: 0.7,
              child: ContentContainer(
                padding: 0,
                child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: mobile ? 16 : 64,
                  vertical: mobile ? 32 : 48,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(226, 238, 245, 1),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    RevealOnScroll(
                      child: Text(
                        "Werk met al uw bestanden,\nzonder Odontium te verlaten",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppFont.h2(context),
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F3B3F),
                          height: 1.3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    RevealOnScroll(
                      delay: const Duration(milliseconds: 100),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 650),
                        child: const Text(
                          "Open, bewerk en beheer documenten, afbeeldingen, PDF's, spreadsheets en e-mails "
                          "rechtstreeks vanuit het patiëntdossier. Geen losse programma's. Geen dubbel werk.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Color(0xFF616161), height: 1.5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const RevealOnScroll(
                      delay: Duration(milliseconds: 200),
                      child: TabFeatures(),
                    ),
                  ],
                ),
              ),
              ),
            ),
            const ComparisonCards(),
            const FeatureList(),
            BlockContainer(
              backgroundColor: Colors.white,
              screenWidthFactor: 1,
              child: Center(
                child: ContentContainer(
                  child: Column(
                    children: [
                      RevealOnScroll(
                        child: Text(
                          "Meer slimme functies",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: AppFont.h2(context),
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0F3B3F),
                          ),
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
                                      RevealOnScroll(
                                        delay: Duration(milliseconds: i * 120),
                                        child: _MiniFeatureCard(item: row[i]),
                                      ),
                                      if (i != row.length - 1) const SizedBox(height: 16),
                                    ],
                                  ],
                                )
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (var i = 0; i < row.length; i++) ...[
                                      Expanded(
                                        child: RevealOnScroll(
                                          delay: Duration(milliseconds: i * 120),
                                          child: _MiniFeatureCard(item: row[i]),
                                        ),
                                      ),
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
            const WebsiteFooter(),
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

/// Decorative hero chip: a slightly tilted file-type badge that drifts up
/// and down on its own phase.
class _FloatingFormatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final double phase;
  final double tilt;

  const _FloatingFormatChip({
    required this.icon,
    required this.label,
    required this.phase,
    required this.tilt,
  });

  @override
  Widget build(BuildContext context) {
    return Floating(
      amplitude: 7,
      duration: const Duration(milliseconds: 3600),
      phase: phase,
      child: Transform.rotate(
        angle: tilt,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF17A8A6).withValues(alpha: 0.35)),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.07), blurRadius: 12, offset: const Offset(0, 5)),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: const Color(0xFF17A8A6)),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Color(0xFF0F3B3F)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MiniFeatureCard extends StatelessWidget {
  final _MiniFeatureChip item;

  const _MiniFeatureCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return HoverLift(
      lift: 4,
      borderRadius: 14,
      child: Container(
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
      ),
    );
  }
}
