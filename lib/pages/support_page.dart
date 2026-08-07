import 'package:flutter/material.dart';

import '../widgets/general/block_container.dart';
import '../widgets/general/footer.dart';

const _darkTeal = Color(0xFF0F3B3F);
const _teal = Color(0xFF17A8A6);
const _subtext = Color(0xFF616161);

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 56),
            _buildHero(isMobile),
            _buildRustDeskSection(isMobile),
            _buildTeamViewerSection(isMobile),
            WebsiteFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(bool isMobile) {
    return BlockContainer(
      screenWidthFactor: 1,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            children: [
              const Text(
                "Support",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: _teal, letterSpacing: 0.5),
              ),
              const SizedBox(height: 12),
              Text(
                "Snel en persoonlijk geholpen op afstand",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: isMobile ? 26 : 40, fontWeight: FontWeight.bold, color: _darkTeal),
              ),
              const SizedBox(height: 16),
              const Text(
                "Voor dagelijkse ondersteuning gebruiken we onze eigen Support App. Gaat het om "
                "een eenmalige demo op afstand? Dan kan dat ook via TeamViewer.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: _subtext, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRustDeskSection(bool isMobile) {
    final image = ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Image.asset(
          'lib/assets/support_app_screenshot.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: const Color(0xFFE9EEF0),
            alignment: Alignment.center,
            child: const Icon(Icons.desktop_windows_outlined, size: 56, color: Color(0xFFB0B0B0)),
          ),
        ),
      ),
    );

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _teal.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "Dagelijks gebruikt",
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: _teal),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "TSE Support App",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _darkTeal),
        ),
        const SizedBox(height: 12),
        const Text(
          "De TSE Support App is onze eigen support-applicatie waarmee ons team direct met u kan "
          "meekijken. Dit is de tool die we dagelijks gebruiken bij supportvragen, dus houd hem "
          "gerust binnen handbereik.",
          style: TextStyle(fontSize: 14, color: _subtext, height: 1.6),
        ),
        const SizedBox(height: 28),
        _buildSteps(isMobile),
        const SizedBox(height: 28),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download),
              label: const Text("Download voor Windows"),
              style: ElevatedButton.styleFrom(
                backgroundColor: _teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download),
              label: const Text("Download voor macOS"),
              style: OutlinedButton.styleFrom(
                foregroundColor: _darkTeal,
                side: const BorderSide(color: _teal, width: 1.5),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );

    return BlockContainer(
      screenWidthFactor: 1,
      backgroundColor: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: isMobile
              ? Column(children: [image, const SizedBox(height: 32), content])
              : IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(flex: 5, child: image),
                      const SizedBox(width: 48),
                      Expanded(flex: 6, child: content),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildSteps(bool isMobile) {
    const steps = [
      ("1", "Download en open de app", "Installeer de TSE Support App op uw computer en start de applicatie."),
      ("2", "Geef ons uw code door", "Bel de supportlijn en geef de code door die in de app verschijnt."),
      ("3", "Wij verbinden direct", "Onze supportmedewerker maakt verbinding en helpt u meteen verder."),
    ];

    final items = [
      for (final step in steps) _StepItem(number: step.$1, title: step.$2, description: step.$3),
    ];

    if (isMobile) {
      return Column(
        children: [
          for (var i = 0; i < items.length; i++) ...[
            if (i != 0) const SizedBox(height: 20),
            items[i],
          ],
        ],
      );
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < items.length; i++) ...[
            if (i != 0) const SizedBox(width: 20),
            Expanded(child: items[i]),
          ],
        ],
      ),
    );
  }

  Widget _buildTeamViewerSection(bool isMobile) {
    return BlockContainer(
      screenWidthFactor: 1,
      backgroundColor: const Color(0xFFFAFAFA),
      padding: isMobile
          ? const EdgeInsets.symmetric(horizontal: 20, vertical: 24)
          : const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: isMobile
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: _teamViewerChildren(isMobile))
              : Row(crossAxisAlignment: CrossAxisAlignment.center, children: _teamViewerChildren(isMobile)),
        ),
      ),
    );
  }

  List<Widget> _teamViewerChildren(bool isMobile) {
    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          children: [
            Icon(Icons.videocam_outlined, size: 16, color: Color(0xFF8A8A8A)),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                "Eenmalige demo op afstand?",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF555555)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          "Voor een incidentele demo (gemiddeld een paar keer per maand) gebruiken we soms "
          "TeamViewer QuickSupport.",
          style: TextStyle(fontSize: 12, color: Color(0xFF8A8A8A)),
        ),
      ],
    );

    final button = OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF666666),
        side: const BorderSide(color: Color(0xFFDADADA)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
      child: const Text("Download TeamViewer QuickSupport"),
    );

    if (isMobile) {
      return [text, const SizedBox(height: 16), button];
    }
    return [Expanded(child: text), const SizedBox(width: 24), button];
  }
}

class _StepItem extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const _StepItem({required this.number, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(color: _darkTeal, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Text(number, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
        ),
        const SizedBox(height: 12),
        Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: _darkTeal)),
        const SizedBox(height: 6),
        Text(description, style: const TextStyle(fontSize: 13, color: _subtext, height: 1.5)),
      ],
    );
  }
}
