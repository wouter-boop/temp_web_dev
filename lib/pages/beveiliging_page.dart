import 'package:flutter/material.dart';
import 'package:odontium_website/widgets/general/footer.dart';

import '../widgets/general/block_container.dart';
import '../widgets/general/demo_cta_banner.dart';
import '../widgets/general/hover_arrow_button.dart';
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
    _BandItem(Icons.workspace_premium_outlined, "Beveiligingdscertificaties"),
    _BandItem(Icons.backup_outlined, "Automatisch back-ups"),
    _BandItem(Icons.lock_outline, "Veilige toegang"),
    _BandItem(Icons.headset_mic_outlined, "Eigen supportteam"),
  ];

  static const List<_CertData> _certs = [
    _CertData(
      label: "NEN 7510",
      sinceYear: "2024",
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
      sinceYear: "[jaar]",
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
      sinceYear: "[jaar]",
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
          "agenda maar geen behandelnotities. Onze eigen supportmedewerkers hebben geen standaard inzage — "
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 56),
            BlockContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Veiligheid waarop u\nkunt vertrouwen",
                          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: _darkTeal, height: 1.2),
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
                      ],
                    ),
                  ),
                  const SizedBox(width: 32),
                  const _SecurityIllustration(),
                ],
              ),
            ),
            BlockContainer(
              backgroundColor: _teal,
              screenWidthFactor: 1,
              hasHorizontalPadding: false,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [for (final item in _bandItems) _BandItemView(item: item)],
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    children: [
                      const Text(
                        "Wat deze certificering\nécht betekent",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _darkTeal, height: 1.3),
                      ),
                      const SizedBox(height: 16),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 620),
                        child: const Text(
                          "Certificaten zijn geen logo's op een website. Ze betekenen dat een onafhankelijke "
                          "partij onze processen heeft gecontroleerd.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var i = 0; i < _certs.length; i++) ...[
                            if (i != 0) const SizedBox(width: 12),
                            _CertPill(
                              label: _certs[i].label,
                              selected: _selectedCertIndex == i,
                              onTap: () => setState(() => _selectedCertIndex = i),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 350),
                            transitionBuilder: (child, animation) => ScaleTransition(
                              scale: animation,
                              child: FadeTransition(opacity: animation, child: child),
                            ),
                            child: Container(
                              key: ValueKey(_certs[_selectedCertIndex].label),
                              width: 220,
                              height: 220,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _mint,
                                border: Border.all(color: const Color(0xFFB8D9CE), width: 1.5),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.verified_user_outlined, size: 32, color: _darkTeal),
                                    const SizedBox(height: 10),
                                    Text(
                                      _certs[_selectedCertIndex].label,
                                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: _darkTeal),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Gecertificeerd sinds ${_certs[_selectedCertIndex].sinceYear}",
                                      style: const TextStyle(fontSize: 12, color: _subtext),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 40),
                          Expanded(
                            child: Column(
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
                                const Text(
                                  "Certificaatnummer [nummer] · Uitgegeven door [certificerende instelling] · "
                                  "Geldig tot [datum]",
                                  style: TextStyle(fontSize: 12, color: _subtext, height: 1.4),
                                ),
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
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(226, 238, 245, 1),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Van praktijk tot back-up: op elk\nmoment versleuteld",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: _darkTeal, height: 1.3),
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
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 260),
                            child: const _ProcessCard(
                              icon: Icons.storefront_outlined,
                              title: "In de praktijk",
                              description: "Uw team werkt in Odontium. Alleen bevoegde medewerkers zien een dossier.",
                              tag: "Toegang per rol",
                            ),
                          ),
                          const _ProcessConnector(label: "TLS 1.3"),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 260),
                            child: const _ProcessCard(
                              icon: Icons.dns_outlined,
                              title: "In het datacentrum",
                              description: "Opslag in een gecertificeerd datacentrum in Nederland.",
                              tag: "AES-256",
                            ),
                          ),
                          const _ProcessConnector(label: "versleuteld"),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 260),
                            child: const _ProcessCard(
                              icon: Icons.history_outlined,
                              title: "In de back-up",
                              description: "Dagelijkse back-ups op een gescheiden locatie, maandelijks getest.",
                              tag: "[30] dagen terug",
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
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    children: [
                      const Text(
                        "Alleen wie het nodig heeft",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _darkTeal),
                      ),
                      const SizedBox(height: 16),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 650),
                        child: const Text(
                          "Niet iedereen in de praktijk hoeft alles te zien. In Odontium stelt u per rol in "
                          "welke informatie beschikbaar is: een baliemedewerker ziet de agenda, geen "
                          "behandelnotities.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
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
                            ),
                          ),
                          const SizedBox(width: 32),
                          Expanded(
                            child: Container(
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
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Divider(color: Color(0xFFE0E0E0)),
                      const SizedBox(height: 40),
                      const Text(
                        "Samen verantwoordelijk voor uw\npatiëntgegevens",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: _darkTeal, height: 1.3),
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
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: _ResponsibilityCard(
                                icon: Icons.apartment_outlined,
                                title: "Wat wij regelen",
                                bullets: _weArrangeBullets,
                                highlighted: false,
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _ResponsibilityCard(
                                icon: Icons.person_outline,
                                title: "Wat u regelt",
                                bullets: _youArrangeBullets,
                                highlighted: true,
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
                    trailing: HoverArrowButton(label: "Alle veelgestelde vragen", onPressed: () {}),
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
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Icon(item.icon, size: 18, color: _teal),
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
  final String label;
  final String sinceYear;
  final String description;
  final List<String> bullets;

  const _CertData({
    required this.label,
    required this.sinceYear,
    required this.description,
    required this.bullets,
  });
}

class _CertPill extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _CertPill({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? _darkTeal : _mint,
          borderRadius: BorderRadius.circular(20),
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
          Positioned(
            right: 46,
            top: 30,
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
          const Icon(Icons.gpp_good_outlined, size: 150, color: _darkTeal),
          Positioned(
            left: 20,
            bottom: 30,
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
    return Container(
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
    );
  }
}

class _ProcessConnector extends StatelessWidget {
  final String label;

  const _ProcessConnector({required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container(height: 1, color: const Color(0xFFBBBBBB))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: _subtext),
            ),
          ),
          Expanded(child: Container(height: 1, color: const Color(0xFFBBBBBB))),
        ],
      ),
    );
  }
}

class _ResponsibilityCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final List<String> bullets;
  final bool highlighted;

  const _ResponsibilityCard({
    required this.icon,
    required this.title,
    required this.bullets,
    required this.highlighted,
  });

  @override
  State<_ResponsibilityCard> createState() => _ResponsibilityCardState();
}

class _ResponsibilityCardState extends State<_ResponsibilityCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.highlighted ? const Color(0xFF2E9BE0) : _darkTeal.withValues(alpha: 0.35);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: borderColor, width: widget.highlighted ? 1.5 : 1),
          boxShadow: _hovering
              ? [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 16, offset: const Offset(0, 6))]
              : const [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(color: _darkTeal, borderRadius: BorderRadius.circular(10)),
                  child: Icon(widget.icon, size: 18, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _darkTeal),
                ),
              ],
            ),
            const SizedBox(height: 16),
            for (final bullet in widget.bullets)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check, size: 15, color: _teal),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(bullet, style: const TextStyle(fontSize: 13, color: Colors.black87)),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
