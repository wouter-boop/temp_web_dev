import '../widgets/general/auto_scroll_view.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import '../widgets/general/type_scale.dart';
import '../widgets/general/content_container.dart';
import 'package:go_router/go_router.dart';
import 'package:Odontium/widgets/general/footer.dart';

import '../widgets/general/block_container.dart';
import '../widgets/general/demo_cta_banner.dart';
import '../widgets/general/hover_arrow_button.dart';
import '../widgets/general/micro_animations.dart';
import '../widgets/general/responsibility_card.dart';
import '../widgets/general/responsive.dart';
import '../widgets/general/reveal_on_scroll.dart';
import '../widgets/home_page/faq.dart';

const _darkTeal = Color(0xFF0F3B3F);
const _teal = Color(0xFF17A8A6);
const _subtext = Color(0xFF616161);
const _mint = Color(0xFFEAF5F1);

class BeveiligingPage extends StatefulWidget {
  const BeveiligingPage({super.key});

  @override
  State<BeveiligingPage> createState() => _BeveiligingPageState();
}

class _BeveiligingPageState extends State<BeveiligingPage> {
  static const List<_BandItem> _bandItems = [
    _BandItem(Icons.workspace_premium_outlined, "Beveiligingscertificaties"),
    _BandItem(Icons.backup_outlined, "Automatische back-ups"),
    _BandItem(Icons.lock_outline, "Veilige toegang"),
    _BandItem(Icons.headset_mic_outlined, "Eigen supportteam"),
  ];

  static const List<_CertData> _certs = [
    _CertData(
      label: "NEN 7510",
      normVersion: "NEN 7510:2024",
      certNumber: "K-0227561 / 2",
      issuer: "Kiwa Nederland B.V. (Kiwa)",
      validUntil: "05-01-2029",
      description:
          "NEN 7510 is de Nederlandse norm voor informatiebeveiliging in de zorg. De norm is specifiek "
          "geschreven voor organisaties die met patiëntgegevens werken en gaat verder dan algemene "
          "IT-beveiliging: hij stelt eisen aan hoe zorgdata wordt opgeslagen, wie er toegang toe heeft "
          "en hoe incidenten worden gemeld.",
      bullets: [
        "Specifiek voor de Nederlandse zorgsector",
        "Jaarlijks getoetst door een onafhankelijke auditor",
        "Sluit direct aan op uw AVG-verplichtingen",
      ],
    ),
    _CertData(
      label: "ISO 9001",
      normVersion: "ISO 9001:2015",
      certNumber: "K-0223485 / 1",
      issuer: "Kiwa Nederland B.V. (Kiwa)",
      validUntil: "13-04-2028",
      description:
          "ISO 9001 is de internationale norm voor kwaliteitsmanagement. De norm toont aan dat onze "
          "processen gestructureerd, controleerbaar en gericht zijn op continue verbetering — van "
          "softwareontwikkeling tot klantondersteuning.",
      bullets: [
        "Internationaal erkende kwaliteitsstandaard",
        "Continue verbetering van interne processen",
        "Onafhankelijk gecertificeerd en periodiek herzien",
      ],
    ),
    _CertData(
      label: "ISO 27001",
      normVersion: "ISO 27001:2022",
      certNumber: "K-0227558 / 2",
      issuer: "Kiwa Nederland B.V. (Kiwa)",
      validUntil: "05-01-2029",
      description:
          "ISO 27001 is de internationale norm voor informatiebeveiliging en vormt de basis onder "
          "NEN 7510. De norm toont aan dat risico's rond informatiebeveiliging structureel worden "
          "geïdentificeerd, beheerst en gemonitord.",
      bullets: [
        "Internationale basis voor informatiebeveiliging",
        "Structureel risicomanagement",
        "Fundament van de Nederlandse NEN 7510-norm",
      ],
    ),
  ];

  int _selectedCertIndex = 0;

  static const List<String> _accessBullets = [
    "Rechten per rol, in te stellen per praktijk",
    "Toegang direct in te trekken bij uitdiensttreding",
    "Tweestapsverificatie voor extra zekerheid",
    "Elke inzage wordt gelogd en is terug te zien",
  ];

  static const List<String> _weArrangeBullets = [
    "Versleutelde opslag en dagelijkse back-ups",
    "Beveiliging van het datacentrum",
    "Onafhankelijke audits en certificering",
    "Melding van incidenten binnen [24] uur",
    "Een verwerkersovereenkomst die klaarstaat",
  ];

  static const List<String> _youArrangeBullets = [
    "Wie in uw team toegang krijgt",
    "Intrekken van toegang bij uitdiensttreding",
    "Uw eigen wachtwoordbeleid",
    "Welke gegevens u vastlegt in het dossier",
  ];

  static const List<FAQItem> _securityFaqItems = [
    FAQItem(
      question: "Worden er automatisch back-ups gemaakt?",
      answer:
          "Ja. Odontium maakt dagelijks automatische back-ups op een gescheiden locatie, die maandelijks "
          "worden getest om herstelbaarheid te garanderen.",
    ),
    FAQItem(
      question: "Wie heeft toegang tot mijn gegevens?",
      answer:
          "Toegang wordt per rol ingesteld binnen uw praktijk: een baliemedewerker ziet bijvoorbeeld de "
          "agenda maar geen financiele informatie. Onze eigen supportmedewerkers hebben geen standaard inzage — "
          "alleen met uw expliciete toestemming, en elke toegang wordt gelogd.",
    ),
    FAQItem(
      question: "Wat gebeurt er als Odontium een beveiligingsincident heeft?",
      answer:
          "Incidenten worden binnen [24] uur gemeld aan uw praktijk, conform de afspraken in de "
          "verwerkersovereenkomst.",
    ),
    FAQItem(
      question: "Hoe veilig verloopt de overstap?",
      answer:
          "Bij een overstap begeleiden we de volledige data-migratie, versleuteld en stap voor stap, "
          "zodat er geen gegevens verloren gaan of onbeveiligd worden verzonden.",
    ),
    FAQItem(
      question: "Heeft Odontium een verwerkersovereenkomst?",
      answer:
          "Ja, een verwerkersovereenkomst staat klaar en kan direct worden ondertekend bij het starten "
          "van uw abonnement.",
    ),
    FAQItem(
      question: "Wat gebeurt er met mijn gegevens als ik stop met Odontium?",
      answer:
          "Op uw verzoek worden uw gegevens overgedragen of veilig verwijderd, binnen de termijn die in "
          "de verwerkersovereenkomst is afgesproken.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoScrollView(
        child: Column(
          children: [
            const SizedBox(height: 56),
            BlockContainer(
              screenWidthFactor: 1,
              child: Center(
                child: ContentContainer(
                  child: Builder(
                    builder: (context) {
                      final mobile = isMobile(context);
                      final heroText = Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Veiligheid waarop u\nkunt vertrouwen",
                            style: TextStyle(
                              fontSize: AppFont.h1(context),
                              fontWeight: FontWeight.bold,
                              color: _darkTeal,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 460),
                            child: const Text(
                              "Patiëntgegevens zijn waardevol. Daarom staat veiligheid centraal in alles wat we doen. "
                              "Van veilige opslag en back-ups tot een zorgeloze overstap: met Odontium werkt u met "
                              "een oplossing waarop u kunt vertrouwen.",
                              style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                            ),
                          ),
                          const SizedBox(height: 20),
                          HoverScale(
                            child: PulseGlow(
                              borderRadius: 20,
                              child: ElevatedButton(
                                onPressed: () => context.go('/contact'),
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
                            ),
                          ),
                        ],
                      );

                      if (mobile) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            heroText,
                            const SizedBox(height: 32),
                            const Center(child: _SecurityIllustration()),
                          ],
                        );
                      }

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: heroText),
                          const SizedBox(width: 32),
                          const _SecurityIllustration(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            BlockContainer(
              backgroundColor: _teal,
              screenWidthFactor: 1,
              hasHorizontalPadding: false,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Builder(
                builder: (context) {
                  if (isMobile(context)) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 20,
                        runSpacing: 16,
                        children: [for (final item in _bandItems) _BandItemView(item: item)],
                      ),
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [for (final item in _bandItems) _BandItemView(item: item)],
                  );
                },
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              child: Center(
                child: ContentContainer(
                  child: Column(
                    children: [
                      Text(
                        "Wat deze certificering\nécht betekent",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: AppFont.h2(context), fontWeight: FontWeight.bold, color: _darkTeal, height: 1.3),
                      ),
                      const SizedBox(height: 16),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 620),
                        child: const Text(
                          "Certificaten zijn meer dan een logo. Ze betekenen dat een onafhankelijke "
                          "partij onze processen uitvoerig heeft gecontroleerd.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Builder(
                        builder: (context) {
                          final mobile = isMobile(context);

                          // One big wheel: the outer ring is split into three
                          // independently clickable thirds, one per
                          // certificate. Selecting a third sweeps its arc in
                          // (ease-in-out, with the travelling glow dot) while
                          // the center swaps to that certificate.
                          final wheel = _CertWheel(
                            size: mobile ? 260 : 320,
                            selectedIndex: _selectedCertIndex,
                            onSelect: (i) => setState(() => _selectedCertIndex = i),
                            labels: [for (final cert in _certs) cert.label],
                            centerChild: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _mint,
                                border: Border.all(color: const Color(0xFFB8D9CE), width: 1.5),
                              ),
                              child: Center(
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 350),
                                  transitionBuilder: (child, animation) => ScaleTransition(
                                    scale: animation,
                                    child: FadeTransition(opacity: animation, child: child),
                                  ),
                                  child: Padding(
                                    key: ValueKey(_certs[_selectedCertIndex].label),
                                    padding: const EdgeInsets.symmetric(horizontal: 26),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Wiggle(
                                          interval: const Duration(seconds: 5),
                                          child: const Icon(Icons.verified_user_outlined, size: 28, color: _darkTeal),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          _certs[_selectedCertIndex].label,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: mobile ? 15 : 17,
                                            fontWeight: FontWeight.bold,
                                            color: _darkTeal,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "Geldig tot ${_certs[_selectedCertIndex].validUntil}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: mobile ? 10.5 : 12, color: _subtext),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );

                          // Slide/fade the text along with the circle when a
                          // different certificate pill is selected.
                          final details = AnimatedSwitcher(
                            duration: const Duration(milliseconds: 350),
                            transitionBuilder: (child, animation) => FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0.05, 0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              ),
                            ),
                            child: Column(
                            key: ValueKey(_certs[_selectedCertIndex].label),
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _certs[_selectedCertIndex].description,
                                style: const TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                              ),
                              const SizedBox(height: 16),
                              for (final bullet in _certs[_selectedCertIndex].bullets)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.check, size: 16, color: _teal),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(bullet, style: const TextStyle(fontSize: 13, color: Colors.black87)),
                                      ),
                                    ],
                                  ),
                                ),
                              const SizedBox(height: 8),
                              const Divider(color: Color(0xFFE0E0E0)),
                              const SizedBox(height: 12),
                              Text(
                                "${_certs[_selectedCertIndex].normVersion} · "
                                "Certificaatnummer ${_certs[_selectedCertIndex].certNumber} · "
                                "Uitgegeven door ${_certs[_selectedCertIndex].issuer}",
                                style: const TextStyle(fontSize: 12, color: _subtext, height: 1.4),
                              ),
                            ],
                            ),
                          );

                          if (mobile) {
                            return Column(
                              children: [
                                Center(child: wheel),
                                const SizedBox(height: 24),
                                details,
                              ],
                            );
                          }

                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              wheel,
                              const SizedBox(width: 48),
                              Expanded(child: details),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              child: Builder(
                builder: (context) => ContentContainer(
                  child: Container(
                padding: isMobile(context)
                    ? const EdgeInsets.symmetric(horizontal: 16, vertical: 32)
                    : const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(226, 238, 245, 1),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    Text(
                      "Van praktijk tot back-up: op elk\nmoment versleuteld",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: AppFont.h2(context), fontWeight: FontWeight.bold, color: _darkTeal, height: 1.3),
                    ),
                    const SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 620),
                      child: const Text(
                        "Uw patiëntgegevens leggen elke dag dezelfde weg af. Op elk punt onderweg is "
                        "vastgelegd wie erbij kan en hoe de data beschermd is.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Builder(
                      builder: (context) {
                        const card1 = _ProcessCard(
                          icon: Icons.storefront_outlined,
                          title: "In de praktijk",
                          description: "Uw team werkt in Odontium. Alleen bevoegde medewerkers zien een dossier.",
                          tag: "Toegang per rol",
                        );
                        const card2 = _ProcessCard(
                          icon: Icons.dns_outlined,
                          title: "In het datacentrum",
                          description: "Opslag in een gecertificeerd datacentrum in Nederland.",
                          tag: "AES-256",
                        );
                        const card3 = _ProcessCard(
                          icon: Icons.history_outlined,
                          title: "In de back-up",
                          description: "Dagelijkse back-ups op een gescheiden locatie, maandelijks getest.",
                          tag: "[30] dagen terug",
                        );

                        if (isMobile(context)) {
                          return ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 340),
                            child: const Column(
                              children: [
                                card1,
                                _ProcessConnector(label: "TLS 1.3", vertical: true),
                                card2,
                                _ProcessConnector(label: "versleuteld", vertical: true),
                                card3,
                              ],
                            ),
                          );
                        }

                        // Flexible so the three cards shrink together on
                        // narrower desktop/tablet widths instead of
                        // overflowing past the fixed connectors. No
                        // IntrinsicHeight here: combined with Flexible it
                        // under-measures the cards and clips their text.
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 260),
                                child: card1,
                              ),
                            ),
                            const _ProcessConnector(label: "TLS 1.3"),
                            Flexible(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 260),
                                child: card2,
                              ),
                            ),
                            const _ProcessConnector(label: "versleuteld"),
                            Flexible(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 260),
                                child: card3,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              ),
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              child: Center(
                child: ContentContainer(
                  child: Column(
                    children: [
                      Text(
                        "Alleen wie het nodig heeft",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: AppFont.h2(context), fontWeight: FontWeight.bold, color: _darkTeal),
                      ),
                      const SizedBox(height: 16),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 650),
                        child: const Text(
                          "Niet iedereen in de praktijk hoeft alles te zien. In Odontium stelt u per rol in "
                          "welke informatie beschikbaar is: een baliemedewerker ziet de agenda, geen "
                          "financiele informatie.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Builder(
                        builder: (context) {
                          final bulletsColumn = Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (final bullet in _accessBullets)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.check, size: 16, color: _teal),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(bullet, style: const TextStyle(fontSize: 14, color: Colors.black87)),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          );

                          final noteBox = Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(226, 238, 245, 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "En onze eigen medewerkers?",
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: _darkTeal),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Onze supportmedewerkers hebben geen standaard inzage in uw dossiers. Is "
                                  "toegang nodig om u te helpen, dan vragen wij daar expliciet toestemming "
                                  "voor en wordt die toegang gelogd.",
                                  style: TextStyle(fontSize: 13, color: _subtext, height: 1.5),
                                ),
                              ],
                            ),
                          );

                          if (isMobile(context)) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                bulletsColumn,
                                const SizedBox(height: 24),
                                noteBox,
                              ],
                            );
                          }

                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: bulletsColumn),
                              const SizedBox(width: 32),
                              Expanded(child: noteBox),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      const Divider(color: Color(0xFFE0E0E0)),
                      const SizedBox(height: 40),
                      Text(
                        "Samen verantwoordelijk voor uw\npatiëntgegevens",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: AppFont.h2(context), fontWeight: FontWeight.bold, color: _darkTeal, height: 1.3),
                      ),
                      const SizedBox(height: 16),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 650),
                        child: const Text(
                          "Onder de AVG blijft uw praktijk verwerkingsverantwoordelijke voor de "
                          "patiëntgegevens. Odontium verwerkt die gegevens namens u. Wij maken precies "
                          "duidelijk wie wat doet.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Builder(
                        builder: (context) {
                          final weCard = ResponsibilityCard(
                            icon: Icons.apartment_outlined,
                            title: "Wat wij regelen",
                            bullets: _weArrangeBullets,
                          );
                          final youCard = ResponsibilityCard(
                            icon: Icons.person_outline,
                            title: "Wat u regelt",
                            bullets: _youArrangeBullets,
                          );

                          if (isMobile(context)) {
                            return Column(
                              children: [
                                weCard,
                                const SizedBox(height: 24),
                                youCard,
                              ],
                            );
                          }

                          return IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(child: weCard),
                                const SizedBox(width: 24),
                                Expanded(child: youCard),
                              ],
                            ),
                          );
                        },
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
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: FAQSection(
                    title: "Vragen over veiligheid",
                    titleFontSize: 30,
                    useChevronIcon: true,
                    showTopDivider: true,
                    items: _securityFaqItems,
                    trailing: HoverArrowButton(
                      label: "Alle veelgestelde vragen",
                      onPressed: () => context.go('/veelgestelde-vragen'),
                    ),
                  ),
                ),
              ),
            ),
            const DemoCtaBanner(
              heading: "Klaar voor een veilige\ntoekomst van uw praktijk?",
              description:
                  "Ontdek hoe Odontium uw praktijk ondersteunt met veilige software, persoonlijke "
                  "begeleiding en een zorgeloze overstap.",
            ),
            WebsiteFooter()
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
        Wiggle(
          interval: const Duration(seconds: 6),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Icon(item.icon, size: 18, color: _teal),
          ),
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

class _CertData {
  /// Short name for the wheel label, e.g. "NEN 7510".
  final String label;

  /// Name including the edition of the standard, e.g. "NEN 7510:2024".
  final String normVersion;
  final String certNumber;
  final String issuer;

  /// Expiry date, formatted for a Dutch reader (dd-mm-yyyy).
  final String validUntil;
  final String description;
  final List<String> bullets;

  const _CertData({
    required this.label,
    required this.normVersion,
    required this.certNumber,
    required this.issuer,
    required this.validUntil,
    required this.description,
    required this.bullets,
  });
}

/// Wheel selector for the certificates: one big circle whose outer ring is
/// divided into three independently clickable thirds. The selected third
/// paints its arc with an ease-in-out sweep (plus travelling glow dot);
/// the other thirds stay a quiet track that brightens on hover. Label pills
/// ride the ring at each third's midpoint.
class _CertWheel extends StatefulWidget {
  final double size;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final List<String> labels;
  final Widget centerChild;

  const _CertWheel({
    required this.size,
    required this.selectedIndex,
    required this.onSelect,
    required this.labels,
    required this.centerChild,
  });

  @override
  State<_CertWheel> createState() => _CertWheelState();
}

class _CertWheelState extends State<_CertWheel>
    with SingleTickerProviderStateMixin {
  /// Distance from the wheel edge to the center content: ring band + gap.
  static const double _bandInset = 32;

  /// Angular gap between the three thirds.
  static const double _gapAngle = 0.105;
  static const double _segmentSweep = 2 * math.pi / 3 - _gapAngle;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..forward();
  int? _hovered;

  // The highlight is modelled as an arc of fixed sweep whose CENTER angle
  // animates. On first build it "draws in" over the selected third
  // (_drawingIn); afterwards a selection change makes the whole arc glide
  // around the ring from the old third to the new one, shortest way round.
  bool _drawingIn = true;
  late double _fromCenter = _centerOf(widget.selectedIndex);
  late double _toCenter = _fromCenter;

  static double _centerOf(int i) => -math.pi / 2 + i * 2 * math.pi / 3;

  double get _eased => Curves.easeInOutCubic.transform(_controller.value);

  /// Where the arc's center currently sits, mid-animation or not.
  double get _currentCenter =>
      _drawingIn ? _toCenter : _fromCenter + (_toCenter - _fromCenter) * _eased;

  @override
  void didUpdateWidget(covariant _CertWheel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      // Start the glide from wherever the arc is right now (also mid-flight),
      // and pick the target's nearest angular equivalent so the arc always
      // takes the shortest way around.
      var from = _currentCenter % (2 * math.pi);
      if (from > math.pi) from -= 2 * math.pi;
      if (from < -math.pi) from += 2 * math.pi;
      var to = _centerOf(widget.selectedIndex);
      while (to - from > math.pi) {
        to -= 2 * math.pi;
      }
      while (to - from < -math.pi) {
        to += 2 * math.pi;
      }
      setState(() {
        _fromCenter = from;
        _toCenter = to;
        _drawingIn = false;
      });
      _controller.duration = const Duration(milliseconds: 650);
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Which third of the wheel a point falls in, or null when it isn't on the
  /// ring band (the center content stays inert). Third 0 is centered on top,
  /// 1 bottom-right, 2 bottom-left.
  int? _segmentAt(Offset position) {
    final center = Offset(widget.size / 2, widget.size / 2);
    final v = position - center;
    final r = v.distance;
    final outer = widget.size / 2;
    if (r < outer - _bandInset - 6 || r > outer + 10) return null;
    var rel = math.atan2(v.dy, v.dx) + math.pi / 2 + math.pi / 3;
    rel = rel % (2 * math.pi);
    if (rel < 0) rel += 2 * math.pi;
    return rel ~/ (2 * math.pi / 3);
  }

  @override
  Widget build(BuildContext context) {
    // Fractional position of the ring radius, used to park the label pills
    // on the ring via Align.
    final ringFraction = (widget.size / 2 - 9) / (widget.size / 2);

    return MouseRegion(
      cursor: _hovered != null ? SystemMouseCursors.click : MouseCursor.defer,
      onHover: (event) {
        final segment = _segmentAt(event.localPosition);
        if (segment != _hovered) setState(() => _hovered = segment);
      },
      onExit: (_) {
        if (_hovered != null) setState(() => _hovered = null);
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapUp: (details) {
          final segment = _segmentAt(details.localPosition);
          if (segment != null) widget.onSelect(segment);
        },
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            children: [
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    final animating = _controller.value < 1;
                    double arcStart;
                    double arcSweep;
                    double? dotAngle;

                    if (_drawingIn) {
                      // First appearance: the arc draws itself in across the
                      // selected third.
                      arcStart = _toCenter - _segmentSweep / 2;
                      arcSweep = _segmentSweep * _eased;
                      dotAngle = animating ? arcStart + arcSweep : null;
                    } else {
                      // Selection change: fixed-length arc glides around the
                      // ring; the glow dot rides its leading edge.
                      final center = _currentCenter;
                      arcStart = center - _segmentSweep / 2;
                      arcSweep = _segmentSweep;
                      if (animating && _toCenter != _fromCenter) {
                        dotAngle = _toCenter > _fromCenter
                            ? center + _segmentSweep / 2
                            : center - _segmentSweep / 2;
                      }
                    }

                    return CustomPaint(
                      painter: _CertWheelPainter(
                        selected: widget.selectedIndex,
                        hovered: _hovered,
                        arcStart: arcStart,
                        arcSweep: arcSweep,
                        dotAngle: dotAngle,
                      ),
                    );
                  },
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(_bandInset),
                  child: widget.centerChild,
                ),
              ),
              // Label pills at each third's midpoint; IgnorePointer lets
              // their taps fall through to the segment hit-test below.
              for (var i = 0; i < widget.labels.length; i++)
                Positioned.fill(
                  child: Align(
                    alignment: Alignment(
                      math.cos(-math.pi / 2 + i * 2 * math.pi / 3) * ringFraction,
                      math.sin(-math.pi / 2 + i * 2 * math.pi / 3) * ringFraction,
                    ),
                    child: IgnorePointer(
                      child: AnimatedScale(
                        scale: (_hovered == i || widget.selectedIndex == i) ? 1.08 : 1.0,
                        duration: const Duration(milliseconds: 180),
                        curve: Curves.easeOutCubic,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: widget.selectedIndex == i ? _darkTeal : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: (widget.selectedIndex == i || _hovered == i)
                                  ? _teal
                                  : const Color(0xFFB8D9CE),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.10),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            widget.labels[i],
                            style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w700,
                              color: widget.selectedIndex == i ? Colors.white : _darkTeal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CertWheelPainter extends CustomPainter {
  final int selected;
  final int? hovered;

  /// The highlight arc, in absolute angles (computed by the wheel state so
  /// it can glide freely between thirds).
  final double arcStart;
  final double arcSweep;

  /// Leading-edge glow dot while the arc is moving; null when at rest.
  final double? dotAngle;

  _CertWheelPainter({
    required this.selected,
    required this.hovered,
    required this.arcStart,
    required this.arcSweep,
    required this.dotAngle,
  });

  static const _track = Color(0xFFD8EAE4);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 9;
    final rect = Rect.fromCircle(center: center, radius: radius);
    const segmentSweep = 2 * math.pi / 3;
    const gap = _CertWheelState._gapAngle;

    // The three static thirds underneath (hover brightens a non-selected one).
    for (var i = 0; i < 3; i++) {
      final start = -math.pi / 2 - math.pi / 3 + i * segmentSweep + gap / 2;
      final isHovered = hovered == i && i != selected;
      canvas.drawArc(
        rect,
        start,
        segmentSweep - gap,
        false,
        Paint()
          ..color = isHovered ? _teal.withValues(alpha: 0.55) : _track
          ..style = PaintingStyle.stroke
          ..strokeWidth = isHovered ? 5.5 : 4
          ..strokeCap = StrokeCap.round,
      );
    }

    // The gliding highlight arc.
    if (arcSweep > 0) {
      canvas.drawArc(
        rect,
        arcStart,
        arcSweep,
        false,
        Paint()
          ..color = _teal
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6
          ..strokeCap = StrokeCap.round,
      );
    }

    if (dotAngle != null) {
      final head = center + Offset(math.cos(dotAngle!), math.sin(dotAngle!)) * radius;
      canvas.drawCircle(head, 9, Paint()..color = _teal.withValues(alpha: 0.25));
      canvas.drawCircle(head, 5, Paint()..color = _teal);
    }
  }

  @override
  bool shouldRepaint(covariant _CertWheelPainter oldDelegate) =>
      oldDelegate.selected != selected ||
      oldDelegate.hovered != hovered ||
      oldDelegate.arcStart != arcStart ||
      oldDelegate.arcSweep != arcSweep ||
      oldDelegate.dotAngle != dotAngle;
}

class _SecurityIllustration extends StatelessWidget {
  const _SecurityIllustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 240,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 10,
            top: 0,
            child: Floating(
              amplitude: 7,
              phase: 0.0,
              child: Transform.rotate(
                angle: 0.5,
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: _teal.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 46,
            top: 30,
            child: Floating(
              amplitude: 5,
              phase: 0.4,
              child: Transform.rotate(
                angle: 0.25,
                child: Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB9E0EA).withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ),
          const Icon(Icons.gpp_good_outlined, size: 150, color: _darkTeal),
          Positioned(
            left: 20,
            bottom: 30,
            child: Floating(
              amplitude: 4,
              phase: 0.7,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 8)],
                ),
                child: const Icon(Icons.cloud_outlined, size: 22, color: _teal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProcessCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String tag;

  const _ProcessCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return HoverLift(
      child: Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, size: 26, color: _darkTeal),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: _darkTeal),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: _subtext, height: 1.4),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: _mint, borderRadius: BorderRadius.circular(8)),
            child: Text(
              tag,
              style: const TextStyle(fontSize: 11, color: _darkTeal, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class _ProcessConnector extends StatelessWidget {
  final String label;
  final bool vertical;

  const _ProcessConnector({required this.label, this.vertical = false});

  @override
  Widget build(BuildContext context) {
    final labelText = Text(
      label,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: _subtext),
    );

    if (vertical) {
      return SizedBox(
        height: 64,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container(width: 1, color: const Color(0xFFBBBBBB))),
            Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: labelText),
            Expanded(child: Container(width: 1, color: const Color(0xFFBBBBBB))),
          ],
        ),
      );
    }

    return SizedBox(
      width: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container(height: 1, color: const Color(0xFFBBBBBB))),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: labelText),
          Expanded(child: Container(height: 1, color: const Color(0xFFBBBBBB))),
        ],
      ),
    );
  }
}
