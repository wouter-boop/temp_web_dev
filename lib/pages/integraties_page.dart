import '../widgets/general/auto_scroll_view.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import '../widgets/general/content_container.dart';
import 'package:go_router/go_router.dart';

import '../widgets/general/block_container.dart';
import '../widgets/general/demo_cta_banner.dart';
import '../widgets/general/footer.dart';
import '../widgets/general/hover_arrow_button.dart';
import '../widgets/general/micro_animations.dart';
import '../widgets/general/responsive.dart';
import '../widgets/general/type_scale.dart';

const _darkTeal = Color(0xFF0F3B3F);
const _teal = Color(0xFF17A8A6);
const _subtext = Color(0xFF616161);

/// This page reads as a narrow, dense catalogue rather than a wide marketing
/// layout, so every section shares this column instead of the site-wide
/// default. One value keeps the hero, the category overview and all the
/// category blocks on the same left edge.
const double _pageMaxWidth = 900;

class IntegratiesPage extends StatefulWidget {
  const IntegratiesPage({super.key});

  @override
  State<IntegratiesPage> createState() => _IntegratiesPageState();
}

class _IntegratiesPageState extends State<IntegratiesPage> {
  final _searchController = TextEditingController();

  static const List<_SystemData> _declaratieSystems = [
    _SystemData(
        name: "VECOZO", backText: "Veilige declaraties naar zorgverzekeraars."),
    _SystemData(name: "Payt", backText: "Automatische facturatie en incasso."),
    _SystemData(name: "Infomedics",
        backText: "Declaraties en facturatie voor de zorg."),
    _SystemData(
        name: "Mollie", backText: "Snel en veilig betalingen ontvangen."),
  ];

  static const List<_SystemData> _imagingSystems = [
    _SystemData(
      name: "Planmeca Romexis",
      imagePath: "lib/assets/rom.jpg",
      backText: "Röntgenbeelden direct in het dossier.",
    ),
    _SystemData(
      name: "VisiQuick",
      imagePath: "lib/assets/vq.jpg",
      backText: "Snelle toegang tot röntgenopnamen.",
    ),
    _SystemData(
        name: "MediaDent", backText: "Beeldbeheer voor de tandartspraktijk."),
  ];

  static const List<_SystemData> _communicatieSystems = [
    _SystemData(
        name: "ZorgMail", backText: "Veilig medische informatie uitwisselen."),
    _SystemData(
        name: "Zivver", backText: "Versleuteld en veilig e-mailverkeer."),
  ];

  static const List<_SystemData> _tandtechniekSystems = [
    _SystemData(name: "3Shape",
        backText: "Digitale afdrukken naar het tandtechnisch lab."),
    _SystemData(name: "QR-code workflows",
        backText: "Bestellingen automatisch herkennen en koppelen."),
  ];

  static const List<_SystemData> _labelprinterSystems = [
    _SystemData(name: "Dymo",
        backText: "Labels printen rechtstreeks vanuit het dossier."),
    _SystemData(
        name: "Zebra", backText: "Professioneel labelen en barcodes printen."),
    _SystemData(name: "QR code scanners",
        backText: "Snel en foutloos gegevens invoeren."),
    _SystemData(name: "Brother",
        backText: "Betrouwbaar printen voor de dagelijkse praktijk."),
  ];

  static const List<_SystemData> _telefonieSystems = [
    _SystemData(name: "Yealink",
        backText: "IP-telefonie met directe patiëntherkenning."),
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() => setState(() {});

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  late final Map<String, GlobalKey> _sectionKeys = {
    for (final category in _allCategories) category.title: GlobalKey(),
  };

  void _scrollToCategory(String title) {
    final sectionContext = _sectionKeys[title]?.currentContext;
    if (sectionContext != null) {
      Scrollable.ensureVisible(
        sectionContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.08,
      );
    }
  }

  List<_CategorySection> get _allCategories =>
      [
        _CategorySection(
          icon: Icons.credit_card_outlined,
          title: "Declaraties & Betalingen",
          summary: "Veilig declareren bij zorgverzekeraars en eenvoudig betalingen ontvangen.",
          linkLabel: "Naar de koppelingen",
          description:
          "Verstuur declaraties rechtstreeks vanuit Odontium en laat betalingen en verwerking "
              "aansluiten op uw bestaande werkwijze. Minder handmatig werk en een sneller "
              "administratief proces.",
          lightBackground: true,
          systems: _declaratieSystems,
          synonyms: const [
            "declaratie",
            "declareren",
            "factuur",
            "facturatie",
            "betaling",
            "betalen",
            "incasso",
            "zorgverzekeraar",
            "verzekeraar",
            "financieel",
            "afrekenen",
            "geld",
          ],
        ),
        _CategorySection(
          icon: Icons.image_outlined,
          title: "Beeldvorming & Röntgen",
          summary: "Open röntgenopnamen direct vanuit het patiëntdossier, zonder dubbel werk.",
          linkLabel: "Bekijk koppelingen",
          description:
          "Open röntgenfoto's en andere beelden rechtstreeks vanuit het patiëntdossier. Zo "
              "hoeft u niet te wisselen tussen verschillende programma's.",
          lightBackground: false,
          systems: _imagingSystems,
          synonyms: const [
            "rontgen",
            "foto",
            "fotos",
            "beeld",
            "beelden",
            "scan",
            "scannen",
            "afbeelding",
            "xray",
            "opname",
            "opnamen",
            "gebitsfoto",
          ],
        ),
        _CategorySection(
          icon: Icons.mail_outline,
          title: "Communicatie",
          summary: "Versleutelde en snelle communicatie met patiënten en zorgverleners.",
          linkLabel: "Bekijk koppelingen",
          description:
          "Verstuur berichten veilig en volgens de AVG. Alle communicatie blijft "
              "overzichtelijk gekoppeld aan uw praktijk.",
          lightBackground: true,
          systems: _communicatieSystems,
          synonyms: const [
            "bericht",
            "berichten",
            "mail",
            "email",
            "e-mail",
            "veilig mailen",
            "uitwisselen",
            "avg",
            "correspondentie",
          ],
        ),
        _CategorySection(
          icon: Icons.document_scanner_outlined,
          title: "Tandtechniek & Laboratoria",
          summary: "Digitale afdrukken en CAD/CAM-workflows rechtstreeks naar het lab.",
          linkLabel: "Bekijk koppelingen",
          description:
          "Werk eenvoudig samen met tandtechnische laboratoria en digitale scanners. "
              "Bestellingen, afdrukken en bestanden worden direct uitgewisseld.",
          lightBackground: false,
          systems: _tandtechniekSystems,
          synonyms: const [
            "lab",
            "laboratorium",
            "tandtechniek",
            "tandtechnisch",
            "afdruk",
            "afdrukken",
            "scanner",
            "intraoraal",
            "gebit",
            "cadcam",
            "tandtechnicus",
          ],
        ),
        _CategorySection(
          icon: Icons.print_outlined,
          title: "Labelprinters & Scanners",
          summary: "Labels printen, barcodes scannen en batches automatisch herkennen.",
          linkLabel: "Bekijk koppelingen",
          description:
          "Print labels of scan producten rechtstreeks vanuit Odontium. Zo bespaart u tijd "
              "en voorkomt u invoerfouten.",
          lightBackground: true,
          systems: _labelprinterSystems,
          synonyms: const [
            "printer",
            "printen",
            "label",
            "labels",
            "barcode",
            "streepjescode",
            "scanner",
            "scannen",
            "hardware",
            "apparatuur",
          ],
          trailing: const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
                "en meer ...", style: TextStyle(fontSize: 13, color: _subtext)),
          ),
        ),
        _CategorySection(
          icon: Icons.phone_outlined,
          title: "Telefonie, SMS, WhatsApp",
          summary: "Directe patiëntherkenning bij binnenkomende gesprekken.",
          linkLabel: "Bekijk koppelingen",
          description:
          "Communiceer met patiënten via de kanalen die zij al gebruiken. Zo blijft "
              "contact snel, persoonlijk en overzichtelijk.",
          lightBackground: false,
          systems: _telefonieSystems,
          synonyms: const [
            "telefoon",
            "telefonie",
            "bellen",
            "gesprek",
            "gesprekken",
            "sms",
            "bericht",
            "berichten",
            "whatsapp",
            "chat",
            "ip-telefonie",
            "voip",
          ],
          trailing: _buildOverigePanel(
              "Werkt u met een ander systeem? Wij denken graag mee."),
        ),
      ];

  Widget _buildOverigePanel(String question, {Widget? screenshot}) {
    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Overige systemen?",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: _darkTeal),
        ),
        const SizedBox(height: 6),
        Text(question,
            style: const TextStyle(fontSize: 13, color: _subtext, height: 1.4)),
        const SizedBox(height: 12),
        HoverArrowButton(label: "Neem contact met ons op",
            onPressed: () => context.go('/contact')),
      ],
    );

    if (screenshot == null) {
      return Padding(
          padding: const EdgeInsets.only(top: 16), child: textColumn);
    }

    // HoverArrowButton has a 200px minWidth floor, so on mobile the
    // screenshot can no longer sit beside the text in a Row (it used to
    // force the text column below that floor and overflow) -- stack it
    // underneath instead.
    if (isMobile(context)) {
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textColumn,
            const SizedBox(height: 20),
            Center(child: screenshot),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: textColumn),
          const SizedBox(width: 24),
          screenshot,
        ],
      ),
    );
  }

  List<_CategorySection> _filteredCategories(String query) {
    if (query.isEmpty) return _allCategories;
    return _allCategories
        .map((c) {
      final categoryMatches =
          _matches(c.title, query) || c.synonyms.any((s) => _matches(s, query));
      final systems = categoryMatches
          ? c.systems
          : c.systems
          .where((s) =>
      _matches(s.name, query) || s.synonyms.any((s2) => _matches(s2, query)))
          .toList();
      return _CategorySection(
        icon: c.icon,
        title: c.title,
        summary: c.summary,
        linkLabel: c.linkLabel,
        description: c.description,
        lightBackground: c.lightBackground,
        systems: systems,
        synonyms: c.synonyms,
        trailing: c.trailing,
      );
    })
        .where((c) => c.systems.isNotEmpty)
        .toList();
  }

  /// True if [query] appears in [candidate] (accent- and case-insensitive),
  /// or is a close-enough typo of one of [candidate]'s words.
  static bool _matches(String candidate, String query) {
    final normalizedCandidate = _normalize(candidate);
    final normalizedQuery = _normalize(query);
    if (normalizedQuery.isEmpty) return true;
    if (normalizedCandidate.contains(normalizedQuery)) return true;

    final maxDistance = normalizedQuery.length <= 4 ? 1 : 2;
    for (final word in normalizedCandidate.split(RegExp(r'[^a-z0-9]+'))) {
      if (word.isEmpty) continue;
      if (word.contains(normalizedQuery)) return true;
      if (_levenshtein(word, normalizedQuery) <= maxDistance) return true;
    }
    return false;
  }

  static String _normalize(String input) {
    const from = 'àáâãäåòóôõöèéêëìíîïùúûüñç';
    const to = 'aaaaaaooooooeeeeiiiiuuuunc';
    var result = input.toLowerCase();
    for (var i = 0; i < from.length; i++) {
      result = result.replaceAll(from[i], to[i]);
    }
    return result;
  }

  /// Standard edit-distance (insert/delete/substitute) between two strings,
  /// used to tolerate small typos in the search box.
  static int _levenshtein(String a, String b) {
    if (a == b) return 0;
    if (a.isEmpty) return b.length;
    if (b.isEmpty) return a.length;

    var previousRow = List<int>.generate(b.length + 1, (i) => i);
    var currentRow = List<int>.filled(b.length + 1, 0);

    for (var i = 1; i <= a.length; i++) {
      currentRow[0] = i;
      for (var j = 1; j <= b.length; j++) {
        final cost = a[i - 1] == b[j - 1] ? 0 : 1;
        currentRow[j] = math.min(
          math.min(currentRow[j - 1] + 1, previousRow[j] + 1),
          previousRow[j - 1] + cost,
        );
      }
      final swap = previousRow;
      previousRow = currentRow;
      currentRow = swap;
    }
    return previousRow[b.length];
  }

  Widget _buildHeroText({required bool mobile}) {
    final align = mobile ? TextAlign.center : TextAlign.start;
    return Column(
      crossAxisAlignment: mobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          "Integraties die met uw\npraktijk meewerken",
          textAlign: align,
          style: TextStyle(
            fontSize: AppFont.h1(context),
            fontWeight: FontWeight.bold,
            color: _darkTeal,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Text(
            "Odontium sluit naadloos aan op de systemen en apparatuur die u dagelijks "
                "gebruikt. Zo werkt alles samen in één efficiënte workflow.",
            textAlign: align,
            style: const TextStyle(fontSize: 14, color: _subtext, height: 1.5),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => context.go('/contact'),
          style: ElevatedButton.styleFrom(
            backgroundColor: _teal,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            elevation: 0,
          ),
          child: const Text(
            "Plan een demo",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    late FocusNode _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus == true) {
          scrollController.animateTo(
            900, duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut);
        }
      });
    });

    final query = _searchController.text.trim().toLowerCase();
    final visibleCategories = _filteredCategories(query);

    return Scaffold(
      body: AutoScrollView(
        controller: scrollController,
        child: Column(
          children: [
            const SizedBox(height: 56),
            BlockContainer(
              screenWidthFactor: 1,
              child: Center(
                child: ContentContainer(
                  maxWidth: _pageMaxWidth,
                  child: isMobile(context)
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildHeroText(mobile: true),
                      const SizedBox(height: 32),
                      const _IntegrationHubIllustration(),
                    ],
                  )
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: _buildHeroText(mobile: false)),
                      const SizedBox(width: 32),
                      const _IntegrationHubIllustration(),
                    ],
                  ),
                ),
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              child: Center(
                // At 900 three 280px cards fit per row, so the six categories
                // form a tidy 3x2 grid.
                child: ContentContainer(
                  maxWidth: _pageMaxWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Integratie categorieën",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile(context) ? 22 : 28,
                          fontWeight: FontWeight.bold,
                          color: _darkTeal,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 560),
                        child: const Text(
                          "Zes gebieden waarin Odontium met uw bestaande systemen samenwerkt. Klik op een "
                              "kaart voor de details.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14,
                              color: _subtext,
                              height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 40),
                      if (query.isNotEmpty && visibleCategories.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Text(
                            "Geen resultaten gevonden voor \"${_searchController
                                .text.trim()}\".",
                            style: const TextStyle(
                                fontSize: 14, color: _subtext),
                          ),
                        )
                      else
                        Wrap(
                          // Centred so a partial last row (or a filtered
                          // result set) stays balanced under the heading.
                          alignment: WrapAlignment.center,
                          spacing: 24,
                          runSpacing: 24,
                          children: [
                            for (final category in _allCategories)
                              SizedBox(
                                width: 280,
                                child: _CategoryCard(
                                  data: category,
                                  onTap: () =>
                                      _scrollToCategory(category.title),
                                ),
                              ),
                          ],
                        ),
                      const SizedBox(height: 40),
                      const Text(
                        "Zoek op naam, of blader hieronder per categorie.",
                        style: TextStyle(fontSize: 12, color: _subtext),
                      ),
                      SizedBox(height: 22),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 420),
                        child: TextField(
                          focusNode: _focusNode,
                          controller: _searchController,
                          style: const TextStyle(fontSize: 13,
                              color: _darkTeal),
                          decoration: InputDecoration(
                            hintText: "Zoek uw systeem, bijv. VisiQuick",
                            hintStyle: const TextStyle(
                                fontSize: 13, color: _subtext),
                            suffixIcon: const Icon(
                                Icons.search, color: _subtext, size: 20),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: const BorderSide(
                                  color: Color(0xFFDADADA)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: const BorderSide(
                                  color: Color(0xFFDADADA)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: const BorderSide(
                                  color: _teal, width: 1.5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      const Divider(color: Color(0xFFE0E0E0)),
                    ],
                  ),
                ),
              ),
            ),
            for (final category in visibleCategories)
              BlockContainer(
                key: _sectionKeys[category.title],
                backgroundColor: category.lightBackground
                    ? const Color.fromRGBO(226, 238, 245, 1)
                    : const Color(0xFFF8F9FB),
                screenWidthFactor: 1,
                child: ContentContainer(
                  maxWidth: _pageMaxWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.title,
                        style: TextStyle(fontSize: AppFont.h2(context),
                            fontWeight: FontWeight.bold,
                            color: _darkTeal),
                      ),
                      const SizedBox(height: 10),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 560),
                        child: Text(
                          category.description,
                          style: const TextStyle(
                              fontSize: 14, color: _subtext, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 28),
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          for (final system in category.systems) _FlipCard(
                              data: system)
                        ],
                      ),
                      if (category.trailing != null) category.trailing!,
                    ],
                  ),
                ),
              ),
            const DemoCtaBanner(
              heading: "Welk systeem gebruikt u?",
              description:
              "Ons team denkt graag mee over de mogelijkheden voor uw praktijk.",
            ),
            WebsiteFooter()
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatefulWidget {
  final _CategorySection data;
  final VoidCallback onTap;

  const _CategoryCard({required this.data, required this.onTap});

  @override
  State<_CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<_CategoryCard> {
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
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: _hovering ? _teal : const Color(0xFFDADADA)),
            boxShadow: _hovering
                ? [
              BoxShadow(color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 6))
            ]
                : const [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(color: _teal),
                ),
                child: Icon(widget.data.icon, size: 17, color: _teal),
              ),
              const SizedBox(height: 14),
              Text(
                widget.data.title,
                style: const TextStyle(fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: _darkTeal),
              ),
              const SizedBox(height: 8),
              Text(
                widget.data.summary,
                style: const TextStyle(
                    fontSize: 13, color: _subtext, height: 1.4),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.data.linkLabel,
                    style: const TextStyle(fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _teal),
                  ),
                  const SizedBox(width: 6),
                  AnimatedSlide(
                    duration: const Duration(milliseconds: 200),
                    offset: _hovering ? const Offset(0.3, 0) : Offset.zero,
                    child: const Icon(
                        Icons.arrow_forward, size: 14, color: _teal),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SystemData {
  final String name;
  final String? imagePath;
  final String backText;
  final List<String> synonyms;

  const _SystemData({
    required this.name,
    this.imagePath,
    required this.backText,
    this.synonyms = const [],
  });
}

class _CategorySection {
  final IconData icon;
  final String title;
  final String summary;
  final String linkLabel;
  final String description;
  final bool lightBackground;
  final List<_SystemData> systems;
  final List<String> synonyms;
  final Widget? trailing;

  const _CategorySection({
    required this.icon,
    required this.title,
    required this.summary,
    required this.linkLabel,
    required this.description,
    this.synonyms = const [],
    required this.lightBackground,
    required this.systems,
    this.trailing,
  });
}

class _FlipCard extends StatefulWidget {
  final _SystemData data;

  const _FlipCard({required this.data});

  @override
  State<_FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<_FlipCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 400),
  );
  bool _flipped = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Hover never fires on touch devices, so the back of the card (real
  // integration info) would otherwise be unreachable on mobile -- a tap
  // toggles the flip as a fallback alongside the existing hover behaviour.
  void _toggleFlip() {
    setState(() => _flipped = !_flipped);
    if (_flipped) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _toggleFlip,
        // The box is a fixed size while the text inside follows the fluid type
        // scale, so it grows by the same factor — otherwise the back-of-card
        // description would overflow on 4K.
        child: SizedBox(
          width: 205 * typeScaleOf(context),
          height: 108 * typeScaleOf(context),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              final angle = _controller.value * math.pi;
              final showBack = angle > math.pi / 2;
              final displayAngle = showBack ? angle - math.pi : angle;
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(displayAngle),
                child: showBack ? _buildBack() : _buildFront(),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFront() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFDADADA)),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: widget.data.imagePath != null
          ? Image.asset(widget.data.imagePath!, fit: BoxFit.contain)
          : Text(
        widget.data.name,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w600, color: _darkTeal),
      ),
    );
  }

  Widget _buildBack() {
    return Container(
      decoration: BoxDecoration(
          color: _teal, borderRadius: BorderRadius.circular(14)),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: Text(
        widget.data.backText,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 1.3),
      ),
    );
  }
}

class _IntegrationHubIllustration extends StatelessWidget {
  const _IntegrationHubIllustration();

  static const _center = Offset(140, 115);
  static const _iconPoints = [
    Offset(140, 20), // chat
    Offset(230, 65), // printer
    Offset(45, 160), // mail
    Offset(140, 210), // image
    Offset(230, 160), // phone
    Offset(45, 65), // card
  ];
  static const _icons = [
    Icons.chat_bubble_outline,
    Icons.print_outlined,
    Icons.mail_outline,
    Icons.image_outlined,
    Icons.phone_outlined,
    Icons.credit_card_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 230,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _HubLinesPainter(center: _center, points: _iconPoints),
            ),
          ),
          Positioned(
            left: _center.dx - 38,
            top: _center.dy - 38,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [_teal, _darkTeal],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Transform.rotate(
                    angle: -math.pi / 4,
                    child: const Text(
                      "Odontium",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11),
                    ),
                  ),
                ),
              ),
            ),
          ),
          for (var i = 0; i < _iconPoints.length; i++)
            Positioned(
              left: _iconPoints[i].dx - 18,
              top: _iconPoints[i].dy - 18,
              child: Floating(
                amplitude: 4,
                phase: i / _iconPoints.length,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: _teal.withValues(alpha: 0.4)),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 6,
                          offset: const Offset(0, 2)),
                    ],
                  ),
                  child: Icon(_icons[i], size: 17, color: _teal),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _HubLinesPainter extends CustomPainter {
  final Offset center;
  final List<Offset> points;

  _HubLinesPainter({required this.center, required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = _teal.withValues(alpha: 0.5)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    const dashLength = 4.0;
    const gapLength = 4.0;

    for (final point in points) {
      final totalLength = (point - center).distance;
      final direction = (point - center) / totalLength;
      var drawn = 0.0;
      while (drawn < totalLength) {
        final segmentEnd = math.min(drawn + dashLength, totalLength);
        canvas.drawLine(
            center + direction * drawn, center + direction * segmentEnd, paint);
        drawn += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _HubLinesPainter oldDelegate) => false;
}
