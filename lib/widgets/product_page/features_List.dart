import 'package:flutter/material.dart';
import '../general/block_container.dart';

class FeatureList extends StatelessWidget {
  const FeatureList({super.key});

  static const Color darkTeal = Color(0xFF0F3B3F);
  static const Color subtextColor = Color(0xFF616161);

  @override
  Widget build(BuildContext context) {
    return BlockContainer(
      gradient: const LinearGradient(
        colors: [Color.fromRGBO(77, 132, 152, 1), Colors.white],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Slimme functies",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 26 : 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Text(
                        "Plan afspraken eenvoudig, beheer meerdere behandelkamers en houd altijd overzicht over uw agenda — ook op drukke dagen met meerdere behandelaars.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile ? 13 : 14,
                          height: 1.4,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    SizedBox(height: isMobile ? 32 : 56),
                    _buildFeatureItem(
                      isMobile: isMobile,
                      icon: Icons.gavel,
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
                      icon: Icons.calendar_month_outlined,
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
                      icon: Icons.qr_code_scanner,
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
                      icon: Icons.draw_outlined,
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
    required IconData icon,
    required String title,
    required String description,
    required List<String> bulletPoints,
  }) {
    final imageWidget = Container(
      width: isMobile ? double.infinity : 140,
      height: 140,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF17A8A6), Color(0xFF0F3B3F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Icon(icon, size: 48, color: Colors.white),
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
