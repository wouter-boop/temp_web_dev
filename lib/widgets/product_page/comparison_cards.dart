import 'package:flutter/material.dart';

import '../general/block_container.dart';


class ComparisonCards extends StatelessWidget {
  const ComparisonCards({super.key});

  static const Color darkTeal = Color(0xFF0F3B3F);
  static const Color teal = Color(0xFF17A8A6);
  static const Color cardBg = Color.fromRGBO(226, 238, 245, 1);
  static const Color subtextColor = Color(0xFF616161);

  @override
  Widget build(BuildContext context) {
    return BlockContainer(
      backgroundColor: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 768;

          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? 24.0 : 40.0,
              horizontal: isMobile ? 16.0 : 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Werk lokaal of in de cloud",
                  style: TextStyle(
                    fontSize: isMobile ? 24 : 32,
                    fontWeight: FontWeight.bold,
                    color: darkTeal,
                  ),
                ),
                const SizedBox(height: 12),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Text(
                    "Met Odontium kiest u zelf hoe u wilt werken. Of u nu volledige controle wilt over uw eigen omgeving of liever kiest voor het gemak van onze cloud: beide mogelijkheden zijn beschikbaar.",
                    style: TextStyle(
                      fontSize: isMobile ? 13 : 14,
                      height: 1.4,
                      color: subtextColor,
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 24 : 40),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: isMobile
                        ? _buildMobileLayout()
                        : _buildDesktopLayout(),
                  ),
                ),
                const SizedBox(height: 32),
                const Center(
                  child: Text(
                    "Beide mogelijkheden.\nEén krachtige software.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: subtextColor,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return IntrinsicHeight(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildCloudCard()),
              const SizedBox(width: 60),
              Expanded(child: _buildLocalCard()),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "OF",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: subtextColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildCloudCard(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Expanded(child: Container(height: 1, color: Colors.grey.shade300)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "OF",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: subtextColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(child: Container(height: 1, color: Colors.grey.shade300)),
            ],
          ),
        ),
        _buildLocalCard(),
      ],
    );
  }

  Widget _buildCloudCard() {
    return _buildOptionCard(
      icon: Icons.cloud_outlined,
      title: "Werken in de cloud",
      description:
      "Werk waar en wanneer u wilt, zonder zorgen over servers of onderhoud.",
      bulletPoints: const [
        "Automatische back-ups",
        "99,9% uptime",
        "Werken vanaf iedere locatie",
        "Altijd de nieuwste updates",
        "Veilige opslag in ons eigen datacentrum",
      ],
      buttonText: "Kies voor cloud",
      statValue: "99,9%",
      statLabel: "Gemiddelde uptime",
      filled: true,
      onTap: () {},
    );
  }

  Widget _buildLocalCard() {
    return _buildOptionCard(
      icon: Icons.dns_outlined,
      title: "Lokaal werken",
      description:
      "Werk waar en wanneer u wilt, zonder zorgen over servers of onderhoud.",
      bulletPoints: const [
        "Gegevens op uw eigen server",
        "Volledige controle over uw IT-omgeving",
        "Geschikt voor praktijken met eigen beheer",
        "Werken zonder cloudverbinding",
        "Vertrouwde lokale werkwijze",
      ],
      buttonText: "Kies voor lokaal",
      statValue: "100%",
      statLabel: "controle over uw eigen omgeving",
      filled: false,
      onTap: () {},
    );
  }

  Widget _buildOptionCard({
    required IconData icon,
    required String title,
    required String description,
    required List<String> bulletPoints,
    required String buttonText,
    required String statValue,
    required String statLabel,
    required bool filled,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: teal,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(height: 20),
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
              height: 1.3,
            ),
          ),
          const SizedBox(height: 24),
          ...bulletPoints.map(
                (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      color: teal,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item,
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
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: filled
                ? ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkTeal,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  )
                : OutlinedButton(
                    onPressed: onTap,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: darkTeal,
                      side: const BorderSide(color: darkTeal, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
          ),
          const SizedBox(height: 24),
          Divider(color: Colors.grey.shade400, height: 1),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                statValue,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: darkTeal,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  statLabel,
                  style: const TextStyle(
                    fontSize: 12,
                    color: subtextColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}