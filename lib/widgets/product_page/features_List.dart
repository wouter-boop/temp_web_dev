import 'package:flutter/material.dart';
import '../general/block_container.dart';

class FeatureList extends StatelessWidget {
  const FeatureList({super.key});

  static const Color darkTeal = Color(0xFF0F3B3F);
  static const Color subtextColor = Color(0xFF616161);
  static const Color imagePlaceholderColor = Color(0xFFDCDCDC);

  @override
  Widget build(BuildContext context) {
    return BlockContainer(
      backgroundColor: const Color(0xFFF2F2F2),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 768;

          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? 32.0 : 60.0,
              horizontal: isMobile ? 16.0 : 32.0,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Werk met al uw bestanden,\nzonder Odontium te verlaten",
                      style: TextStyle(
                        fontSize: isMobile ? 26 : 34,
                        fontWeight: FontWeight.bold,
                        color: darkTeal,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Text(
                        "Plan afspraken eenvoudig, beheer meerdere behandelkamers en houd altijd overzicht over uw agenda — ook op drukke dagen met meerdere behandelaars.",
                        style: TextStyle(
                          fontSize: isMobile ? 13 : 14,
                          height: 1.4,
                          color: subtextColor,
                        ),
                      ),
                    ),
                    SizedBox(height: isMobile ? 32 : 48),
                    _buildFeatureItem(
                      isMobile: isMobile,
                      title: "CCBR Controle",
                      description:
                      "Met één klik controleert u of een patiënt onder curatele of bewind staat. Odontium haalt de gegevens automatisch op en koppelt de curator direct aan het dossier.",
                      bulletPoints: const [
                        "Voorkomt fouten",
                        "Bespaart tijd",
                        "Direct gekoppeld",
                      ],
                    ),
                    SizedBox(height: isMobile ? 32 : 48),
                    _buildFeatureItem(
                      isMobile: isMobile,
                      title: "Webagenda",
                      description:
                      "Patiënten vragen zelf een afspraak aan via uw website. U keurt de aanvraag goed of af, en de patiënt ontvangt automatisch een bevestiging.",
                      bulletPoints: const [
                        "Minder telefoontjes",
                        "Betere planning",
                        "Dag en nacht afspraken aanvragen",
                      ],
                    ),
                    SizedBox(height: isMobile ? 32 : 48),
                    _buildFeatureItem(
                      isMobile: isMobile,
                      title: "Batchcodes scannen",
                      description:
                      "Scan QR- of streepjescodes met een handscanner. Referentienummer, chargenummer en productinformatie worden automatisch ingevuld.",
                      bulletPoints: const [
                        "Geen typwerk",
                        "Minder fouten",
                        "Snellere registratie",
                      ],
                    ),
                    SizedBox(height: isMobile ? 32 : 48),
                    _buildFeatureItem(
                      isMobile: isMobile,
                      title: "Rechtsgeldige handtekeningen",
                      description:
                      "Onderteken documenten digitaal met eIDAS-conforme handtekeningen. Rechtsgeldig, veilig en direct verwerkt in het patiëntdossier.",
                      bulletPoints: const [
                        "Juridische zekerheid",
                        "Snellere goedkeuring",
                        "Veilige documentatie",
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeatureItem({
    required bool isMobile,
    required String title,
    required String description,
    required List<String> bulletPoints,
  }) {
    final imageWidget = Container(
      width: isMobile ? double.infinity : 200,
      height: isMobile ? 180 : 180,
      decoration: BoxDecoration(
        color: imagePlaceholderColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Center(
        child: Icon(
          Icons.image,
          size: 40,
          color: Colors.black26,
        ),
      ),
    );

    final contentWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: darkTeal,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            fontSize: 13,
            color: subtextColor,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        ...bulletPoints.map(
              (point) => Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "• ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Expanded(
                  child: Text(
                    point,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageWidget,
          const SizedBox(height: 16),
          contentWidget,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        imageWidget,
        const SizedBox(width: 32),
        Expanded(child: contentWidget),
      ],
    );
  }
}