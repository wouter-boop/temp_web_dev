import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:odontium_website/widgets/general/footer.dart';
import 'package:odontium_website/widgets/general/hover_arrow_button.dart';
import 'package:odontium_website/widgets/over_odontium.dart';
import 'package:odontium_website/widgets/product_page/comparison_cards.dart';
import 'package:odontium_website/widgets/product_page/features_List.dart';
import 'package:odontium_website/widgets/product_page/role_card.dart';
import 'package:odontium_website/widgets/product_page/sidekick_hero.dart';
import 'package:odontium_website/widgets/product_page/tab_features.dart';

import '../widgets/checkmark_list.dart';
import '../widgets/general/block_container.dart';
import '../widgets/general/responsive.dart';
import '../widgets/home_page/arrow_button.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlockContainer(
              screenWidthFactor: 1,
              child: SidekickHero(),
            ),
            BlockContainer(
              screenWidthFactor: 1,
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Text(
                      "Iedere medewerker werkt anders. Daarom biedt Odontium een werkomgeving die aansluit op de dagelijkse werkzamnheden van iedere gebruiker, terwijl iedereen samenwerkt in het zelfde systeem.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  mobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            RoleCard(
                              data: RoleCardData(
                                icon: Icons.show_chart,
                                title: 'Praktijkeigenaar',
                                description:
                                    'Inzicht in omzet, bezetting en no-shows zonder handmatige rapportages.',
                              ),
                            ),
                            const SizedBox(height: 24),
                            RoleCard(
                              data: RoleCardData(
                                icon: Icons.medical_services_outlined,
                                title: 'Behandelaar',
                                description:
                                    'Volledig dossier in beeld tijdens de behandeling. Direct vastleggen, niet later uitwerken.',
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RoleCard(
                              data: RoleCardData(
                                icon: Icons.show_chart,
                                title: 'Praktijkeigenaar',
                                description:
                                    'Inzicht in omzet, bezetting en no-shows zonder handmatige rapportages.',
                              ),
                            ),
                            const SizedBox(width: 32),
                            RoleCard(
                              data: RoleCardData(
                                icon: Icons.medical_services_outlined,
                                title: 'Behandelaar',
                                description:
                                    'Volledig dossier in beeld tijdens de behandeling. Direct vastleggen, niet later uitwerken.',
                              ),
                            ),
                          ],
                        ),
                  const SizedBox(height: 32),
                  mobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            RoleCard(
                              data: RoleCardData(
                                icon: Icons.headset_mic_outlined,
                                title: 'Balie',
                                description:
                                    'Plannen, verzetten en herinneren vanuit één scherm. Minder telefoon, minder gedoe.',
                              ),
                            ),
                            const SizedBox(height: 24),
                            RoleCard(
                              data: RoleCardData(
                                icon: Icons.people_outline,
                                title: 'Assistent',
                                description:
                                    'Voorbereiding, materialen en vervolgafspraken staan klaar voor elke behandeling.',
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RoleCard(
                              data: RoleCardData(
                                icon: Icons.headset_mic_outlined,
                                title: 'Balie',
                                description:
                                    'Plannen, verzetten en herinneren vanuit één scherm. Minder telefoon, minder gedoe.',
                              ),
                            ),
                            const SizedBox(width: 32),
                            RoleCard(
                              data: RoleCardData(
                                icon: Icons.people_outline,
                                title: 'Assistent',
                                description:
                                    'Voorbereiding, materialen en vervolgafspraken staan klaar voor elke behandeling.',
                              ),
                            ),
                          ],
                        ),
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
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 900),
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
                    screenWidthFactor: mobile ? 1 : 0.5,
                    child: SmallInfoBlock(
                      isLeft: false,
                      imagePath: "",
                      titel: "Agenda & Planning",
                      subtitel:
                          "Beheer de planning van uw praktijk vanuit één overzichtelijke agenda en houd grip op alle afspraken",
                      punt1: "Plan en beheer afspraken eenvoudig",
                      punt2: "Bekijk meerdere agenda's tegelijkertijd",
                      punt3: "Verstuur automatische afspraakherinneringen",
                    ),
                  ),
                  BlockContainer(
                    backgroundColor: Color.fromRGBO(226, 238, 245, 1),
                    screenWidthFactor: mobile ? 1 : 0.5,
                    child: SmallInfoBlock(
                      imagePath: "",
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
                    screenWidthFactor: mobile ? 1 : 0.5,
                    child: SmallInfoBlock(
                      isLeft: false,
                      imagePath: "",
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
                    screenWidthFactor: mobile ? 1 : 0.5,
                    child: SmallInfoBlock(
                      imagePath: "",
                      titel: "Documentbeheer",
                      subtitel:
                          "Beheer documenten centraal en werk zonder losse bestanden of verschillende programma's.",
                      punt1: "Word- Excel- en PDF-bestanden beheren",
                      punt2: "Digitale handtekeningen (eIDAS)",
                      punt3: "Documenten koppelen aan patiëntdossiers",
                    ),
                  ),
                  BlockContainer(
                    backgroundColor: Colors.white,
                    screenWidthFactor: mobile ? 1 : 0.5,
                    child: SmallInfoBlock(
                      isLeft: false,
                      imagePath: "",
                      titel: "Communicatie",
                      subtitel:
                          "Communiceer eenvoudig met patiënten en automatiseer terugkerende contactmomenten",
                      punt1: "Automatische afspraakherinneringen",
                      punt2: "Telefoonpop-up bij inkomende gesprekken",
                      punt3: "Koppelingen met ZorgMail en Zivver",
                    ),
                  ),
                  BlockContainer(
                    backgroundColor: Color.fromRGBO(226, 238, 245, 1),
                    screenWidthFactor: mobile ? 1 : 0.5,
                    child: SmallInfoBlock(
                      imagePath: "",
                      titel: "Rapportages & Inzichten",
                      subtitel:
                          "Krijg inzicht in de prestaties van uw praktijk met duidelijke rapportages en overzichten.",
                      punt1: "Financiële en managementrapportages",
                      punt2: "Praktijkprestaties analyseren",
                      punt3: "Gegevens exporteren voor verdere verwerking",
                    ),
                  ),
                ],
              ),
            ),
            BlockContainer(
              screenWidthFactor: mobile ? 1 : 0.5,
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
                        fontSize: 20,
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
                    SizedBox(height: 64,),
                    Center(
                      child: mobile
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                HoverArrowButton(label: "Slimme Functies", onPressed: ()=>{}),
                                const SizedBox(height: 16),
                                HoverArrowButton(label: "Integraties", onPressed: ()=>{}),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 64,
                              children: [
                              HoverArrowButton(label: "Slimme Functies", onPressed: ()=>{}),
                              HoverArrowButton(label: "Integraties", onPressed: ()=>{})
                            ],),
                    ),
                    SizedBox(height: 32,),
                    Center(
                      child: mobile
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                HoverArrowButton(label: "Slimme Functies", onPressed: ()=>{}),
                                const SizedBox(height: 16),
                                HoverArrowButton(label: "Integraties", onPressed: ()=>{}),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 64,
                              children: [
                              HoverArrowButton(label: "Slimme Functies", onPressed: ()=>{}),
                              HoverArrowButton(label: "Integraties", onPressed: ()=>{})
                            ],),
                    ),
                  ],
                ),
              ),
            ),
            BlockContainer(

              padding: EdgeInsets.only(top: 0, bottom: 0),
              hasHorizontalPadding: false,
              screenWidthFactor: 1,
              child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: responsiveValue(context, desktop: 420, mobile: 640),
                  child: Image.asset("lib/assets/frame.png", fit: BoxFit.cover),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: mobile ? 40.0 : 64.0,
                      left: 24.0,
                      right: 24.0,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Klaar om Odontium \nzelf te ervaren?", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                          ConstrainedBox(constraints: BoxConstraints(maxWidth: 750), child: Text("Ontdek tijdens een vrijblijvende persoonlijke demo hoe Odontium uw praktijk helpt efficiënter te werken.", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w100), textAlign: TextAlign.center)),
                          SizedBox(height: 64,),
                          mobile
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Color.fromRGBO(37, 106, 130, 1),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 28,
                                          vertical: 18,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: const Text(
                                        'Plan een Demo',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    ArrowButton(text: "Ontdek Odontium", function: () => {}, white: true,),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 16,
                                  children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Color.fromRGBO(37, 106, 130, 1),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 28,
                                        vertical: 18,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Text(
                                      'Plan een Demo',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  ArrowButton(text: "Ontdek Odontium", function: () => {}, white: true,),
                                ],)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),),
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
    final mobile = isMobile(context);

    final image = ConstrainedBox(
      constraints: BoxConstraints(maxWidth: mobile ? double.infinity : 460),
      child: Image.asset(imagePath, fit: BoxFit.contain),
    );

    final textBlock = Container(
      width: mobile ? double.infinity : 340,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titel,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
      ),
    );

    if (mobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          image,
          const SizedBox(height: 24),
          textBlock,
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 64,
      children: [
        isLeft ? image : Container(),
        textBlock,
        isLeft ? Container() : image,
      ],
    );
  }
}
