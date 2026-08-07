import 'package:flutter/material.dart';

import '../widgets/general/block_container.dart';
import '../widgets/general/demo_cta_banner.dart';
import '../widgets/general/footer.dart';
import '../widgets/general/responsive.dart';

const _darkTeal = Color(0xFF0F3B3F);
const _teal = Color(0xFF17A8A6);
const _subtext = Color(0xFF616161);
const _showcaseTop = Color(0xFF1B4E63);
const _showcaseBottom = Color(0xFF6BB7D6);

class DisciplinesPage extends StatefulWidget {
  const DisciplinesPage({super.key});

  @override
  State<DisciplinesPage> createState() => _DisciplinesPageState();
}

class _DisciplinesPageState extends State<DisciplinesPage> {
  final Map<String, GlobalKey> _sectionKeys = {
    for (final tab in _tabs) tab.id: GlobalKey(),
  };

  static const List<_DisciplineTab> _tabs = [
    _DisciplineTab(id: "tandarts", icon: Icons.medical_services_outlined, navLabel: "Tandartspraktijken"),
    _DisciplineTab(id: "mondhygienist", icon: Icons.face_outlined, navLabel: "Mondhygiënepraktijken"),
    _DisciplineTab(
      id: "tandprotheticus",
      icon: Icons.sentiment_satisfied_outlined,
      navLabel: "Tandprothetische praktijken",
    ),
    _DisciplineTab(
      id: "tandtechnisch",
      icon: Icons.precision_manufacturing_outlined,
      navLabel: "Tandtechnische laboratoria",
    ),
  ];

  static const List<_DisciplineDetail> _details = [
    _DisciplineDetail(
      id: "tandarts",
      heading: "Tandartspraktijken",
      description:
          "Van patiëntgegevens tot behandelingen en planning: Odontium brengt uw dagelijkse "
          "werkzaamheden samen in één overzichtelijke omgeving.",
      items: [
        _DisciplineChecklistItem(
          "Tandschema per element:",
          "behandelplan en historie zichtbaar op het gebitsschema",
        ),
        _DisciplineChecklistItem(
          "Meerdere behandelaars en stoelen:",
          "één agenda voor de hele praktijk, zonder dubbele boekingen",
        ),
        _DisciplineChecklistItem(
          "Röntgenopnames in het dossier:",
          "direct openen vanuit uw eigen apparatuur",
        ),
      ],
      imagePath: "lib/assets/discipline_tandarts_screenshot.png",
      imageOnLeft: true,
      lightBackground: false,
    ),
    _DisciplineDetail(
      id: "mondhygienist",
      heading: "Mondhygiënist",
      description:
          "Registreer parodontale gegevens overzichtelijk en houd de voortgang van iedere "
          "behandeling centraal beschikbaar.",
      items: [
        _DisciplineChecklistItem(
          "Parodontiumkaart:",
          "DPSI, pocketmetingen en bloedingsindex overzichtelijk vastgelegd",
        ),
        _DisciplineChecklistItem(
          "Nazorg die zichzelf inplant:",
          "één agenda voor de hele praktijk, zonder dubbele boekingen",
        ),
        _DisciplineChecklistItem(
          "Zelfstandig declareren:",
          "ook als vrijgevestigde praktijk, zonder tussenkomst van een tandarts",
        ),
      ],
      imagePath: "lib/assets/discipline_mondhygienist_screenshot.png",
      imageOnLeft: false,
      lightBackground: true,
    ),
    _DisciplineDetail(
      id: "tandprotheticus",
      heading: "Tandprothetische Praktijken",
      description:
          "Van intake tot nazorg: Odontium houdt patiëntinformatie, machtigingen en administratie "
          "overzichtelijk bij elkaar.",
      items: _tandLabItems,
      imagePath: "lib/assets/discipline_tandprotheticus_screenshot.png",
      imageOnLeft: true,
      lightBackground: false,
    ),
    _DisciplineDetail(
      id: "tandtechnisch",
      heading: "Tandtechnische Laboratoria",
      description:
          "Van intake tot nazorg: Odontium houdt patiëntinformatie, machtigingen en administratie "
          "overzichtelijk bij elkaar.",
      items: _tandLabItems,
      imagePath: "lib/assets/discipline_tandtechnisch_screenshot.png",
      imageOnLeft: false,
      lightBackground: true,
    ),
  ];

  static const List<_DisciplineChecklistItem> _tandLabItems = [
    _DisciplineChecklistItem(
      "Machtigingen:",
      "aanvragen indienen en de status volgen zonder losse",
    ),
    _DisciplineChecklistItem(
      "Behandeling in fasen:",
      "afdruk, pasfase, plaatsing en nazorg als één dossier",
    ),
    _DisciplineChecklistItem(
      "Directe lijn met het lab:",
      "opdrachten en statusupdates zonder mailwisseling",
    ),
  ];

  void _scrollToDiscipline(String id) {
    final sectionContext = _sectionKeys[id]?.currentContext;
    if (sectionContext != null) {
      Scrollable.ensureVisible(
        sectionContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.08,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 56),
            BlockContainer(
              child: Column(
                children: [
                  const Text(
                    "DISCIPLINES",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: _teal, letterSpacing: 1.2),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Praktijksoftware voor\niedere discipline",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: _darkTeal, height: 1.25),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 620),
                    child: const Text(
                      "Of u nu werkt als tandarts, mondhygiënist, tandprotheticus of tandtechnisch "
                      "laboratorium: Odontium sluit aan op de dagelijkse werkwijze van uw praktijk.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
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
                        child: const Text("Plan een demo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _darkTeal,
                          side: const BorderSide(color: Color(0xFFDADADA)),
                          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text("Ontdek Odontium", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              hasHorizontalPadding: false,
              padding: const EdgeInsets.symmetric(vertical: 32),
              backgroundColor: _showcaseTop,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [_showcaseTop, _showcaseBottom],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: isMobile(context) ? 20 : 24),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: _buildTabGrid(context),
                    ),
                  ),
                ),
              ),
            ),
            for (final detail in _details) _buildDetailSection(detail),
            BlockContainer(
              child: Column(
                children: [
                  const Text(
                    "En als uw praktijk meerdere\ndisciplines combineert?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _darkTeal, height: 1.3),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 650),
                    child: const Text(
                      "Veel praktijken hebben een mondhygiënist in dienst, of werken samen met een "
                      "vaste tandprotheticus. In Odontium werkt iedereen in hetzelfde dossier, met "
                      "eigen rechten en een eigen agenda. Geen aparte systemen die u zelf moet koppelen.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _darkTeal,
                      side: const BorderSide(color: Color(0xFFDADADA)),
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "Neem contact met ons op",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            const DemoCtaBanner(
              heading: "Ontdek wat Odontium voor\nuw praktijk kan betekenen",
              description:
                  "Plan een persoonlijke demo en ontdek hoe Odontium uw dagelijkse werkzaamheden "
                  "ondersteunt.",
            ),
            WebsiteFooter(),
          ],
        ),
      ),
    );
  }

  /// Reflows the discipline switcher from a single 4-across row on
  /// desktop/tablet to a 2x2 grid on mobile, so labels like
  /// "Tandprothetische praktijken" never get squeezed into an
  /// unreadably narrow card.
  Widget _buildTabGrid(BuildContext context) {
    final mobile = isMobile(context);
    final columns = mobile ? 2 : _tabs.length;
    final rows = <Widget>[];

    for (var i = 0; i < _tabs.length; i += columns) {
      final rowTabs = _tabs.skip(i).take(columns).toList();
      final isLastRow = i + columns >= _tabs.length;

      rows.add(
        Padding(
          padding: EdgeInsets.only(bottom: isLastRow ? 0 : 16),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var c = 0; c < rowTabs.length; c++) ...[
                  if (c != 0) SizedBox(width: mobile ? 16 : 20),
                  Expanded(
                    child: _DisciplineTabCard(
                      icon: rowTabs[c].icon,
                      label: rowTabs[c].navLabel,
                      onTap: () => _scrollToDiscipline(rowTabs[c].id),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    }

    return Column(children: rows);
  }

  Widget _buildDetailSection(_DisciplineDetail detail) {
    final mobile = isMobile(context);
    final image = _ScreenshotPlaceholder(imagePath: detail.imagePath);
    final checklist = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [for (final item in detail.items) _ChecklistRow(item: item)],
    );

    final content = mobile
        ? Column(
            children: [image, const SizedBox(height: 24), checklist],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: detail.imageOnLeft
                ? [
                    Expanded(flex: 3, child: image),
                    const SizedBox(width: 48),
                    Expanded(flex: 2, child: checklist),
                  ]
                : [
                    Expanded(flex: 2, child: checklist),
                    const SizedBox(width: 48),
                    Expanded(flex: 3, child: image),
                  ],
          );

    return BlockContainer(
      key: _sectionKeys[detail.id],
      backgroundColor: detail.lightBackground ? const Color.fromRGBO(226, 238, 245, 1) : const Color(0xFFF8F9FB),
      screenWidthFactor: 1,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              Text(
                detail.heading,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _darkTeal),
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 650),
                child: Text(
                  detail.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                ),
              ),
              const SizedBox(height: 40),
              content,
            ],
          ),
        ),
      ),
    );
  }
}

class _DisciplineTab {
  final String id;
  final IconData icon;
  final String navLabel;

  const _DisciplineTab({required this.id, required this.icon, required this.navLabel});
}

class _DisciplineChecklistItem {
  final String title;
  final String description;

  const _DisciplineChecklistItem(this.title, this.description);
}

class _DisciplineDetail {
  final String id;
  final String heading;
  final String description;
  final List<_DisciplineChecklistItem> items;
  final String imagePath;
  final bool imageOnLeft;
  final bool lightBackground;

  const _DisciplineDetail({
    required this.id,
    required this.heading,
    required this.description,
    required this.items,
    required this.imagePath,
    required this.imageOnLeft,
    required this.lightBackground,
  });
}

class _DisciplineTabCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DisciplineTabCard({required this.icon, required this.label, required this.onTap});

  @override
  State<_DisciplineTabCard> createState() => _DisciplineTabCardState();
}

class _DisciplineTabCardState extends State<_DisciplineTabCard> {
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
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
            color: _hovering ? Colors.white : Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _hovering ? const Color(0xFF2E9BE0) : Colors.transparent, width: 1.5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 28, color: _hovering ? _teal : Colors.white),
              const SizedBox(height: 12),
              Text(
                widget.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _hovering ? _darkTeal : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChecklistRow extends StatelessWidget {
  final _DisciplineChecklistItem item;

  const _ChecklistRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check, size: 18, color: _teal),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
                children: [
                  TextSpan(
                    text: '${item.title} ',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: _darkTeal),
                  ),
                  TextSpan(text: item.description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScreenshotPlaceholder extends StatelessWidget {
  final String imagePath;

  const _ScreenshotPlaceholder({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xFFDADADA))),
            alignment: Alignment.center,
            child: const Icon(Icons.dashboard_customize_outlined, size: 48, color: Color(0xFFBBBBBB)),
          ),
        ),
      ),
    );
  }
}
