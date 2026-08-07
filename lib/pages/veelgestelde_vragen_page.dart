import 'package:flutter/material.dart';

import '../widgets/general/block_container.dart';
import '../widgets/general/footer.dart';
import '../widgets/general/responsive.dart';

const _darkTeal = Color(0xFF0F3B3F);
const _teal = Color(0xFF17A8A6);
const _subtext = Color(0xFF616161);
const _pillBorder = Color(0xFFBFD8DC);
const _dividerColor = Color(0xFFD7DEE1);

class _FaqItemData {
  final String question;
  final String answer;

  const _FaqItemData({required this.question, required this.answer});
}

class _FaqCategoryData {
  final String pillLabel;
  final String heading;
  final List<_FaqItemData> items;

  const _FaqCategoryData({
    required this.pillLabel,
    required this.heading,
    required this.items,
  });
}

const List<_FaqCategoryData> _categories = [
  _FaqCategoryData(
    pillLabel: "Algemeen",
    heading: "Algemeen vragen",
    items: [
      _FaqItemData(
        question: "Voor welke praktijken is Odontium geschikt?",
        answer:
            "Odontium is geschikt voor alle mondzorgpraktijken, van eenpersoonspraktijken tot "
            "grote multidisciplinaire klinieken. De software schaalt mee met het aantal "
            "behandelaars en locaties.",
      ),
      _FaqItemData(
        question: "Werkt Odontium in de cloud, lokaal of allebei?",
        answer:
            "Odontium is een cloudoplossing, zodat u altijd en overal bij uw praktijkgegevens "
            "kunt. Op verzoek is een lokale opstelling ook mogelijk.",
      ),
      _FaqItemData(
        question: "Kan ik een vrijblijvende demo aanvragen?",
        answer:
            "Ja, u kunt via de website een gratis en vrijblijvende demo aanvragen. Een van onze "
            "specialisten laat u dan zien hoe Odontium aansluit op uw praktijk.",
      ),
    ],
  ),
  _FaqCategoryData(
    pillLabel: "Overstappen",
    heading: "Overstappen",
    items: [
      _FaqItemData(
        question: "Hoe stap ik over naar Odontium?",
        answer:
            "Na aanmelding stelt u samen met een implementatiespecialist een overstapplan op. "
            "Wij begeleiden u stap voor stap, van dataoverdracht tot de eerste werkdag.",
      ),
      _FaqItemData(
        question: "Worden mijn gegevens veilig overgezet?",
        answer:
            "Al uw patiëntgegevens worden versleuteld overgezet en gecontroleerd op volledigheid "
            "voordat de oude omgeving wordt uitgezet.",
      ),
      _FaqItemData(
        question: "Kan mijn praktijk tijdens de overstap gewoon blijven werken?",
        answer:
            "Ja, de overstap wordt zo gepland dat uw praktijk gewoon door kan draaien. Waar "
            "mogelijk migreren we buiten praktijkuren.",
      ),
      _FaqItemData(
        question: "Hoeveel begeleiding krijg ik tijdens de overstap?",
        answer:
            "U krijgt een vast aanspreekpunt dat u begeleidt van het eerste gesprek tot en met de "
            "livegang, inclusief training voor uw team.",
      ),
      _FaqItemData(
        question: "Kan ik Odontium eerst uitproberen voordat ik overstap?",
        answer:
            "Zeker, tijdens de demo en een proefperiode kunt u de belangrijkste functies "
            "uitproberen voordat u definitief overstapt.",
      ),
    ],
  ),
  _FaqCategoryData(
    pillLabel: "Functionaliteiten & koppelingen",
    heading: "Functionaliteiten & koppelingen",
    items: [
      _FaqItemData(
        question: "Met welke systemen kan Odontium koppelen?",
        answer:
            "Odontium koppelt met een groot aantal röntgen-, betaal- en communicatiesystemen. "
            "Bekijk de integratiepagina voor het volledige overzicht.",
      ),
      _FaqItemData(
        question: "Ondersteunt Odontium digitale röntgen- en camerasystemen?",
        answer:
            "Ja, beeldmateriaal van de meest gebruikte röntgen- en camerasystemen wordt "
            "automatisch gekoppeld aan het patiëntdossier.",
      ),
      _FaqItemData(
        question: "Kan ik online afspraken laten inplannen?",
        answer:
            "Patiënten kunnen via een online agenda zelf een moment kiezen dat automatisch in uw "
            "planning wordt verwerkt.",
      ),
      _FaqItemData(
        question: "Kan Odontium herinneringen naar patiënten versturen?",
        answer:
            "Odontium verstuurt automatisch afspraakherinneringen per sms of e-mail, wat het "
            "aantal no-shows aanzienlijk verlaagt.",
      ),
    ],
  ),
  _FaqCategoryData(
    pillLabel: "Veiligheid",
    heading: "Veiligheid",
    items: [
      _FaqItemData(
        question: "Hoe worden mijn patiëntgegevens beveiligd?",
        answer:
            "Alle gegevens worden versleuteld opgeslagen en verzonden, met strikte "
            "toegangscontrole per medewerker.",
      ),
      _FaqItemData(
        question: "Is Odontium ISO-27001 gecertificeerd?",
        answer:
            "Ja, Odontium voldoet aan de ISO-27001 norm voor informatiebeveiliging en wordt "
            "jaarlijks extern getoetst.",
      ),
      _FaqItemData(
        question: "Worden er automatisch back-ups gemaakt?",
        answer:
            "Uw gegevens worden dagelijks automatisch geback-upt en versleuteld opgeslagen op "
            "meerdere locaties.",
      ),
      _FaqItemData(
        question: "Voldoet Odontium aan de AVG?",
        answer:
            "Odontium is volledig ingericht volgens de AVG, inclusief verwerkersovereenkomsten en "
            "rechten voor patiënten op inzage en verwijdering.",
      ),
    ],
  ),
  _FaqCategoryData(
    pillLabel: "Support",
    heading: "Support",
    items: [
      _FaqItemData(
        question: "Hoe bereik ik de support?",
        answer:
            "U kunt de supportafdeling bereiken via telefoon, e-mail of het helpcenter direct "
            "vanuit Odontium.",
      ),
      _FaqItemData(
        question: "Wanneer is support bereikbaar?",
        answer:
            "Onze support is op werkdagen bereikbaar tijdens praktijkuren, met "
            "spoedbereikbaarheid buiten die tijden.",
      ),
      _FaqItemData(
        question: "Spreek ik direct met iemand die Odontium kent?",
        answer:
            "Ja, u komt altijd in contact met een supportmedewerker die bekend is met Odontium en "
            "de mondzorgpraktijk.",
      ),
      _FaqItemData(
        question: "Krijg ik ook ondersteuning na de implementatie?",
        answer:
            "Na de implementatie blijft u dezelfde toegang tot support houden, inclusief updates, "
            "trainingen en advies.",
      ),
    ],
  ),
  _FaqCategoryData(
    pillLabel: "Kosten & licentie",
    heading: "Kosten & licentie",
    items: [
      _FaqItemData(
        question: "Hoe wordt de prijs van Odontium bepaald?",
        answer:
            "De prijs is gebaseerd op het aantal behandelaars en de functionaliteiten die u "
            "gebruikt. U ontvangt altijd een offerte op maat.",
      ),
      _FaqItemData(
        question: "Zijn er maandelijkse kosten?",
        answer:
            "Odontium werkt met een vast maandelijks abonnement, zonder verrassingen achteraf.",
      ),
      _FaqItemData(
        question: "Kan Odontium meegroeien met mijn praktijk?",
        answer:
            "Ja, u kunt eenvoudig behandelaars, locaties of modules toevoegen naarmate uw "
            "praktijk groeit.",
      ),
    ],
  ),
];

class VeelgesteldeVragenPage extends StatefulWidget {
  const VeelgesteldeVragenPage({super.key});

  @override
  State<VeelgesteldeVragenPage> createState() => _VeelgesteldeVragenPageState();
}

class _VeelgesteldeVragenPageState extends State<VeelgesteldeVragenPage> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(_categories.length, (_) => GlobalKey());

  String _query = '';
  int _activeCategory = 0;
  String? _expandedKey;

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  bool _matches(_FaqItemData item) {
    if (_query.isEmpty) return true;
    return item.question.toLowerCase().contains(_query) ||
        item.answer.toLowerCase().contains(_query);
  }

  void _selectCategory(int index) {
    setState(() {
      _activeCategory = index;
      _query = '';
      _searchController.clear();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = _sectionKeys[index].currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          alignment: 0.08,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    final noMatchesAtAll = _query.isNotEmpty && !_categories.any((c) => c.items.any(_matches));

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const SizedBox(height: 56),
            BlockContainer(
              screenWidthFactor: 1,
              padding: EdgeInsets.symmetric(
                horizontal: mobile ? 20 : 48,
                vertical: mobile ? 40 : 72,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: Column(
                    children: [
                      const Text(
                        "Veelgestelde vragen",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: _teal,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Waar kunnen we u mee helpen?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: mobile ? 26 : 42,
                          fontWeight: FontWeight.bold,
                          color: _darkTeal,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Doorzoek onze veelgestelde vragen of blader door onderwerp.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: _subtext),
                      ),
                      const SizedBox(height: 32),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 520),
                        child: TextField(
                          controller: _searchController,
                          onChanged: (value) => setState(() => _query = value.trim().toLowerCase()),
                          decoration: InputDecoration(
                            hintText: "Zoek een vraag, bijvoorbeeld 'migratie' of 'support'",
                            hintStyle: const TextStyle(color: _subtext, fontSize: 14),
                            prefixIcon: const Icon(Icons.search, color: _subtext, size: 20),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(vertical: 14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: const BorderSide(color: _pillBorder),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: const BorderSide(color: _pillBorder),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: const BorderSide(color: _teal, width: 1.5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (var i = 0; i < _categories.length; i++)
                            _CategoryPill(
                              label: _categories[i].pillLabel,
                              selected: _activeCategory == i,
                              onTap: () => _selectCategory(i),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            for (var i = 0; i < _categories.length; i++)
              if (_categories[i].items.any(_matches)) _buildCategorySection(i, mobile),
            if (noMatchesAtAll)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Text(
                  "Geen vragen gevonden voor \"${_searchController.text}\".",
                  style: const TextStyle(fontSize: 15, color: _subtext),
                ),
              ),
            WebsiteFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(int index, bool isMobile) {
    final category = _categories[index];
    final visibleItemIndexes = [
      for (var j = 0; j < category.items.length; j++) if (_matches(category.items[j])) j,
    ];

    return BlockContainer(
      key: _sectionKeys[index],
      screenWidthFactor: 1,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 28 : 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.heading,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _teal),
              ),
              const SizedBox(height: 12),
              const Divider(color: _dividerColor, thickness: 1),
              for (final j in visibleItemIndexes)
                _FaqTile(
                  item: category.items[j],
                  expanded: _expandedKey == '$index-$j',
                  onTap: () => setState(() {
                    final key = '$index-$j';
                    _expandedKey = _expandedKey == key ? null : key;
                  }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FaqTile extends StatelessWidget {
  final _FaqItemData item;
  final bool expanded;
  final VoidCallback onTap;

  const _FaqTile({required this.item, required this.expanded, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item.question,
                    style: const TextStyle(fontSize: 15, color: Color(0xFF222222)),
                  ),
                ),
                const SizedBox(width: 16),
                AnimatedRotation(
                  turns: expanded ? 0.125 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    expanded ? Icons.remove : Icons.add,
                    size: 22,
                    color: _darkTeal,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          crossFadeState: expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          firstChild: const SizedBox.shrink(),
          secondChild: Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 36),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                item.answer,
                style: const TextStyle(fontSize: 14, height: 1.6, color: _subtext),
              ),
            ),
          ),
        ),
        const Divider(height: 1, thickness: 1, color: _dividerColor),
      ],
    );
  }
}

class _CategoryPill extends StatefulWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryPill({required this.label, required this.selected, required this.onTap});

  @override
  State<_CategoryPill> createState() => _CategoryPillState();
}

class _CategoryPillState extends State<_CategoryPill> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final selected = widget.selected;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: selected ? _darkTeal : (_hovering ? const Color(0xFFEFF6F7) : Colors.white),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: selected ? _darkTeal : _pillBorder),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : _darkTeal,
            ),
          ),
        ),
      ),
    );
  }
}
