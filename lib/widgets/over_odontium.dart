import 'package:flutter/material.dart';

class OverOdontium extends StatefulWidget {
  const OverOdontium({super.key});

  @override
  State<OverOdontium> createState() => _OverOdontiumState();
}

class _OverOdontiumState extends State<OverOdontium> {
  int? _hoveredIndex;
  int? _selectedIndex;

  final List<Map<String, String>> _features = [
    {
      'num': '1',
      'title': 'Alles-in-een praktijksoftware',
      'desc':
      'Al meer dan 35 jaar ontwikkelt TSE met Odontium praktijksoftware voor tandartspraktijken, mondhygiënisten',
      'cardLabel': 'Planning',
    },
    {
      'num': '2',
      'title': 'Ontwikkeld voor de Nederlandse mondzorg',
      'desc':
      'Al meer dan 35 jaar ontwikkelt TSE met Odontium praktijksoftware voor tandartspraktijken, mondhygiënisten',
      'cardLabel': 'Dossier',
    },
    {
      'num': '3',
      'title': 'Voor tandartsen, mondhygiënisten, orthodontisten en meer',
      'desc':
      'Al meer dan 35 jaar ontwikkelt TSE met Odontium praktijksoftware voor tandartspraktijken, mondhygiënisten',
      'cardLabel': 'Behandeling',
    },
    {
      'num': '4',
      'title': 'Cloud of lokaal beschikbaar',
      'desc':
      'Al meer dan 35 jaar ontwikkelt TSE met Odontium praktijksoftware voor tandartspraktijken, mondhygiënisten',
      'cardLabel': 'Facturatie',
    },
    {
      'num': '5',
      'title': 'Efficiënte communicatie',
      'desc':
      'Al meer dan 35 jaar ontwikkelt TSE met Odontium praktijksoftware voor tandartspraktijken, mondhygiënisten',
      'cardLabel': 'Communicatie',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 850;

        if (isMobile) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),
              _buildInteractiveCardsGrid(),
              const SizedBox(height: 40),
              _buildFeatureList(),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column: Header & Feature List
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 32),
                  _buildFeatureList(),
                ],
              ),
            ),
            const SizedBox(width: 48),
            // Right Column: Interactive Cards Grid
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: _buildInteractiveCardsGrid(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text(
          'Wat is Odontium?',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F3832),
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Odontium is een praktijksoftware voor alle verschillende mondzorg praktijken.',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureList() {
    // Shows the main 4 list items mapped to a Column to avoid nested scroll issues
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(4, (index) {
        final feature = _features[index];
        final isHighlighted =
            _hoveredIndex == index || _selectedIndex == index;

        return Column(
          children: [
            MouseRegion(
              onEnter: (_) => setState(() => _hoveredIndex = index),
              onExit: (_) => setState(() => _hoveredIndex = null),
              child: GestureDetector(
                onTap: () => setState(() => _selectedIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isHighlighted
                        ? Colors.black.withOpacity(0.04)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feature['num']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isHighlighted
                              ? const Color(0xFF0F3832)
                              : Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              feature['title']!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isHighlighted
                                    ? const Color(0xFF0F3832)
                                    : Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              feature['desc']!,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF6B7280),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (index < 3)
              const Divider(
                height: 24,
                thickness: 1,
                color: Color(0xFFD1D5DB),
              ),
          ],
        );
      }),
    );
  }

  Widget _buildInteractiveCardsGrid() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(child: _buildInteractiveCard(0)),
            const SizedBox(width: 12),
            Expanded(child: _buildInteractiveCard(1)),
            const SizedBox(width: 12),
            Expanded(child: _buildInteractiveCard(2)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Spacer(flex: 1),
            Expanded(flex: 2, child: _buildInteractiveCard(3)),
            const SizedBox(width: 12),
            Expanded(flex: 2, child: _buildInteractiveCard(4)),
            const Spacer(flex: 1),
          ],
        ),
      ],
    );
  }

  Widget _buildInteractiveCard(int index) {
    final isHovered = _hoveredIndex == index;
    final isSelected = _selectedIndex == index;
    final active = isHovered || isSelected;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = null),
      child: GestureDetector(
        onTap: () => setState(() => _selectedIndex = index),
        child: AnimatedPhysicalModel(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12),
          elevation: active ? 10 : 0,
          shadowColor: Colors.black.withOpacity(0.25),
          color: active ? const Color(0xFF0F3832) : const Color(0xFFC0C0C0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            height: 200,
            alignment: Alignment.center,
            transform: Matrix4.identity(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: active ? Colors.white : Colors.black87,
                ),
                child: Text(
                  _features[index]['cardLabel']!,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}