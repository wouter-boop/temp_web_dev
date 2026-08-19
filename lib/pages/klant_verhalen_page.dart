import '../widgets/general/auto_scroll_view.dart';
import 'package:flutter/material.dart';
import '../widgets/general/type_scale.dart';
import '../widgets/general/content_container.dart';

import '../widgets/general/block_container.dart';
import '../widgets/general/demo_cta_banner.dart';
import '../widgets/general/footer.dart';
import '../widgets/general/hover_arrow_button.dart';
import '../widgets/general/micro_animations.dart';
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

  static final List<_StoryData> _stories = [
    _StoryData(
      photoPath: 'lib/assets/testimonial_gerben.png',
      name: 'Germen Versteeg',
      role: 'Oprichter, Denticien',
      quote:
      'Na 2 jaar ervaring met TSE zijn wij zeer tevreden over het pakket en de mogelijkheden. De snelheid van de support maar ook meedenken in nieuwe mogelijkheden en wensen zijn essentiële punten.',
      bodyParagraphs: [
        'Bij de start van Denticien stonden wij voor de keuze welke software wij zouden gaan gebruiken in onze nieuwe winkels. Voor ons waren een paar punten zeer essentieel: korte lijnen met support en development, snel kunnen schakelen met aanpassingen en wensen, mee kunnen opschalen met een grotere organisatie, en een goed werkende en betaalbare cloud oplossing.',
        'Na 2 jaar ervaring met TSE zijn wij zeer tevreden over het pakket en de mogelijkheden. De snelheid van de support maar ook meedenken in nieuwe mogelijkheden en wensen zijn essentiële punten. Het pakket is stabiel en de cloud oplossing is ideaal voor grotere praktijken met meerdere vestigingen.',
      ],
    ),
    _StoryData(
      photoPath: 'lib/assets/testimonial_toine.png',
      name: 'Toine',
      role: 'Tandprotheticus, Mondzorgcentrum Oisterwijk',
      quote:
      'Een administratiepakket wat je kan aanpassen tot maatwerk voor je eigen tandprothetische praktijk.',
      bodyParagraphs: [
        'Wij zijn een inmiddels volledig gedigitaliseerde tandprothetische praktijk, wat ook aanpassingen vergt aan de administratieve software. Hierbij denkt TSE ook mee en heeft het mogelijk gemaakt onze digitale bestanden te koppelen aan onze patiëntenadministratie, zo behoort zoeken tot het verleden. Een administratiepakket wat je kan aanpassen tot maatwerk voor je eigen tandprothetische praktijk.',
      ],
    ),
    _StoryData(
      photoPath: 'lib/assets/testimonial_annemartine.jpg',
      name: 'Anne-Martine van Kralingen',
      role: 'Tandprotheticus',
      quote:
      'Doordat je het programma kunt personaliseren is de leercurve van het gebruik sneller en makkelijker.',
      bodyParagraphs: [
        'Wij gebruiken TSE nu al een aantal jaren. De overstap naar een ander programma is altijd spannend en wennen. Maar door de steun en altijd directe hulp zijn wij maar al te blij dat we deze keuze hebben gemaakt. Doordat je het programma kunt personaliseren is de leercurve van het gebruik sneller en makkelijker. En als je er dan toch niet uitkomt is er altijd een helpende hand en een luisterend oor.',
      ],
    ),
    _StoryData(
      photoPath: 'lib/assets/testimonial_tppvanengelen.jpg',
      name: 'TPP van Engelen',
      role: 'Tandprotheticus',
      quote:
      'Letterlijk voor elk "probleem" is een oplossing in het programma, als je iets bedenkt en het navraagt zit het er vaak al in.',
      bodyParagraphs: [
        'Wij zijn afgelopen jaar overgestapt naar TSE en hebben daar geen spijt van! De medewerkers denken graag mee in oplossingen, leggen je uit hoe je het programma nog efficiënter kunt gebruiken én nemen feedback ter harte. Met die feedback en adviezen doen ze ook daadwerkelijk iets, je ziet deze terug in de updates. Je wordt als je belt te woord gestaan, geholpen en geen vraag is teveel.',
        'Overgaan naar een nieuw programma terwijl je gewend bent aan een ander programma is een flinke stap. Maar als je het de tijd geeft en een paar maanden verder bent wil je niet meer terug, daarbij zijn we uitstekend geholpen. Het programma is overzichtelijk en makkelijk in gebruik. Daarnaast kun je heel veel zelf inrichten en aanpassen zodat het echt een op maat programma is voor jouw praktijk.',
        'Letterlijk voor elk "probleem" is een oplossing in het programma, als je iets bedenkt en het navraagt zit het er vaak al in. Het programma is naast makkelijk in gebruik ontzettend uitgebreid en divers.',
        'Alle opties zijn heel uitgebreid, de patiëntenkaart kan volledig zelf ingedeeld worden, je kunt met kleuren werken die je zelf bepaalt, etc. Alle brieven, bestanden, foto\'s, etiketten, gegevens en dergelijke staan gelinkt op een hele handige manier.',
        'Daarnaast kan alles ook nog eens aangepast worden zoals jij dat wilt. Het programma kan veel meer dan je in eerste instantie denkt en we hebben al heel veel "Aha!"-momenten gehad, jammer dat we dit programma niet al eerder hebben aangeschaft.',
      ],
    ),
    _StoryData(
      photoPath: 'lib/assets/testimonial_anne.png',
      name: 'Anne Dormans',
      role: 'Tandprotheticus',
      quote:
      'Het bleek een goede keuze! Het programma is perfect te gebruiken in de praktijk, het is makkelijk in gebruik en duidelijk.',
      bodyParagraphs: [
        'Ik ben sinds begin 2020 een nieuwe gebruiker van het ONT-Pakket. Jaren in loondienst met andere programma\'s gewerkt, maar nu als zelfstandige gekozen voor TSE.',
        'Het bleek een goede keuze! Het programma is perfect te gebruiken in de praktijk, het is makkelijk in gebruik en duidelijk. Allerlei opties zijn mogelijk. In het begin is het uiteraard even kennismaken en wennen aan het nieuwe programma. Hierbij krijg ik perfecte ondersteuning van de helpdesk.',
        'Meerdere keren met verschillende vragen gebeld en altijd even goed, duidelijk en snel geholpen. Ze leggen alles goed uit, stap voor stap, en kom je er niet uit kijken ze mee op afstand en helpen je zo verder, top!',
      ],
    ),
    _StoryData(
      photoPath: 'lib/assets/testimonial_kars.png',
      name: 'Kars Varwijk',
      role: 'Tandprotheticus',
      quote:
      'TSE doet precies dat waarvoor het gemaakt is, zonder al teveel poespas en dure uitbreidingen die het programma onwerkbaar maken.',
      bodyParagraphs: [
        'Wij hebben in 2016 de overstap gemaakt naar TSE en zijn inmiddels een aantal jaren verder. TSE doet precies dat waarvoor het gemaakt is, zonder al teveel poespas en dure uitbreidingen die het programma onwerkbaar maken.',
        'De korte lijn die je als gebruiker met de programmeurs ervaart, ervaar ik als zeer prettig, in tegenstelling tot andere helpdesks wordt je hier direct geholpen door iemand die er echt verstand van heeft. Eén belletje heen en weer en je bent geholpen! Wij zijn zeer tevreden, overal wordt naar geluisterd en ze staan altijd klaar. Zelf aangedragen ideeën worden hierdoor ook vaak snel geïmplementeerd.',
      ],
    ),
    _StoryData(
      photoPath: 'lib/assets/testimonial_rico.png',
      name: 'Rico Koers',
      role: 'Tandprotheticus',
      quote:
      'Ik ben al een jarenlange gebruiker van het ONT-Pakket, zeer betrouwbare software.',
      bodyParagraphs: [
        'Ik ben al een jarenlange gebruiker van het ONT-Pakket, zeer betrouwbare software. De medewerkers staan altijd voor je klaar en staan open voor alle suggesties die ik als gebruiker aandraag.',
        'Binnen onze praktijk faciliteren wij vele aspecten van de mondzorg en hebben deze dan ook allen ondergebracht in het ONT-Pakket. Voor de medewerkers is het zeer gebruiksvriendelijk en voor mij als praktijkhouder genereert het veel analytische data. En zeker niet onbelangrijk: dat alles voor een redelijke prijs!',
      ],
    ),
    _StoryData(
      photoPath: 'lib/assets/testimonial_suzanne.png',
      name: 'Suzanne Toren',
      role: 'Praktijkmanager, Tandprothetische Praktijk Toren',
      quote:
      'Door de gedegen voorbereiding en uitvoering door het team van TSE, kan ik 3 maanden na dato met recht zeggen dat we enorm blij zijn dat we deze verandering hebben doorgezet.',
      bodyParagraphs: [
        'Als je na 30 jaar de overstap maakt naar een ander softwarepakket voor je patiëntenadministratie, dan spreek je wel serieus over een verandertraject. Met de hoeveelheid data die we in al die jaren hebben opgebouwd met duizenden patiëntendossiers, ga je daarbij niet over één nacht ijs en krijg je al lichtelijk buikpijn bij de gedachte aan een overstap.',
        'Maar door de gedegen voorbereiding en uitvoering door het team van TSE, kan ik 3 maanden na dato met recht zeggen dat we enorm blij zijn dat we deze verandering en gelijktijdig ontwikkeling hebben doorgezet.',
        'Is het allemaal vlekkeloos verlopen? Nee natuurlijk niet, we zijn ook dingen tegengekomen waarbij ons de wenkbrauwen gingen fronsen. Het zijn en blijven computers, maar gelukkig weten ze bij TSE altijd een oplossing en staan ze je met raad en daad terzijde. Soms 24 uur per dag en nacht en zelfs in de weekenden als het echt moet. Bij TSE begrijpen ze wanneer er brand is en nog veel belangrijker, wanneer er geblust moet worden.',
        'Grote waardering heb ik ook voor de korte lijntjes en het persoonlijke contact met de medewerkers van TSE. Door samenwerking met de klant, denken ze niet alleen in oplossingen, maar nog veel belangrijker, in verbeteringen. Samen het programma beter en gebruiksvriendelijker maken.',
        'Door de overgang naar het programma van TSE hebben we in dit verandertraject dan ook gelijk een hele efficiencyslag kunnen maken door snellere software en meer mogelijkheden (features).',
        'TSE heeft de blik op vooruit richting de toekomst, waarbij je energie krijgt van de eindeloze hoeveelheid mogelijkheden die het programma biedt. En is het er niet? Dan komt het op de ontwikkellijst en wordt het ook daadwerkelijk tot ontwikkeling gebracht.',
        'Ik zie dan ook met vertrouwen de toekomst en samenwerking met TSE tegemoet voor het juist verwerken van onze patiëntenadministratie.',
        'Normaal zou ik zeggen "bij twijfel niet inhalen", maar overweeg je de overstap naar TSE? Dan zou ik zeggen "gas erop!".',
      ],
    ),
    _StoryData(
      photoPath: 'lib/assets/testimonial_edwin.jpg',
      name: 'Edwin van der Male',
      role: 'Tandprotheticus, Van der Male Tandprothetiek (Zwijndrecht)',
      quote:
      'TSE is betrouwbaar en altijd bereikbaar: bij hen zijn de lijntjes kort en worden oplossingen vaak zo snel als binnen 24 uur verzorgd.',
      bodyParagraphs: [
        'Sinds 2023 zijn wij gebruikers van het ONT-pakket van TSE. In het verleden gebruikten wij een ander pakket, maar toen we met een uitbreiding van onze locatie en een behandelaar werden geconfronteerd verliep dit nogal omslachtig. Toen wij bij toeval een mailing van TSE ontvingen over het ONT-pakket hebben we gelijk contact gezocht en de situatie uitgelegd.',
        'Al snel merkten we dat TSE begreep wat we nodig hadden, en binnen twee weken was alles geregeld omtrent de overstap. TSE is betrouwbaar en altijd bereikbaar: bij hen zijn de lijntjes kort en worden oplossingen vaak zo snel als binnen 24 uur verzorgd.',
        'Het ONT-pakket zelf is een aanpasbaar systeem en de vrijheid om het in te richten naar onze specifieke behoeften maakt het zeer uitgebreid. Daarnaast is de samenwerking met TPP Solution ideaal omdat het veel werk uit handen neemt als het gaat om aanvragen en declareren.',
        'We willen TSE bedanken voor de support en we kijken uit naar een mooie samenwerking.',
      ],
    ),
    _StoryData(
      photoPath: 'lib/assets/testimonial_harout.png',
      name: 'Harout Stepanian',
      role: 'Tandprotheticus',
      quote:
      'Als recente gebruiker ben ik buitengewoon enthousiast over de gebruiksvriendelijke tools en uitgebreide functies die het softwareprogramma van TSE te bieden heeft.',
      bodyParagraphs: [
        'Als recente gebruiker ben ik buitengewoon enthousiast over de gebruiksvriendelijke tools en uitgebreide functies die het softwareprogramma van TSE te bieden heeft. Hoewel het aanvankelijk wat tijd kostte om het programma goed te begrijpen, verliep dit proces soepel dankzij de bijzonder vriendelijke en toegankelijke ondersteuning van het TSE-team.',
      ],
    ),
    _StoryData(
      photoPath: 'lib/assets/testimonial_hans.png',
      name: 'Hans Stoop',
      role: 'Tandprotheticus',
      quote:
      'Een groot pluspunt is de uitstekende service van TSE. Wanneer je belt, krijg je direct iemand aan de lijn en hoef je niet te wachten tot er misschien iemand terugbelt die dag.',
      bodyParagraphs: [
        'Na lang nadenken en oriënteren over welk programma ik moest kiezen, wist ik het zeker: ik ga voor TSE. En daar ben ik heel blij mee, want het programma sluit perfect aan bij de tandprothetische praktijk.',
        'Ik heb gekozen voor TSE in de cloud, omdat er vaak updates zijn en ik me daar in de cloud geen zorgen over hoef te maken. Toen ik TSE aanschafte, werden mijn patiëntgegevens overgezet, waarna ik ongeveer twee maanden heb geoefend en de instellingen voor onder andere mail en verwijzingen voor de kaakchirurg en tandarts heb aangepast. Op 4 augustus zijn mijn patiëntgegevens opnieuw overgezet en ben ik echt met TSE aan de slag gegaan.',
        'In het begin moest ik erg wennen aan me de indeling van het programma, maar ik ontdekte al snel dat alles goed in elkaar zit en dat het gemakkelijk te gebruiken is. Zo kun je eenvoudig een machtigingsaanvraag doen en mails naar patiënten sturen. Bij een COV-controle zie je meteen of iemand onder de WLZ valt (hiervoor heb je wel een autorisatie van Vecozo nodig).',
        'Een groot pluspunt is de uitstekende service van TSE. Wanneer je belt, krijg je direct iemand aan de lijn en hoef je niet te wachten tot er misschien iemand terugbelt die dag. Ik ben ook erg tevreden dat TSE samenwerkt met TPP Solution. Zij hebben de werkstukken in TSE gemaakt, die zeer uitgebreid zijn. Bij TPP Solution word je ook weer uitstekend geholpen en dat altijd direct.',
      ],
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
      2400,
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildStoryGrid(BuildContext context) {
    final columns = isMobile(context)
        ? 1
        : (isTablet(context) ? 2 : 3);
    final cardIndices = [for (var i = 0; i < _stories.length; i++) i];
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
        final rowChildren = <Widget>[];
        for (var c = 0; c < rowIndices.length; c++) {
          if (c != 0) rowChildren.add(const SizedBox(width: 24));
          rowChildren.add(
            Expanded(
              child: _StoryCard(
                data: _stories[rowIndices[c]],
                selected: _selectedIndex == rowIndices[c],
                onTap: () => _select(rowIndices[c]),
              ),
            ),
          );
        }
        // Fill the remaining cells of a partial last row with empty flex
        // slots. Without them the row's Expanded children split the full
        // width between however many cards are left, so a single leftover
        // card would stretch across the whole grid instead of staying one
        // column wide.
        for (var c = rowIndices.length; c < columns; c++) {
          rowChildren
            ..add(const SizedBox(width: 24))
            ..add(const Expanded(child: SizedBox.shrink()));
        }

        rowChild = IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: rowChildren,
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
      body: AutoScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const SizedBox(height: 56),
            BlockContainer(
              screenWidthFactor: 1,
              child: Center(
                child: ContentContainer(
                  child: Column(
                    children: [
                      Text(
                        "Wat praktijken zeggen over",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: AppFont.h3(context), fontWeight: FontWeight.bold, color: _darkTeal),
                      ),
                      Text(
                        "Odontium",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: AppFont.h1(context), fontWeight: FontWeight.bold, color: _teal),
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
            BlockContainer(
              backgroundColor: const Color.fromRGBO(226, 238, 245, 1),
              screenWidthFactor: 1,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  // Cross-fade + gentle rise when another story is chosen,
                  // easing the height difference instead of snapping.
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOutCubic,
                    alignment: Alignment.topCenter,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      switchInCurve: Curves.easeOutCubic,
                      switchOutCurve: Curves.easeInCubic,
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.015),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      ),
                      layoutBuilder: (currentChild, previousChildren) => Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          ...previousChildren,
                          if (currentChild != null) currentChild,
                        ],
                      ),
                      child: Column(
                        key: ValueKey(_selectedIndex),
                        children: [
                          Text(
                            selected.name,
                            style: TextStyle(fontSize: AppFont.h3(context), fontWeight: FontWeight.bold, color: _teal),
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
                              HoverScale(
                                scale: 1.08,
                                child: InkWell(
                                  onTap: () => _select((_selectedIndex - 1 + _stories.length) % _stories.length),
                                  borderRadius: BorderRadius.circular(8),
                                  child: const Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.arrow_back, size: 16, color: _darkTeal),
                                        SizedBox(width: 8),
                                        Text("Vorig verhaal", style: TextStyle(fontSize: 13, color: _darkTeal)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              HoverScale(
                                scale: 1.08,
                                child: InkWell(
                                  onTap: () => _select((_selectedIndex + 1) % _stories.length),
                                  borderRadius: BorderRadius.circular(8),
                                  child: const Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Volgend verhaal", style: TextStyle(fontSize: 13, color: _darkTeal)),
                                        SizedBox(width: 8),
                                        Icon(Icons.arrow_forward, size: 16, color: _darkTeal),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
