import 'package:flutter/material.dart';

import '../widgets/general/block_container.dart';
import '../widgets/general/demo_cta_banner.dart';
import '../widgets/general/footer.dart';
import '../widgets/general/hover_arrow_button.dart';
import '../widgets/general/responsive.dart';

const _darkTeal = Color(0xFF0F3B3F);
const _teal = Color(0xFF17A8A6);
const _subtext = Color(0xFF616161);

const _sharedBodyParagraph =
    "Bij TSE geloven we dat goede software begint met luisteren. Daarom ontwikkelen we Odontium "
    "samen met de mensen die er iedere dag mee werken. Door onze jarenlange ervaring en nauwe "
    "samenwerking met mondzorgpraktijken blijft de software zich ontwikkelen en aansluiten op de "
    "praktijk van vandaag én morgen.";


class KlantVerhalenPage extends StatefulWidget {
  const KlantVerhalenPage({super.key});

  @override
  State<KlantVerhalenPage> createState() => _KlantVerhalenPageState();
}

class _KlantVerhalenPageState extends State<KlantVerhalenPage> {
  int _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();

  static const List<_StoryData> _stories = [
    _StoryData(
      photoPath: 'assets/images/testimonial_joep.jpg',
      name: 'Joep van Engelen',
      role: 'TPP van Engelen',
      quote:
          "Het programma kan veel meer dan je in eerste instantie denkt. We hebben al heel veel "
          "'Aha!' momenten gehad. Met feedback en adviezen doen ze ook daadwerkelijk iets; je "
          "ziet deze terug in de updates.",
      bodyParagraphs: [_sharedBodyParagraph, _sharedBodyParagraph],
    ),
    _StoryData(
      photoPath: 'lib/assets/klant_verhaal_2.jpg',
      name: 'Koen Rikkerink',
      role: 'Producteigenaar',
      quote:
          "Odontium is voor de medewerkers zeer gebruiksvriendelijk en voor mij als praktijkhouder "
          "genereert de software veel analytische data.",
      bodyParagraphs: [_sharedBodyParagraph, _sharedBodyParagraph],
    ),
    _StoryData(
      photoPath: 'lib/assets/klant_verhaal_3.jpg',
      name: 'Sanne de Boer',
      role: 'Tandarts',
      quote:
          "De planning en het dossier zitten zo intuïtief in elkaar dat nieuwe collega's binnen "
          "een dag zelfstandig kunnen werken.",
      bodyParagraphs: [_sharedBodyParagraph, _sharedBodyParagraph],
    ),
    _StoryData(
      photoPath: 'lib/assets/klant_verhaal_4.jpg',
      name: 'Marloes Willemsen',
      role: 'Mondhygiënist',
      quote:
          "Ik kan tijdens de behandeling alles direct vastleggen, zonder dat het ten koste gaat "
          "van het contact met de patiënt.",
      bodyParagraphs: [_sharedBodyParagraph, _sharedBodyParagraph],
    ),
    _StoryData(
      photoPath: 'lib/assets/klant_verhaal_5.jpg',
      name: 'Rick Verhoeven',
      role: 'Praktijkmanager',
      quote:
          "De rapportages geven ons precies het inzicht dat we nodig hebben om de praktijk soepel "
          "te laten draaien.",
      bodyParagraphs: [_sharedBodyParagraph, _sharedBodyParagraph],
    ),
    _StoryData(
      photoPath: 'lib/assets/klant_verhaal_6.jpg',
      name: 'Femke Hoekstra',
      role: 'Tandprotheticus',
      quote:
          "Odontium sluit perfect aan op ons specialisme; van afdruk tot plaatsing staat alles "
          "overzichtelijk in één dossier.",
      bodyParagraphs: [_sharedBodyParagraph, _sharedBodyParagraph],
    ),
    _StoryData(
      photoPath: 'lib/assets/klant_verhaal_7.jpg',
      name: 'Tom Bakker',
      role: 'Tandtechnicus',
      quote:
          "De communicatie tussen praktijk en lab is enorm verbeterd sinds we met Odontium werken.",
      bodyParagraphs: [_sharedBodyParagraph, _sharedBodyParagraph],
    ),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _select(int index) {
    setState(() => _selectedIndex = index);
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  /// Grid of the 6 non-featured stories (indices 1-6). Reflows from 3
  /// columns on desktop to 2 on tablet to a single column on mobile so
  /// cards never get squeezed unreadably narrow on a phone screen.
  Widget _buildStoryGrid(BuildContext context) {
    final columns = isMobile(context)
        ? 1
        : (isTablet(context) ? 2 : 3);
    const cardIndices = [1, 2, 3, 4, 5, 6];
    final rows = <Widget>[];

    for (var i = 0; i < cardIndices.length; i += columns) {
      final rowIndices = cardIndices.skip(i).take(columns).toList();
      final isLastRow = i + columns >= cardIndices.length;

      Widget rowChild;
      if (columns == 1) {
        final index = rowIndices.first;
        rowChild = _StoryCard(
          data: _stories[index],
          selected: _selectedIndex == index,
          onTap: () => _select(index),
        );
      } else {
        rowChild = IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var c = 0; c < rowIndices.length; c++) ...[
                if (c != 0) const SizedBox(width: 24),
                Expanded(
                  child: _StoryCard(
                    data: _stories[rowIndices[c]],
                    selected: _selectedIndex == rowIndices[c],
                    onTap: () => _select(rowIndices[c]),
                  ),
                ),
              ],
            ],
          ),
        );
      }

      rows.add(
        Padding(
          padding: EdgeInsets.only(bottom: isLastRow ? 0 : 24),
          child: rowChild,
        ),
      );
    }

    return Column(children: rows);
  }

  @override
  Widget build(BuildContext context) {
    final selected = _stories[_selectedIndex];

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const SizedBox(height: 56),
            BlockContainer(
              backgroundColor: const Color.fromRGBO(226, 238, 245, 1),
              screenWidthFactor: 1,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Column(
                    children: [
                      Text(
                        selected.name,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _teal),
                      ),
                      Text(
                        selected.role,
                        style: const TextStyle(fontSize: 13, color: _subtext, fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(height: 24),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: Image.asset(
                            selected.photoPath,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: const Color(0xFFDCDCDC),
                              alignment: Alignment.center,
                              child: const Icon(Icons.person, size: 64, color: Color(0xFFB0B0B0)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        '"${selected.quote}"',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18, color: _darkTeal, height: 1.5),
                      ),
                      const SizedBox(height: 32),
                      const Divider(color: Color(0xFFC9DCE2)),
                      const SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (final para in selected.bodyParagraphs)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                para,
                                style: const TextStyle(fontSize: 14, color: _subtext, height: 1.6),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => _select((_selectedIndex - 1 + _stories.length) % _stories.length),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.arrow_back, size: 16, color: _darkTeal),
                                SizedBox(width: 8),
                                Text("Vorig verhaal", style: TextStyle(fontSize: 13, color: _darkTeal)),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => _select((_selectedIndex + 1) % _stories.length),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Volgend verhaal", style: TextStyle(fontSize: 13, color: _darkTeal)),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward, size: 16, color: _darkTeal),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    children: [
                      const Text(
                        "Wat praktijken zeggen over",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: _darkTeal),
                      ),
                      const Text(
                        "Odontium",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: _teal),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "met Odontium en ontdek waarom zij kiezen voor TSE als softwarepartner.",
                        style: TextStyle(fontSize: 13, color: _subtext),
                      ),
                      const SizedBox(height: 32),
                      _buildStoryGrid(context),
                    ],
                  ),
                ),
              ),
            ),
            const DemoCtaBanner(
              heading: "Benieuwd wat Odontium voor\nuw praktijk kan betekenen?",
              description:
                  "Plan een persoonlijke demo en ontdek hoe Odontium aansluit op de dagelijkse "
                  "werkzaamheden van uw praktijk.",
            ),
            WebsiteFooter(),
          ],
        ),
      ),
    );
  }
}

class _StoryData {
  final String photoPath;
  final String name;
  final String role;
  final String quote;
  final List<String> bodyParagraphs;

  const _StoryData({
    required this.photoPath,
    required this.name,
    required this.role,
    required this.quote,
    required this.bodyParagraphs,
  });
}

class _StoryCard extends StatefulWidget {
  final _StoryData data;
  final bool selected;
  final VoidCallback onTap;

  const _StoryCard({required this.data, required this.selected, required this.onTap});

  @override
  State<_StoryCard> createState() => _StoryCardState();
}

class _StoryCardState extends State<_StoryCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: _hovering ? _teal : const Color(0xFFE0E0E0)),
            boxShadow: _hovering
                ? [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 14, offset: const Offset(0, 6))]
                : const [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 1.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.data.photoPath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFFE0E0E0),
                      alignment: Alignment.center,
                      child: const Icon(Icons.person, size: 40, color: Color(0xFFB0B0B0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.data.name,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: _darkTeal),
              ),
              Text(
                widget.data.role,
                style: const TextStyle(fontSize: 12, color: _subtext, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 10),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: widget.selected ? _teal : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '"${widget.data.quote}"',
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.4,
                    color: widget.selected ? Colors.white : Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              HoverArrowButton(label: "Lees meer", onPressed: widget.onTap),
            ],
          ),
        ),
      ),
    );
  }
}
