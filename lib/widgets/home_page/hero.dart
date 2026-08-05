import 'package:flutter/material.dart';
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
              horizontal: screenSize.width * 0.13,
              vertical: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                // Text(
                //   'MODERNE PRAKTIJKSOFTWARE',
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     letterSpacing: 1.2,
                //     color: const Color(0xFF1E4D40).withValues(alpha: 0.8),
                //   ),
                // ),
                // const SizedBox(height: 12),

                const Text(
                  'Praktijksoftware die \nmet uw praktijk \nmeegroeit',
                  style: TextStyle(
                    fontSize: 52,
                    height: 1.1,
                    fontFamily: "Segoe UI",
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF0F382C),
                  ),
                ),
                const SizedBox(height: 20),

                // Subtext
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 450),
                  child: Text(
                    'Al meer dan 35 jaar ontwikkelt TSE met Odontium praktijksoftware voor tandartspraktijken, mondhygiënisten\ntandtechnici en prothetici.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: const Color(0xFF0F382C).withValues(alpha: 0.8),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // CTA Buttons
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
                Row(
                  children: [
                    _buildStatItem('500+', 'praktijken werken met TSE'),
                    _buildDivider(),
                    _buildStatItem('35+ jaar', 'ervaring in de mondzorgsoftware'),
                    _buildDivider(),
                    _buildStatItem('15+', 'koppelingen met andere diensten'),
                    _buildDivider(),
                    _buildStatItem('99,99%', 'cloud-uptime in 2024'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildStatItem(String number, String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F382C),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
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
