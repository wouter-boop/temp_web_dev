import 'dart:ui';

import 'package:flutter/material.dart';

class TabFeatures extends StatefulWidget {
  const TabFeatures({super.key});

  @override
  State<TabFeatures> createState() => _TabFeaturesState();
}

class _TabFeaturesState extends State<TabFeatures> with TickerProviderStateMixin {
  static const Color lightGrey = Color(0xFFDCDCDC);
  static const Color darkGrey = Color(0xFFB0B0B0);
  static const Color textDark = Color(0xFF0F3B3F);


  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tab Bar Container
        Container(
          color: darkGrey,
          child: TabBar(
            controller: _controller,
            indicatorSize: TabBarIndicatorSize.tab,
            // Hides default underline indicator
            indicator: const BoxDecoration(color: lightGrey),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black87,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            tabs: const [
              Tab(text: "Docx"),
              Tab(text: "IMAGE"),
              Tab(text: "XLSX"),
              Tab(text: "PDF"),
              Tab(text: "Email"),
            ],
          ),
        ),

        // Content Area
        SizedBox(
          height: 450,
          child: TabBarView(
            controller: _controller,
            children: [
              _buildTabContent(
                title: "Textbewerker (.docx)",
                description:
                "Plan afspraken eenvoudig, beheer meerdere behandelkamers en houd altijd overzicht over uw agenda — ook op drukke dagen met meerdere behandelaars.",
                bulletPoints: const [
                  "Dag-, week- en maandweergave",
                  "Meerdere agenda's",
                  "Herhaalafspraken",
                ],
                imagePath: "lib/assets/docx.png",
              ),
              _buildTabContent(
                title: "Afbeeldingen",
                description:
                "Beheer en bekijk al uw afbeeldingen direct vanuit de app.",
                bulletPoints: const [
                  "Snelle weergave",
                  "Ondersteuning voor JPG, PNG",
                ],
                imagePath: "lib/assets/img.png",
              ),
              _buildTabContent(
                title: "Excel Sheets (.xlsx)",
                description:
                "Analyseer uw gegevens met spreadsheets.",
                bulletPoints: const [
                  "Formules",
                  "Grafieken en tabellen",
                ],
                imagePath: "lib/assets/excel.png",
              ),
              _buildTabContent(
                title: "PDF Documenten",
                description:
                "Bekijk en download direct uw PDF rapportages.",
                bulletPoints: const [
                  "Hoge resolutie",
                  "Afdrukondersteuning",
                ],
                imagePath: "lib/assets/pdf.png",
              ),
              _buildTabContent(
                title: "E-mail Integreer",
                description:
                "Verzend eenvoudig documenten via e-mail.",
                bulletPoints: const [
                  "Sjabloonbeheer",
                  "Automatische verzending",
                ],
                imagePath: "assets/email_preview.png",
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildTabContent({
    required String title,
    required String description,
    required List<String> bulletPoints,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                ...bulletPoints.map(
                      (point) => Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "• ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            point,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Transform.translate(
                  offset: const Offset(2, 4),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4),
                        BlendMode.srcIn,
                      ),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                // 2. Main Image
                Image.asset(
                  imagePath,
                  fit: BoxFit.fitHeight,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.white,
                    child: const Center(
                      child: Icon(Icons.image, size: 60, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
