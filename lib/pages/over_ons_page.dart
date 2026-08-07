import 'package:flutter/material.dart';

import '../widgets/general/block_container.dart';
import '../widgets/general/demo_cta_banner.dart';
import '../widgets/general/footer.dart';
import '../widgets/general/hover_arrow_button.dart';
import '../widgets/general/responsive.dart';

const _darkTeal = Color(0xFF0F3B3F);
const _teal = Color(0xFF17A8A6);
const _subtext = Color(0xFF616161);
const _mint = Color(0xFFEAF5F1);

class OverOnsPage extends StatelessWidget {
  const OverOnsPage({super.key});

  static const List<_StatItem> _statsRow1 = [
    _StatItem(
      icon: Icons.history,
      value: "35+",
      label: "JAAR ERVARING",
      description: "Al meer dan 35 jaar ontwikkelen wij betrouwbare software voor de mondzorg.",
    ),
    _StatItem(
      icon: Icons.local_hospital_outlined,
      value: "500+",
      label: "PRAKTIJKEN",
      description: "Dagelijks vertrouwen honderden praktijken op de software van TSE.",
    ),
    _StatItem(
      icon: Icons.monitor_heart_outlined,
      value: "99.99%",
      label: "UPTIME",
      description: "Betrouwbare cloudomgeving met maximale beschikbaarheid.",
    ),
    _StatItem(
      icon: Icons.verified_outlined,
      value: "ISO-27001",
      label: "GECERTIFICEERD",
      description: "Veilige verwerking van patiëntgegevens volgens internationale normen.",
    ),
  ];

  static const List<_StatItem> _statsRow2 = [
    _StatItem(
      icon: Icons.arrow_upward,
      value: "2×",
      label: "GROTE UPDATES PER JAAR",
      description: "Nieuwe functionaliteiten en verbeteringen houden Odontium continu up-to-date.",
    ),
    _StatItem(
      icon: Icons.grid_view_outlined,
      value: "Alle",
      label: "DISCIPLINES",
      description: "Geschikt voor tandartsen, mondhygiënisten, tandprothetici en tandtechnische laboratoria.",
    ),
    _StatItem(
      icon: Icons.headset_mic_outlined,
      value: "Persoonlijk",
      label: "ONDERSTEUNING",
      description: "Direct contact met ervaren medewerkers die uw praktijk begrijpen.",
    ),
    _StatItem(
      icon: Icons.shield_outlined,
      value: "256-BIT",
      label: "AES-BEVEILIGING",
      description: "Uw patiëntgegevens worden veilig opgeslagen en beschermd.",
    ),
  ];

  static const List<_TeamMemberData> _teamMembers = [
    _TeamMemberData(imagePath: "lib/assets/team_member_1.png", name: "Koen Rikkerink", role: "Producteigenaar"),
    _TeamMemberData(imagePath: "lib/assets/team_member_2.png", name: "Koen Rikkerink", role: "Producteigenaar"),
    _TeamMemberData(imagePath: "lib/assets/team_member_3.png", name: "Koen Rikkerink", role: "Producteigenaar"),
    _TeamMemberData(imagePath: "lib/assets/team_member_4.png", name: "Koen Rikkerink", role: "Producteigenaar"),
    _TeamMemberData(imagePath: "lib/assets/team_member_5.png", name: "Koen Rikkerink", role: "Producteigenaar"),
    _TeamMemberData(imagePath: "lib/assets/team_member_6.png", name: "Koen Rikkerink", role: "Producteigenaar"),
  ];

  static const List<_SupportInfoCard> _supportInfoCards = [
    _SupportInfoCard(
      icon: Icons.phone_outlined,
      title: "Telefonisch bereikbaar",
      description: "Direct contact tijdens onze openingstijden.",
    ),
    _SupportInfoCard(
      icon: Icons.groups_outlined,
      title: "Persoonlijk contact",
      description: "U spreekt met mensen die Odontium kennen en uw praktijk begrijpen.",
    ),
    _SupportInfoCard(
      icon: Icons.bolt_outlined,
      title: "Snelle ondersteuning",
      description: "We denken direct met u mee zodat u snel verder kunt.",
    ),
    _SupportInfoCard(
      icon: Icons.volunteer_activism_outlined,
      title: "Betrokken partner",
      description: "Ook na de implementatie blijven we u ondersteunen.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 56),
            BlockContainer(
              screenWidthFactor: 1,
              child: Column(
                children: [
                  Image.asset(
                    "lib/assets/tse_logo.png",
                    height: 70,
                    errorBuilder: (context, error, stackTrace) => const _TseWordmark(),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "De kracht achter Odontium",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: _darkTeal),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 650),
                    child: const Text(
                      "TSE ontwikkelt al meer dan 35 jaar betrouwbare softwareoplossingen voor de "
                      "mondzorg. Met Odontium combineren we technische expertise, persoonlijke "
                      "ondersteuning en praktijkgerichte innovatie om mondzorgprofessionals iedere "
                      "dag optimaal te ondersteunen.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _teal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Plan een demo",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _darkTeal,
                          side: const BorderSide(color: Color(0xFFDADADA)),
                          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text(
                          "Neem contact op",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              gradient: const LinearGradient(
                colors: [Color.fromRGBO(77, 132, 152, 1), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              child: Column(
                children: [
                  const Text(
                    "Software ontwikkeld met kennis\nvan de praktijk",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white, height: 1.3),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: const Text(
                      "Bij TSE geloven we dat goede software begint met luisteren. Daarom ontwikkelen "
                      "we Odontium samen met de mensen die er iedere dag mee werken. Door onze "
                      "jarenlange ervaring en nauwe samenwerking met mondzorgpraktijken blijft de "
                      "software zich ontwikkelen en aansluiten op de praktijk van vandaag én morgen.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.white70, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    child: isMobile(context)
                        ? Column(
                            children: [
                              for (var col = 0; col < 4; col++) ...[
                                if (col != 0)
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 24),
                                    child: Divider(height: 1, color: Color(0xFFD8D8D8)),
                                  ),
                                _StatBlock(item: _statsRow1[col]),
                                const SizedBox(height: 32),
                                _StatBlock(item: _statsRow2[col]),
                              ],
                            ],
                          )
                        : IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                for (var col = 0; col < 4; col++) ...[
                                  if (col != 0)
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                      child: VerticalDivider(width: 1, color: Color(0xFFD8D8D8)),
                                    ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        _StatBlock(item: _statsRow1[col]),
                                        const SizedBox(height: 32),
                                        _StatBlock(item: _statsRow2[col]),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              child: Column(
                children: [
                  const Text(
                    "Persoonlijke ondersteuning wanneer u\ndie nodig heeft",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: _darkTeal, height: 1.3),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: const Text(
                      "Bij TSE geloven we dat goede software hand in hand gaat met goede "
                      "ondersteuning. Daarom staat ons team iedere werkdag klaar om uw vragen te "
                      "beantwoorden en met u mee te denken. Of u nu een korte vraag heeft of hulp "
                      "nodig heeft bij een specifieke situatie, u kunt rekenen op persoonlijk "
                      "contact en snelle ondersteuning.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    child: isMobile(context)
                        ? Column(
                            children: [
                              for (var i = 0; i < _supportInfoCards.length; i++) ...[
                                if (i != 0) const SizedBox(height: 16),
                                _SupportInfoCardView(data: _supportInfoCards[i]),
                              ],
                            ],
                          )
                        : IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                for (var i = 0; i < _supportInfoCards.length; i++) ...[
                                  if (i != 0) const SizedBox(width: 20),
                                  Expanded(child: _SupportInfoCardView(data: _supportInfoCards[i])),
                                ],
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            ),
            BlockContainer(
              backgroundColor: const Color.fromRGBO(226, 238, 245, 1),
              screenWidthFactor: 1,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Maak kennis met ons team",
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: _darkTeal),
                      ),
                      const SizedBox(height: 12),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 700),
                        child: const Text(
                          "Achter Odontium staat een betrokken team van specialisten dat iedere dag "
                          "werkt aan de ontwikkeling, ondersteuning en verbetering van onze software. "
                          "Samen zorgen we ervoor dat u kunt vertrouwen op een oplossing die blijft "
                          "meegroeien met uw praktijk.",
                          style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Wrap(
                        spacing: 32,
                        runSpacing: 32,
                        children: [
                          for (final member in _teamMembers) _TeamMemberCard(data: member),
                          HoverArrowButton(label: "Neem contact op", onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              child: Column(
                children: [
                  const Text(
                    "Wij bouwen aan de toekomst",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: _darkTeal),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: const Text(
                      "Bij TSE blijven we investeren in de toekomst. Niet alleen door Odontium "
                      "continu door te ontwikkelen, maar ook door te investeren in onze organisatie. "
                      "Ons nieuwe bedrijfspand biedt ruimte voor verdere groei, innovatie en "
                      "samenwerking. Zo bouwen we vandaag aan de ondersteuning van morgen.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.asset(
                              "lib/assets/tse_nieuw_gebouw.jpg",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                color: const Color(0xFFE0E0E0),
                                alignment: Alignment.center,
                                child: const Icon(Icons.apartment_outlined, size: 64, color: Color(0xFFBBBBBB)),
                              ),
                            ),
                          ),
                          Positioned(
                            top: responsiveValue(context, desktop: 28, mobile: 14),
                            right: responsiveValue(context, desktop: 28, mobile: 14),
                            child: Transform.rotate(
                              angle: 0.04,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: responsiveValue(context, desktop: 20, mobile: 12),
                                  vertical: responsiveValue(context, desktop: 14, mobile: 8),
                                ),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFFFF9D4D), Color(0xFFFF6B6B)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.3),
                                      blurRadius: 16,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.auto_awesome,
                                          size: responsiveValue(context, desktop: 15, mobile: 11),
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          "NIEUW",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            fontSize: responsiveValue(context, desktop: 12, mobile: 9),
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Nieuwe\ngebouw",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: responsiveValue(context, desktop: 22, mobile: 15),
                                        height: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const DemoCtaBanner(
              heading: "Maak kennis met TSE",
              description:
                  "Benieuwd wat TSE en Odontium voor uw praktijk kunnen betekenen? We laten u graag "
                  "zien hoe onze software aansluit op uw dagelijkse werkzaamheden tijdens een "
                  "persoonlijke demo.",
            ),
            WebsiteFooter(),
          ],
        ),
      ),
    );
  }
}

class _TseWordmark extends StatelessWidget {
  const _TseWordmark();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 56,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              const Text(
                "TSE",
                style: TextStyle(fontSize: 44, fontWeight: FontWeight.w900, color: _teal, letterSpacing: 1),
              ),
              Positioned(
                right: -20,
                top: 2,
                child: Transform.rotate(
                  angle: -0.3,
                  child: Container(
                    width: 16,
                    height: 28,
                    decoration: BoxDecoration(
                      color: _teal.withValues(alpha: 0.45),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -9,
                top: 10,
                child: Transform.rotate(
                  angle: -0.15,
                  child: Container(
                    width: 13,
                    height: 22,
                    decoration: BoxDecoration(
                      color: _teal.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "Turnkey Systems Enschede",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: _teal, letterSpacing: 0.5),
        ),
      ],
    );
  }
}

class _StatItem {
  final IconData icon;
  final String value;
  final String label;
  final String description;

  const _StatItem({required this.icon, required this.value, required this.label, required this.description});
}

class _StatBlock extends StatelessWidget {
  final _StatItem item;

  const _StatBlock({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(item.icon, size: 22, color: _darkTeal),
        const SizedBox(height: 10),
        Text(
          item.value,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 4),
        Text(
          item.label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: _teal, letterSpacing: 0.4),
        ),
        const SizedBox(height: 8),
        Text(
          item.description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, color: _subtext, height: 1.4),
        ),
      ],
    );
  }
}

class _SupportInfoCard {
  final IconData icon;
  final String title;
  final String description;

  const _SupportInfoCard({required this.icon, required this.title, required this.description});
}

class _SupportInfoCardView extends StatelessWidget {
  final _SupportInfoCard data;

  const _SupportInfoCardView({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: _mint, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(data.icon, size: 24, color: _teal),
          const SizedBox(height: 14),
          Text(
            data.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: _darkTeal),
          ),
          const SizedBox(height: 6),
          Text(
            data.description,
            style: const TextStyle(fontSize: 12, color: _subtext, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _TeamMemberData {
  final String imagePath;
  final String name;
  final String role;

  const _TeamMemberData({required this.imagePath, required this.name, required this.role});
}

class _TeamMemberCard extends StatelessWidget {
  final _TeamMemberData data;

  const _TeamMemberCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                data.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFFE0E0E0),
                  alignment: Alignment.center,
                  child: const Icon(Icons.person, size: 56, color: Color(0xFFD0D0D0)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data.name,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: _darkTeal),
          ),
          Text(
            data.role,
            style: const TextStyle(fontSize: 12, color: _subtext, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
