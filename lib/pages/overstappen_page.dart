import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/general/block_container.dart';
import '../widgets/general/demo_cta_banner.dart';
import '../widgets/general/footer.dart';
import '../widgets/general/hover_arrow_button.dart';
import '../widgets/general/responsibility_card.dart';
import '../widgets/general/responsive.dart';
import '../widgets/home_page/faq.dart';
import '../widgets/review_section.dart';

const _darkTeal = Color(0xFF0F3B3F);
const _teal = Color(0xFF17A8A6);
const _subtext = Color(0xFF616161);
const _mint = Color(0xFFEAF5F1);

class OverstappenPage extends StatefulWidget {
  const OverstappenPage({super.key});

  @override
  State<OverstappenPage> createState() => _OverstappenPageState();
}

class _OverstappenPageState extends State<OverstappenPage> {
  int _selectedFaqPhase = 0;

  static const List<String> _weDoBullets = [
    "Uw gegevens uitlezen en overzetten",
    "Een testomgeving klaarzetten ter controle",
    "Odontium inrichten naar uw werkwijze",
    "Uw team trainen met de eigen gegevens",
    "De eerste weken extra meekijken",
  ];

  static const List<String> _weAskBullets = [
    "Eén vast aanspreekpunt binnen de praktijk",
    "Toegang tot uw huidige systeem of een export",
    "Circa [2] uur om de proefmigratie te controleren",
    "Een dagdeel waarop het team kan trainen",
    "Een geschikte datum voor de livegang",
  ];

  static const List<List<FAQItem>> _faqPhases = [
    // Voor de overstap
    [
      FAQItem(
        question: "Hoeveel tijd kost het om over te stappen?",
        answer:
            "Gemiddeld duurt het hele traject ongeveer vier weken, van het eerste gesprek tot de "
            "livegang.",
      ),
      FAQItem(
        question: "Kan ik overstappen zonder mijn praktijk te onderbreken?",
        answer:
            "Ja, we werken eerst met een proefmigratie in een testomgeving, zodat uw praktijk "
            "gewoon operationeel blijft totdat u zelf de livegang bepaalt.",
      ),
      FAQItem(
        question: "Wat gebeurt er met mijn huidige software tijdens de overstap?",
        answer:
            "Uw oude systeem blijft beschikbaar totdat u volledig bent overgestapt, en wordt pas "
            "de eerste weken na livegang uitgezet.",
      ),
      FAQItem(
        question: "Kan ik zelf bepalen wanneer we live gaan?",
        answer:
            "Ja, u bepaalt zelf de datum van de livegang, pas nadat u de software heeft getest "
            "met uw eigen gegevens.",
      ),
      FAQItem(
        question: "Wat kost overstappen naar Odontium?",
        answer:
            "U ontvangt binnen enkele werkdagen een persoonlijk voorstel met een vaste prijs, "
            "zodat de migratiekosten vooraf inzichtelijk zijn.",
      ),
    ],
    // Tijdens de overstap
    [
      FAQItem(
        question: "Kan ik tijdens de proefmigratie nog wijzigingen aanvragen?",
        answer:
            "Ja, tijdens de proefmigratie in de testomgeving kunt u alles controleren en "
            "eventuele wensen doorgeven voordat de echte overstap plaatsvindt.",
      ),
      FAQItem(
        question: "Blijft mijn oude systeem beschikbaar tijdens de overstap?",
        answer:
            "Ja, uw oude systeem blijft beschikbaar totdat u volledig bent overgestapt, zodat u "
            "nooit zonder toegang tot uw gegevens zit.",
      ),
      FAQItem(
        question: "Hoeveel begeleiding krijg ik tijdens het inrichten?",
        answer:
            "Ons team begeleidt u tijdens de volledige inrichting: van het afstemmen van de "
            "software tot de training van uw team met uw eigen gegevens.",
      ),
      FAQItem(
        question: "Kan mijn team al oefenen voordat we live gaan?",
        answer:
            "Ja, uw team oefent met de eigen gegevens uit de proefmigratie tijdens het "
            "trainingsdagdeel, nog voordat de livegang plaatsvindt.",
      ),
      FAQItem(
        question: "Wat als er tijdens de migratie iets misgaat?",
        answer:
            "Omdat we eerst een proefmigratie in een testomgeving uitvoeren, worden eventuele "
            "problemen daar opgevangen — uw praktijk blijft tijdens de proef gewoon operationeel.",
      ),
    ],
    // Na de overstap
    [
      FAQItem(
        question: "Stopt de begeleiding zodra ik live ben?",
        answer:
            "Nee, bij Odontium stopt onze begeleiding niet zodra u live bent. Ons supportteam "
            "blijft voor u klaarstaan bij vragen of advies.",
      ),
      FAQItem(
        question: "Krijg ik een vast aanspreekpunt na de livegang?",
        answer:
            "Ja, u behoudt dezelfde mensen die uw overstap begeleidden als vast aanspreekpunt, "
            "ook na de livegang.",
      ),
      FAQItem(
        question: "Zijn updates na de overstap inbegrepen?",
        answer: "Ja, nieuwe functies en updates zijn inbegrepen zonder meerkosten.",
      ),
      FAQItem(
        question: "Kunnen nieuwe medewerkers later nog training krijgen?",
        answer: "Ja, bijscholing is ook beschikbaar voor nieuwe medewerkers die later instromen.",
      ),
      FAQItem(
        question: "Hoe bereik ik het supportteam?",
        answer:
            "U kunt ons supportteam telefonisch bereiken, zonder tussenkomst van een "
            "ticketsysteem als eerste stap.",
      ),
    ],
  ];

  static const List<_BandItem> _bandItems = [
    _BandItem(Icons.workspace_premium_outlined, "Meer dan 35 jaar ervaring"),
    _BandItem(Icons.verified_user_outlined, "ISO 27001 gecertificeerd"),
    _BandItem(Icons.support_agent_outlined, "Persoonlijke ondersteuning"),
    _BandItem(Icons.cloud_done_outlined, "Cloud én lokaal mogelijk"),
  ];

  static const List<_SupportCard> _supportCards = [
    _SupportCard(
      icon: Icons.support_agent_outlined,
      title: "Vast aanspreekpunt",
      description: "Dezelfde mensen die uw overstap begeleidden.",
    ),
    _SupportCard(
      icon: Icons.phone_outlined,
      title: "Telefonisch bereikbaar",
      description: "Geen ticketsysteem als eerste stap.",
    ),
    _SupportCard(
      icon: Icons.school_outlined,
      title: "Bijscholing",
      description: "Ook voor nieuwe medewerkers die later instromen.",
    ),
    _SupportCard(
      icon: Icons.upgrade_outlined,
      title: "Updates inbegrepen",
      description: "Nieuwe functies zonder meerkosten.",
    ),
  ];

  static const List<String> _faqPhaseLabels = ["Voor de overstap", "Tijdens de overstap", "Na de overstap"];

  static const List<_TimelineStep> _steps = [
    _TimelineStep(
      number: 1,
      color: Color(0xFF7FD8C4),
      title: "Gratis Demo",
      timeLabel: "30 minuten",
      description:
          "Tijdens een persoonlijke online demo laten we zien hoe Odontium aansluit op uw praktijk. "
          "We nemen de tijd om uw werkwijze te begrijpen en beantwoorden al uw vragen, zodat u een "
          "duidelijk beeld heeft voordat u een beslissing neemt.",
      tags: ["Online, bij u op kantoor kan ook", "Geen verplichtingen", "Neem uw team gerust mee"],
    ),
    _TimelineStep(
      number: 2,
      color: Color(0xFF3FC1B0),
      title: "Persoonlijk voorstel",
      timeLabel: "binnen [3] werkdagen",
      description:
          "Iedere praktijk is anders. Daarom stellen we een voorstel op dat aansluit op uw situatie: "
          "het aantal gebruikers, gewenste modules en de keuze tussen cloud of een lokale installatie.",
      tags: ["Vaste prijs, geen nacalculatie", "Migratiekosten vooraf inzichtelijk", "[30] dagen geldig"],
    ),
    _TimelineStep(
      number: 3,
      color: _teal,
      title: "Veilige datamigratie",
      timeLabel: "overdracht circa 2 uur",
      description:
          "Wij zetten uw gegevens over: patiëntdossiers, behandelhistorie, agenda en financiële "
          "administratie. Eerst als proefmigratie in de testomgeving, zodat u controleert of alles "
          "klopt vóór de echte overstap.",
      tags: ["Eerst een proefmigratie", "Versleutelde overdracht", "Uw oude systeem blijft beschikbaar"],
    ),
    _TimelineStep(
      number: 4,
      color: Color(0xFF2E9BE0),
      title: "Inrichten & begeleiding",
      timeLabel: "[1] dagdeel training",
      description:
          "We richten Odontium samen met u in en stemmen de software af op uw werkwijze. Uw team "
          "oefent met de eigen gegevens uit de proefmigratie, niet met voorbeelddata. Dat is meer "
          "dan training: u test, stelt vragen en krijgt begeleiding waar nodig.",
      tags: ["Training met uw eigen gegevens", "Op locatie of online", "Rechten per medewerker ingesteld"],
    ),
    _TimelineStep(
      number: 5,
      color: Color(0xFF8FCBEA),
      title: "Livegang",
      timeLabel: "u bepaalt de datum",
      description:
          "Wanneer u er klaar voor bent, gaat uw praktijk live. Omdat u de software al heeft gebruikt "
          "en uw gegevens beschikbaar zijn, verloopt deze stap soepel. De eerste [twee] weken kijken "
          "wij extra mee.",
      tags: ["Zelf de datum kiezen", "Extra support in week 1 en 2", "Oude systeem pas daarna uit"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 56),
            BlockContainer(
              screenWidthFactor: 1,
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  // Purely decorative rotated square behind the heading -- dropped on
                  // mobile since its 300x300 footprint (rotated, ~424px diagonal) has
                  // nowhere to go on a narrow viewport and just bleeds off-screen.
                  if (!isMobile(context))
                    Positioned(
                      top: -30,
                      child: Transform.rotate(
                        angle: math.pi / 4,
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            color: _teal.withValues(alpha: 0.06),
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                    ),
                  Column(
                    children: [
                      const Text(
                        "Overstappen naar",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _darkTeal),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "lib/assets/Odontium.png",
                            width: 40,
                            height: 40,
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(color: _teal, borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          const SizedBox(width: 14),
                          const Text(
                            "Odontium",
                            style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: _teal),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 680),
                        child: const Text(
                          "Overstappen naar nieuwe praktijksoftware hoeft niet ingewikkeld te zijn. Van "
                          "de eerste kennismaking tot de livegang en daarna begeleiden wij u stap voor "
                          "stap. U houdt altijd de controle, terwijl wij zorgen voor een veilige "
                          "overstap en persoonlijke ondersteuning.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        alignment: WrapAlignment.center,
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
                            child: const Text(
                              "Plan een demo",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: _darkTeal,
                              side: const BorderSide(color: Color(0xFFDADADA)),
                              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text(
                              "Neem contact op",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BlockContainer(
              backgroundColor: _teal,
              screenWidthFactor: 1,
              hasHorizontalPadding: false,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 32,
                runSpacing: 16,
                children: [for (final item in _bandItems) _BandItemView(item: item)],
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Van kennismaking tot livegang",
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: _darkTeal),
                      ),
                      const SizedBox(height: 10),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 620),
                        child: const Text(
                          "Vijf duidelijke stappen, waarbij u nooit alleen staat. Ons team begeleidt u "
                          "persoonlijk gedurende het hele traject.",
                          style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.info_outline, size: 16, color: _teal),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Gemiddeld vier weken van eerste gesprek tot livegang.",
                              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: _teal),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      for (var i = 0; i < _steps.length; i++)
                        _TimelineStepRow(
                          step: _steps[i],
                          isFirst: i == 0,
                          isLast: i == _steps.length - 1,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              gradient: const LinearGradient(
                colors: [Color.fromRGBO(77, 132, 152, 1), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              child: Column(
                children: [
                  const Text(
                    "Ook na de livegang\nblijven we betrokken",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white, height: 1.3),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 650),
                    child: const Text(
                      "Bij Odontium stopt onze begeleiding niet zodra u live bent. Heeft u een vraag, "
                      "loopt u ergens tegenaan of wilt u advies? Dan staat ons supportteam voor u "
                      "klaar, mensen die de software kennen en begrijpen hoe een praktijk werkt.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.white70, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: isMobile(context)
                        ? Column(
                            children: [
                              for (var i = 0; i < _supportCards.length; i++) ...[
                                if (i != 0) const SizedBox(height: 16),
                                _SupportCardView(data: _supportCards[i]),
                              ],
                            ],
                          )
                        : IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                for (var i = 0; i < _supportCards.length; i++) ...[
                                  if (i != 0) const SizedBox(width: 16),
                                  Expanded(child: _SupportCardView(data: _supportCards[i])),
                                ],
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: _darkTeal),
                      children: [
                        TextSpan(text: "Wat praktijken zeggen over de "),
                        TextSpan(text: "overstap", style: TextStyle(color: _teal)),
                        TextSpan(text: " naar Odontium"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  TestimonialSection(
                    data: const TestimonialData(
                      photoAsset: 'assets/images/testimonial_joep.jpg',
                      authorName: 'Joep van Engelen',
                      authorRole: 'TPP van Engelen',
                      quote: [
                        TextSpan(text: 'Het programma kan veel meer dan je in eerste instantie denkt. '),
                        TextSpan(text: 'We hebben al heel veel '),
                        TextSpan(text: "'Aha!' momenten", style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' gehad. Met '),
                        TextSpan(text: 'feedback', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' en '),
                        TextSpan(text: 'adviezen', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' doen ze ook daadwerkelijk iets; je ziet deze terug in de '),
                        TextSpan(text: 'updates', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: '.'),
                      ],
                    ),
                    onCtaPressed: () {},
                  ),
                ],
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile(context) ? 20 : 32,
                  vertical: isMobile(context) ? 32 : 48,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(226, 238, 245, 1),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Wat wij doen, en wat wij\nvan u vragen",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: _darkTeal, height: 1.3),
                    ),
                    const SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 620),
                      child: const Text(
                        "Een overstap lukt alleen samen. Daarom zijn we vooraf duidelijk over wat er "
                        "van uw praktijk wordt verwacht, zodat u er rekening mee kunt houden in de "
                        "planning.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 32),
                    isMobile(context)
                        ? const Column(
                            children: [
                              ResponsibilityCard(
                                icon: Icons.assignment_outlined,
                                title: "Wat wij doen",
                                bullets: _weDoBullets,
                              ),
                              SizedBox(height: 16),
                              ResponsibilityCard(
                                icon: Icons.person_outline,
                                title: "Wat wij van u vragen",
                                bullets: _weAskBullets,
                              ),
                            ],
                          )
                        : IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: ResponsibilityCard(
                                    icon: Icons.assignment_outlined,
                                    title: "Wat wij doen",
                                    bullets: _weDoBullets,
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: ResponsibilityCard(
                                    icon: Icons.person_outline,
                                    title: "Wat wij van u vragen",
                                    bullets: _weAskBullets,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Column(
                    children: [
                      const Text(
                        "Veelgestelde vragen over\noverstappen",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _darkTeal, height: 1.3),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Antwoorden op de vragen die we het vaakst horen, ingedeeld per fase van de "
                        "overstap.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (var i = 0; i < _faqPhaseLabels.length; i++)
                            _FaqPhaseTab(
                              label: _faqPhaseLabels[i],
                              selected: _selectedFaqPhase == i,
                              onTap: () => setState(() => _selectedFaqPhase = i),
                            ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _faqPhaseLabels[_selectedFaqPhase],
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: _teal),
                        ),
                      ),
                      const SizedBox(height: 8),
                      FAQSection(
                        showTitle: false,
                        showTopDivider: true,
                        items: _faqPhases[_selectedFaqPhase],
                        trailing: HoverArrowButton(
                          label: "Alle veelgestelde vragen",
                          onPressed: () => context.go('/veelgestelde-vragen'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const DemoCtaBanner(
              heading: "Klaar om de overstap te maken?",
              description:
                  "Plan een gratis demo en ontdek hoe eenvoudig overstappen naar Odontium kan zijn. "
                  "We laten u graag zien hoe de software aansluit op uw praktijk en begeleiden u bij "
                  "iedere stap van het proces.",
            ),
            WebsiteFooter(),
          ],
        ),
      ),
    );
  }
}

class _BandItem {
  final IconData icon;
  final String label;

  const _BandItem(this.icon, this.label);
}

class _BandItemView extends StatelessWidget {
  final _BandItem item;

  const _BandItemView({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Icon(item.icon, size: 14, color: _teal),
        ),
        const SizedBox(width: 10),
        Text(
          item.label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ],
    );
  }
}

class _TimelineStep {
  final int number;
  final Color color;
  final String title;
  final String timeLabel;
  final String description;
  final List<String> tags;

  const _TimelineStep({
    required this.number,
    required this.color,
    required this.title,
    required this.timeLabel,
    required this.description,
    required this.tags,
  });
}

class _TimelineStepRow extends StatelessWidget {
  final _TimelineStep step;
  final bool isFirst;
  final bool isLast;

  const _TimelineStepRow({required this.step, required this.isFirst, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    // Title + time label used to sit in a baseline Row, which is fine when the
    // text column gets ~3/5 of a ~1000px-wide desktop layout but overflows once
    // that column shrinks to mobile width (long titles like "Inrichten &
    // begeleiding" plus their time label no longer fit on one line). A Wrap
    // lets the pair fall onto a second line instead of overflowing.
    final titleBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            Text(
              step.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _darkTeal),
            ),
            Text(
              step.timeLabel,
              style: const TextStyle(fontSize: 12, color: _subtext, fontStyle: FontStyle.italic),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          step.description,
          style: const TextStyle(fontSize: 13, color: Colors.black87, height: 1.5),
        ),
      ],
    );

    final tagsBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [for (final tag in step.tags) _TimelineTag(tag)],
    );

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: mobile ? 60 : 90,
            child: isFirst
                ? Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.only(top: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: step.color,
                          boxShadow: [
                            BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 8, offset: const Offset(0, 3)),
                          ],
                        ),
                        child: const Icon(Icons.headset_mic_outlined, size: 18, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Persoonlijke ondersteuning gedurende iedere stap",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, color: _subtext, height: 1.3),
                      ),
                      const SizedBox(height: 12),
                      const Expanded(child: _DashedVerticalLine()),
                    ],
                  )
                : const _DashedVerticalLine(),
          ),
          SizedBox(
            width: mobile ? 44 : 56,
            child: Column(
              children: [
                Expanded(child: isFirst ? const SizedBox() : Container(width: 2, color: const Color(0xFFDCEEF2))),
                Transform.rotate(
                  angle: math.pi / 4,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: step.color, borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Transform.rotate(
                        angle: -math.pi / 4,
                        child: Text(
                          '${step.number}',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: isLast ? const SizedBox() : Container(width: 2, color: const Color(0xFFDCEEF2))),
              ],
            ),
          ),
          SizedBox(width: mobile ? 12 : 24),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: mobile ? 16 : 20),
              child: mobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        titleBlock,
                        const SizedBox(height: 12),
                        tagsBlock,
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3, child: titleBlock),
                        const SizedBox(width: 24),
                        Expanded(flex: 2, child: tagsBlock),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedVerticalLine extends StatelessWidget {
  const _DashedVerticalLine();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        8,
        (i) => Expanded(
          child: Container(
            width: 3,
            margin: const EdgeInsets.symmetric(vertical: 1.5),
            decoration: BoxDecoration(
              color: i.isEven ? _teal.withValues(alpha: 0.45) : Colors.transparent,
              borderRadius: BorderRadius.circular(1.5),
            ),
          ),
        ),
      ),
    );
  }
}

class _TimelineTag extends StatelessWidget {
  final String text;

  const _TimelineTag(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: _mint, borderRadius: BorderRadius.circular(6)),
        child: Text(
          text,
          style: const TextStyle(fontSize: 11, color: _darkTeal, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _SupportCard {
  final IconData icon;
  final String title;
  final String description;

  const _SupportCard({required this.icon, required this.title, required this.description});
}

class _SupportCardView extends StatelessWidget {
  final _SupportCard data;

  const _SupportCardView({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(data.icon, size: 22, color: _darkTeal),
          const SizedBox(height: 12),
          Text(
            data.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: _darkTeal),
          ),
          const SizedBox(height: 6),
          Text(
            data.description,
            style: const TextStyle(fontSize: 12, color: _subtext, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _FaqPhaseTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FaqPhaseTab({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? _darkTeal : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: selected ? _darkTeal : const Color(0xFFDADADA)),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.white : _darkTeal,
          ),
        ),
      ),
    );
  }
}
