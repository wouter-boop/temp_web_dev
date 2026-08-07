import 'dart:ui';

import 'package:flutter/material.dart';

import '../general/responsive.dart';

class _TabItem {
  final String label;
  final String title;
  final String description;
  final List<String> bulletPoints;
  final String imagePath;

  const _TabItem({
    required this.label,
    required this.title,
    required this.description,
    required this.bulletPoints,
    required this.imagePath,
  });
}

class TabFeatures extends StatefulWidget {
  const TabFeatures({super.key});

  @override
  State<TabFeatures> createState() => _TabFeaturesState();
}

class _TabFeaturesState extends State<TabFeatures> {
  static const Color textDark = Color(0xFF0F3B3F);
  static const Color subtextColor = Color(0xFF616161);

  static const List<_TabItem> _tabs = [
    _TabItem(
      label: "Docx",
      title: "Textbewerker (.docx)",
      description:
          "Plan afspraken eenvoudig, beheer meerdere behandelkamers en houd altijd overzicht over uw agenda — ook op drukke dagen met meerdere behandelaars.",
      bulletPoints: ["Dag-, week- en maandweergave", "Meerdere agenda's", "Herhaalafspraken"],
      imagePath: "lib/assets/docx.png",
    ),
    _TabItem(
      label: "IMAGE",
      title: "Afbeeldingen",
      description: "Beheer en bekijk al uw afbeeldingen direct vanuit de app.",
      bulletPoints: ["Snelle weergave", "Ondersteuning voor JPG, PNG"],
      imagePath: "lib/assets/img.png",
    ),
    _TabItem(
      label: "XLSX",
      title: "Excel Sheets (.xlsx)",
      description: "Analyseer uw gegevens met spreadsheets.",
      bulletPoints: ["Formules", "Grafieken en tabellen"],
      imagePath: "lib/assets/excel.png",
    ),
    _TabItem(
      label: "PDF",
      title: "PDF Documenten",
      description: "Bekijk en download direct uw PDF rapportages.",
      bulletPoints: ["Hoge resolutie", "Afdrukondersteuning"],
      imagePath: "lib/assets/pdf.png",
    ),
    _TabItem(
      label: "Email",
      title: "E-mail Integreer",
      description: "Verzend eenvoudig documenten via e-mail.",
      bulletPoints: ["Sjabloonbeheer", "Automatische verzending"],
      imagePath: "lib/assets/email_preview.png",
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 12,
          children: [
            for (var i = 0; i < _tabs.length; i++)
              _FormatChip(
                label: _tabs[i].label,
                selected: _selectedIndex == i,
                onTap: () => setState(() => _selectedIndex = i),
              ),
          ],
        ),
        const SizedBox(height: 32),
        Container(
          padding: EdgeInsets.all(mobile ? 20 : 32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 16, offset: const Offset(0, 6)),
            ],
          ),
          child: _buildTabContent(_tabs[_selectedIndex], mobile),
        ),
      ],
    );
  }

  Widget _buildTabContent(_TabItem item, bool mobile) {
    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          item.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textDark),
        ),
        const SizedBox(height: 12),
        Text(
          item.description,
          style: TextStyle(fontSize: 14, color: subtextColor, height: 1.4),
        ),
        const SizedBox(height: 20),
        ...item.bulletPoints.map(
          (point) => Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "• ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textDark),
                ),
                Expanded(
                  child: Text(point, style: TextStyle(fontSize: 14, color: subtextColor)),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    final imageWidget = SizedBox(
      width: double.infinity,
      height: 260,
      child: Stack(
        children: [
          Transform.translate(
            offset: const Offset(2, 6),
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: 0.35),
                  BlendMode.srcIn,
                ),
                child: Image.asset(item.imagePath, fit: BoxFit.contain),
              ),
            ),
          ),
          Image.asset(
            item.imagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Container(
              color: const Color(0xFFF2F2F2),
              child: const Center(child: Icon(Icons.image, size: 48, color: Colors.black26)),
            ),
          ),
        ],
      ),
    );

    if (mobile) {
      return Column(
        key: ValueKey(item.label),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textColumn,
          const SizedBox(height: 24),
          imageWidget,
        ],
      );
    }

    return Row(
      key: ValueKey(item.label),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(flex: 5, child: textColumn),
        const SizedBox(width: 32),
        Expanded(flex: 4, child: imageWidget),
      ],
    );
  }
}

class _FormatChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FormatChip({required this.label, required this.selected, required this.onTap});

  static const Color teal = Color(0xFF17A8A6);
  static const Color textDark = Color(0xFF0F3B3F);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? teal : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: selected ? teal : const Color(0xFFDADADA)),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.white : textDark,
          ),
        ),
      ),
    );
  }
}
