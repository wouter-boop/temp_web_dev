import '../widgets/general/auto_scroll_view.dart';
import 'package:flutter/material.dart';
import '../widgets/general/type_scale.dart';
import '../widgets/general/content_container.dart';
import 'package:go_router/go_router.dart';
import 'package:Odontium/widgets/general/footer.dart';
import 'package:Odontium/widgets/general/hover_arrow_button.dart';
import 'package:Odontium/widgets/product_page/role_card.dart';
import 'package:Odontium/widgets/product_page/sidekick_hero.dart';

import '../widgets/checkmark_list.dart';
import '../widgets/general/block_container.dart';
import '../widgets/general/demo_cta_banner.dart';
import '../widgets/general/responsive.dart';
import '../widgets/general/reveal_on_scroll.dart';
import '../widgets/home_page/arrow_button.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // Each role gets its own accent from the mint-to-blue family used on the
  // Overstappen timeline, so the four cards read as a set.
  static const List<RoleCardData> _roleCards = [
    RoleCardData(
      icon: Icons.show_chart,
      title: 'Praktijkeigenaar',
      description: 'Inzicht in omzet, bezetting en no-shows zonder handmatige rapportages.',
      accentColor: Color(0xFF2E9BE0),
    ),
    RoleCardData(
      icon: Icons.medical_services_outlined,
      title: 'Behandelaar',
      description: 'Volledig dossier in beeld tijdens de behandeling. Direct vastleggen, niet later uitwerken.',
      accentColor: Color(0xFF17A8A6),
    ),
    RoleCardData(
      icon: Icons.headset_mic_outlined,
      title: 'Balie',
      description: 'Plannen, verzetten en herinneren vanuit één scherm. Minder telefoon, minder gedoe.',
      accentColor: Color(0xFF3FC1B0),
    ),
    RoleCardData(
      icon: Icons.people_outline,
      title: 'Assistent',
      description: 'Voorbereiding, materialen en vervolgafspraken staan klaar voor elke behandeling.',
      accentColor: Color(0xFF7FD8C4),
    ),
  ];

  static const List<({String label, String route})> _discoverLinks = [
    (label: 'Slimme functies', route: '/Odontium/slimme-functies'),
    (label: 'Integraties', route: '/Odontium/integraties'),
    (label: 'Beveiliging', route: '/Odontium/beveiliging'),
    (label: 'Mobiele apps', route: '/Odontium/mobiele_apps'),
  ];

  /// "Ontdek meer" links as a compact, centered 2x2 grid. Both columns share
  /// the row width so the buttons stay equal size, and the whole grid is
  /// capped so it doesn't stretch with the section on wide screens. Below
  /// ~460px of room it collapses to one stacked column.
  Widget _buildDiscoverLinks(BuildContext context) {
    Widget button(int i) => HoverArrowButton(
          compact: true,
          label: _discoverLinks[i].label,
          onPressed: () => context.go(_discoverLinks[i].route),
        );

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 520),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 460) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var i = 0; i < _discoverLinks.length; i++) ...[
                  if (i != 0) const SizedBox(height: 12),
                  button(i),
                ],
              ],
            );
          }

          return Column(
            children: [
              for (var row = 0; row < 2; row++) ...[
                if (row != 0) const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: button(row * 2)),
                    const SizedBox(width: 16),
                    Expanded(child: button(row * 2 + 1)),
                  ],
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  /// Always 2-2 on anything wide enough for two columns (never 3-1), and a
  /// single stacked column on narrow screens.
  Widget _buildRoleCardGrid() {
    return ContentContainer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 760) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var i = 0; i < _roleCards.length; i++) ...[
                  if (i != 0) const SizedBox(height: 20),
                  RevealOnScroll(
                    delay: Duration(milliseconds: i * 110),
                    child: RoleCard(data: _roleCards[i]),
                  ),
                ],
              ],
            );
          }

          return Column(
            children: [
              for (var row = 0; row < 2; row++)
                Padding(
                  padding: EdgeInsets.only(bottom: row == 0 ? 24 : 0, left: 36, right: 36),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (var col = 0; col < 2; col++) ...[
                          if (col != 0) const SizedBox(width: 24),
                          Expanded(
                            child: RevealOnScroll(
                              delay: Duration(milliseconds: (row * 2 + col) * 110),
                              offset: Offset(col == 0 ? -32 : 32, 0),
                              child: RoleCard(data: _roleCards[row * 2 + col]),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Scaffold(
      body: AutoScrollView(
        child: Column(
          children: [
            BlockContainer(
              screenWidthFactor: 1,
              child: SidekickHero(),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              softTopEdge: const Color(0xFFF8F9FB),
              gradient: LinearGradient(
                colors: [Color.fromRGBO(77, 132, 152, 1), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Voor iedereen in uw praktijk",
                    style: TextStyle(fontSize: AppFont.h2(context), fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Text(
                      "Iedere medewerker werkt anders. Daarom biedt Odontium een werkomgeving die aansluit op de dagelijkse werkzaamheden van iedere gebruiker, terwijl iedereen samenwerkt in het zelfde systeem.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildRoleCardGrid(),
                ],
              ),
            ),
            BlockContainer(
              backgroundColor: Colors.white,
              screenWidthFactor: 1,
              hasHorizontalPadding: false,
              padding: EdgeInsetsGeometry.only(bottom: 0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 0),
                    child: Column(
                      children: [
                        Text(
                          "Waarom Odontium?",
                          style: TextStyle(fontSize: AppFont.h2(context), fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        ContentContainer(
                          child: FeatureChecklist(
                            spacing: 30,
                            items: const [
                              'Meer tijd voor uw patiënten',
                              'Persoonlijke ondersteuning',
                              'Efficiënt en gebruiksvriendelijk',
                              'Alles op één centrale plek',
                              'Veilig en betrouwbaar',
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 64),
                  BlockContainer(
                    backgroundColor: Colors.white,
                    screenWidthFactor: contentWidthFactor(context),
                    child: SmallInfoBlock(
                      isLeft: false,
                      imagePath: "lib/assets/agenda.png",
                      titel: "Agenda & Planning",
                      subtitel:
                          "Beheer de planning van uw praktijk vanuit één overzichtelijke agenda en houd grip op alle afspraken",
                      punt1: "Gemakkelijk inplannen van afspraken",
                      punt2: "Al uw agenda's overzichtelijk gecombineerd",
                      punt3: "Instelbare automatische afspraakherinneringen",
                    ),
                  ),
                  BlockContainer(
                    backgroundColor: Color.fromRGBO(226, 238, 245, 1),
                    screenWidthFactor: contentWidthFactor(context),
                    child: SmallInfoBlock(
                      imagePath: "lib/assets/pat_krt.png",
                      titel: "Patiëntenoverzicht",
                      subtitel:
                          "Alle patiëntinformatie overzichtelijk beschikbaar, zodat u altijd met de juiste gegevens werkt.",
                      punt1: "Complete patiënt- en behandelgeschiedenis",
                      punt2: "Gebitsregistratie en medische gegevens",
                      punt3: "Foto's en documenten direct gekoppeld",
                    ),
                  ),
                  BlockContainer(
                    backgroundColor: Colors.white,
                    screenWidthFactor: contentWidthFactor(context),
                    child: SmallInfoBlock(
                      isLeft: false,
                      imagePath: "lib/assets/dec.png",
                      titel: "Declaraties & Facturatie",
                      subtitel:
                          "Verwerk declaraties efficiënt en houd uw administratie overzichtelijk vanuit één systeem.",
                      punt1: "Declaraties en facturen beheren",
                      punt2: "CCBR-Controle uitvoeren",
                      punt3: "Inzicht in openstaande posten",
                    ),
                  ),
                  BlockContainer(
                    backgroundColor: Color.fromRGBO(226, 238, 245, 1),
                    screenWidthFactor: contentWidthFactor(context),
                    child: SmallInfoBlock(
                      imagePath: "lib/assets/doc.png",
                      titel: "Documentbeheer",
                      subtitel:
                          "Beheer documenten centraal en werk zonder losse bestanden of verschillende programma's.",
                      punt1: "Word- Excel- PDF en Foto ondersteuning",
                      punt2: "Digitale handtekeningen (eIDAS)",
                      punt3: "Documenten koppelen aan patiëntdossiers",
                    ),
                  ),
                  BlockContainer(
                    backgroundColor: Colors.white,
                    screenWidthFactor: contentWidthFactor(context),
                    child: SmallInfoBlock(
                      isLeft: false,
                      imagePath: "lib/assets/comm.png",
                      titel: "Communicatie",
                      subtitel:
                          "Communiceer eenvoudig met patiënten en automatiseer terugkerende contactmomenten",
                      punt1: "Automatische afspraakherinneringen",
                      punt2: "Telefoonpop-up bij inkomende gesprekken",
                      punt3: "Koppelingen met ZorgMail en Zivver",
                    ),
                  ),
                ],
              ),
            ),
            BlockContainer(
              screenWidthFactor: contentWidthFactor(context),
              gradient: LinearGradient(
                colors: [Color.fromRGBO(226, 238, 245, 1), Colors.white],
                stops: [0, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Ontdek meer van Odontium",
                      style: TextStyle(
                        fontSize: AppFont.h2(context),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Ga dieper in op wat Odontium voor uw praktijk kan betekenen.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40,),
                    Center(
                      child: RevealOnScroll(child: _buildDiscoverLinks(context)),
                    ),
                  ],
                ),
              ),
            ),
            DemoCtaBanner(
              heading: "Klaar om Odontium \nzelf te ervaren?",
              description:
                  "Ontdek tijdens een vrijblijvende persoonlijke demo hoe Odontium uw praktijk "
                  "helpt efficiënter te werken.",
              secondaryAction: ArrowButton(
                text: "Bekijk de functionaliteiten",
                function: () => context.go('/Odontium/slimme-functies'),
                white: true,
              ),
            ),
            WebsiteFooter()
          ],
        ),
      ),
    );
  }
}

class SmallInfoBlock extends StatelessWidget {
  final String imagePath;
  final String titel;
  final String subtitel;
  final String punt1;
  final String punt2;
  final String punt3;
  final bool isLeft;

  const SmallInfoBlock({
    super.key,
    required this.imagePath,
    required this.titel,
    required this.subtitel,
    required this.punt1,
    required this.punt2,
    required this.punt3,
    this.isLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    // A friendly placeholder keeps the layout intact while the real
    // screenshots aren't in the repo yet (imagePath is currently "").
    final image = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child: imagePath.isEmpty
            ? Container(
                color: const Color(0xFFE3ECF1),
                alignment: Alignment.center,
                child: const Icon(Icons.dashboard_customize_outlined, size: 48, color: Color(0xFFA7BCC7)),
              )
            : Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFFE3ECF1),
                  alignment: Alignment.center,
                  child: const Icon(Icons.dashboard_customize_outlined, size: 48, color: Color(0xFFA7BCC7)),
                ),
              ),
      ),
    );

    final textBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          titel,
          style: TextStyle(fontSize: AppFont.h3(context), fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(subtitel),
        SizedBox(height: 8),
        Text('• ' + punt1),
        SizedBox(height: 16),
        Text("• " + punt2),
        SizedBox(height: 16),
        Text("• " + punt3),
      ],
    );

    // Reflow on the actual available width (the parent BlockContainer halves
    // the screen width on desktop), not on the device class — a Row of
    // image + 340px text overflowed in the 700-1700px range before.
    return RevealOnScroll(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 720) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                image,
                const SizedBox(height: 24),
                textBlock,
              ],
            );
          }

          final imageHalf = Expanded(flex: 5, child: image);
          final textHalf = Expanded(flex: 4, child: textBlock);
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isLeft ? imageHalf : textHalf,
              const SizedBox(width: 64),
              isLeft ? textHalf : imageHalf,
            ],
          );
        },
      ),
    );
  }
}
