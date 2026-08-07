import 'package:flutter/material.dart';
import 'package:odontium_website/widgets/general/responsive.dart';
import 'package:odontium_website/widgets/home_page/arrow_button.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final mobile = isMobile(context);

    // On very wide (4K) screens, keep the text column at a sane max width
    // instead of letting it stretch edge-to-edge along with the background.
    const maxHeroContentWidth = 1400.0;
    final proportionalPadding = screenSize.width * 0.13;
    final capPadding = (screenSize.width - maxHeroContentWidth) / 2;
    final horizontalPadding = mobile
        ? 20.0
        : (proportionalPadding > capPadding ? proportionalPadding : capPadding);

    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ShaderMask(
            blendMode: BlendMode.srcOver,
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(56, 109, 194,0.2),
                  Color.fromRGBO(14,14,41,0.2),
                  Color.fromRGBO(14,14,41,0.15),
                ],
                stops: const [
                  0.0,
                  0.8,
                  1.0,
                ],
              ).createShader(bounds);
            },
            child: Image.asset(
              'lib/assets/hero_bg.png',
              fit: BoxFit.cover,
            ),
          ),

          Container(color: Colors.white.withValues(alpha: 0.15)),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: mobile ? 28.0 : 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                Text(
                  mobile
                      ? 'Praktijksoftware die met uw praktijk meegroeit'
                      : 'Praktijksoftware die \nmet uw praktijk \nmeegroeit',
                  style: TextStyle(
                    fontSize: mobile ? 30 : 52,
                    height: 1.15,
                    fontFamily: "Segoe UI",
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF0F382C),
                  ),
                ),
                const SizedBox(height: 20),

                // Subtext
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 450),
                  child: Text(
                    'Al meer dan 35 jaar ontwikkelt TSE met Odontium praktijksoftware voor tandartspraktijken, mondhygiënisten\ntandtechnici en prothetici.',
                    style: TextStyle(
                      fontSize: mobile ? 14 : 16,
                      height: 1.5,
                      color: const Color(0xFF0F382C).withValues(alpha: 0.8),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // CTA Buttons
                if (mobile)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00A896),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Boek een Demo',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ArrowButton(text: "Ontdek Odontium", function: () => {}),
                    ],
                  )
                else
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00A896),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Boek een Demo',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ArrowButton(text: "Ontdek Odontium", function: () => {}),
                    ],
                  ),

                const Spacer(flex: 3),

                // 3. Bottom Stats Grid
                _StatsGrid(mobile: mobile),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatData {
  final String number;
  final String label;

  const _StatData(this.number, this.label);
}

const _stats = [
  _StatData('500+', 'praktijken werken met TSE'),
  _StatData('35+ jaar', 'ervaring in de mondzorgsoftware'),
  _StatData('15+', 'koppelingen met andere diensten'),
  _StatData('99,99%', 'cloud-uptime in 2024'),
];

/// Four key stats. On mobile there is no room for a single row of four
/// (plus dividers) without overflowing, so it becomes a 2x2 grid of
/// [Expanded] cells. On desktop/4K the stats stay in one row, but each cell
/// is [Expanded] too (instead of intrinsically sized) so long labels wrap
/// instead of forcing the row wider than the available width.
class _StatsGrid extends StatelessWidget {
  final bool mobile;

  const _StatsGrid({required this.mobile});

  @override
  Widget build(BuildContext context) {
    if (mobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildStatItem(_stats[0].number, _stats[0].label, compact: true)),
              Expanded(child: _buildStatItem(_stats[1].number, _stats[1].label, compact: true)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildStatItem(_stats[2].number, _stats[2].label, compact: true)),
              Expanded(child: _buildStatItem(_stats[3].number, _stats[3].label, compact: true)),
            ],
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < _stats.length; i++) ...[
          if (i != 0) _buildDivider(),
          Expanded(child: _buildStatItem(_stats[i].number, _stats[i].label)),
        ],
      ],
    );
  }
}

Widget _buildStatItem(String number, String label, {bool compact = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: compact ? 8.0 : 24.0),
    child: Column(
      crossAxisAlignment: compact ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          number,
          textAlign: compact ? TextAlign.center : TextAlign.start,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F382C),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: compact ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: 13,
            height: 1.3,
            color: const Color(0xFF0F382C).withValues(alpha: 0.7),
          ),
        ),
      ],
    ),
  );
}

// Helper method for vertical dividers between stats
Widget _buildDivider() {
  return Container(
    height: 40,
    width: 1,
    color: const Color(0xFF0F382C).withValues(alpha: 0.3),
  );
}
