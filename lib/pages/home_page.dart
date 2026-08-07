import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:odontium_website/widgets/home_page/hero.dart';
import 'package:odontium_website/widgets/home_page/marquee_text.dart';
import 'package:http/http.dart' as http;
import '../connections/grpc_client.dart';
import '../widgets/checkmark_list.dart';
import '../widgets/general/block_container.dart';
import '../widgets/general/footer.dart';
import '../widgets/home_page/FeatureCard/feature_card.dart';
import '../widgets/home_page/discipline_cards.dart';
import '../widgets/home_page/faq.dart';
import 'package:grpc/grpc.dart';
import '../proto/agenda.pbgrpc.dart';
import '../widgets/review_section.dart';
import '../widgets/support_features.dart';
import '../widgets/home_page/cluster_decoration.dart';
import '../widgets/general/responsive.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final mobile = isMobile(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            BlockContainer(
              padding: EdgeInsetsGeometry.all(0),
              hasHorizontalPadding: false,
              screenWidthFactor: 1,
              backgroundColor: Color.fromRGBO(234, 241, 244, 1),
              height: 100,
              child: SizedBox(
                height: (screenSize.height * 0.1).clamp(100, 100),
                child: TextMarquee(
                  itemWidth: screenSize.height * 0.1 < 200
                      ? 200
                      : screenSize.height * 0.1,
                  speed: 200,
                  children: [
                    "Visiquick",
                    "Romexis",
                    "Yealink",
                    "Brother",
                    "Dymo",
                    "Zorgplan",
                    "Payt",
                    "Zivver",
                    "Zorgsom",
                    "3Shape",
                    "CCBR",
                  ],
                ),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BlockContainer(
                      padding: EdgeInsets.all(8),
                      hasHorizontalPadding: false,
                      screenWidthFactor: 1,
                      backgroundColor: Color.fromRGBO(253, 255, 255, 1),
                      child: Column(
                        children: [
                          SizedBox(height: 48),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: mobile ? 24.0 : 0.0),
                            child: Text(
                              'Alles wat uw praktijk nodig \nheeft in één systeem',
                              style: TextStyle(
                                fontSize: mobile ? 32 : 52,
                                height: 1.15,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w900,
                                color: const Color(0xFF0F382C),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 32),
                          Container(
                            width: 1200,
                            child: FeatureChecklist(items: const [
                              'Agenda & afspraakplanning',
                              'Complete patiëntendossiers',
                              'Declaraties & facturatie',
                              'Automatische afspraakherinneringen',
                              'Persoonlijke support zonder tickets',
                              'Koppelingen met uw bestaande systemen',
                              'ISO 27001 & AVG-proof',
                              ],),
                          ),
                          SizedBox(height: 48,),
                          FeatureHighlightsSection(
                            onDiscoverPressed: () => {},
                          ),
                          SizedBox(height: 48)
                        ],
                      ),
                    ),
                    BlockContainer(
                      padding: EdgeInsets.zero,
                      hasHorizontalPadding: false,
                      screenWidthFactor: 1,
                      backgroundColor: Colors.grey,
                      child: DisciplineShowcaseSection(),
                    ),
                    BlockContainer(screenWidthFactor: 1, child: TestimonialSection(
                      data: TestimonialData(
                        photoAsset: 'assets/images/testimonial_joep.jpg',
                        authorName: 'Joep van Engelen',
                        authorRole: 'TPP van Engelen',
                        quote: const [
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
                    )),


                  ],
                ),


                ClusterDecoration(verticalOffset: -150,),
                ClusterDecoration(side: ClusterSide.left, verticalOffset: 550,)
              ],
            ),
            BlockContainer(
                screenWidthFactor: 1,
                hasHorizontalPadding: false,
                child: OverstapSection()
            ),
            BlockContainer(
              child: FAQSection(
                title: "Veelgestelde vragen",
                items: const [
                  FAQItem(
                    question:
                    "Al meer dan 35 jaar ontwikkelt TSE met Odontium praktijksoftware?",
                    answer:
                    "Ja. TSE ontwikkelt al meer dan 35 jaar praktijksoftware voor tandartspraktijken en ondersteunt honderden praktijken.",
                  ),
                  FAQItem(
                    question: "Kan ik overstappen vanuit een ander systeem?",
                    answer:
                    "Ja. Wij begeleiden de volledige migratie van uw huidige software naar Odontium.",
                  ),
                  FAQItem(
                    question: "Bieden jullie ondersteuning?",
                    answer:
                    "Onze supportafdeling staat iedere werkdag klaar om u te helpen.",
                  ),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: const [
            //     Expanded(child: DbButton()),
            //     Expanded(child: DbGrpcButton()),
            //   ],
            // ),
            // BlockContainer(
            //   backgroundColor: Color.fromRGBO(246, 251, 251, 1),
            //   child: FeatureSection(
            //     title: "Praktijksoftware hoeft niet als een \ntweede baan te voelen",
            //     subtitle: "",
            //     cards: const [
            //       FeatureCard(
            //         title: "35+ jaar",
            //         description: "Ervaring binnen de tandheelkunde.",
            //         icon: Icons.timer,
            //       ),
            //
            //       FeatureCard(
            //         title: "1000+",
            //         description: "Praktijken vertrouwen op ons.",
            //         icon: Icons.numbers,
            //       ),
            //
            //       FeatureCard(
            //         title: "24/7",
            //         description: "Ondersteuning wanneer nodig.",
            //         icon: Icons.today,
            //       ),
            //     ],
            //   ),
            // ),
            // DbButton(),
            // BlockContainer(
            //   height: (screenSize.height * 0.5).clamp(500.0, 550.0),
            //   child: FadeCarousel(
            //     items: [
            //       ReviewCard(
            //         imagePath: "lib/assets/tempface.jpg",
            //         link: "Link",
            //         uitspraak:
            //             "Blablabla LALALLALA Leleleleele Lulululuulululu Lililililililil Lololololol",
            //         gezegd_door: "Strootman",
            //         job: "Tandarts",
            //       ),
            //       ReviewCard(
            //         imagePath: "lib/assets/tempface.jpg",
            //         link: "Link",
            //         uitspraak: "Een broodje met... Beleg.",
            //         gezegd_door: "Strootman",
            //         job: "Tandarts",
            //       ),
            //       ReviewCard(
            //         imagePath: "lib/assets/images.jpg",
            //         link: "Link",
            //         uitspraak:
            //             "Wat er staat? Ja geen idee iets met been through hell and death ofzo.\nIk zag 't staan ik dacht pleur er maar op!",
            //         gezegd_door: "Internetgekkie",
            //         job: "Werkloos",
            //       ),
            //     ],
            //   ),
            // ),

            // BlockContainer(
            //   hasHorizontalPadding: false,
            //   screenWidthFactor: 1,
            //   backgroundColor: Colors.grey,
            //   child: Column(
            //     children: [
            //       Center(
            //         child: Text(
            //           "Partners en Integraties",
            //           style: TextStyle(fontSize: 24),
            //         ),
            //       ),
            //       SizedBox(
            //         height: screenSize.height * 0.1 < 200
            //             ? 200
            //             : screenSize.height * 0.1,
            //         child: Marquee(
            //           itemWidth: screenSize.height * 0.1 < 200
            //               ? 200
            //               : screenSize.height * 0.1,
            //           speed: 200,
            //           children: [
            //             Image.asset("lib/assets/vq.jpg"),
            //             Image.asset("lib/assets/Odontium.png"),
            //             Image.asset("lib/assets/rom.jpg"),
            //             Image.asset("lib/assets/dymo.png"),
            //             Image.asset("lib/assets/bro.png"),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            //
            // BlockContainer(
            //   hasHorizontalPadding: false,
            //   padding: EdgeInsetsGeometry.symmetric(vertical: 32),
            //   screenWidthFactor: 1,
            //   child: ProcessTimelineSection(
            //     title:
            //         'Van eerste gesprek tot livegang\nregelen we het samen met u',
            //     subtitle:
            //         'Al meer dan 35 jaar ontwikkelt TSE met Odontium praktijksoftware voor tandartspraktijken, mondhygiënisten',
            //     footerText: 'En de volgende stap is ...',
            //     onFooterTap: () {},
            //     steps: const [
            //       TimelineStepData(
            //         title: 'Gratis Demo',
            //         description:
            //             'Al meer dan 35 jaar ontwikkelt TSE met Odontium praktijksoftware voor tandartspraktijken, mondhygiënisten',
            //       ),
            //       TimelineStepData(
            //         title: 'Offerte op maat',
            //         description:
            //             'Al meer dan 35 jaar ontwikkelt TSE met Odontium praktijksoftware voor tandartspraktijken, mondhygiënisten',
            //       ),
            //       TimelineStepData(
            //         title: 'Data-migratie',
            //         description:
            //             'Al meer dan 35 jaar ontwikkelt TSE met Odontium praktijksoftware voor tandartspraktijken, mondhygiënisten',
            //       ),
            //       TimelineStepData(
            //         title: 'Training',
            //         description:
            //             'Al meer dan 35 jaar ontwikkelt TSE met Odontium praktijksoftware voor tandartspraktijken, mondhygiënisten',
            //       ),
            //       TimelineStepData(
            //         title: 'Livegang',
            //         description:
            //             'Al meer dan 35 jaar ontwikkelt TSE met Odontium praktijksoftware voor tandartspraktijken, mondhygiënisten',
            //       ),
            //     ],
            //   ),
            // ),

            WebsiteFooter(),
          ],
        ),
      ),
    );
  }
}

class DbButton extends StatefulWidget {
  const DbButton({super.key});

  @override
  State<DbButton> createState() => _DbButtonState();
}

class _DbButtonState extends State<DbButton> {
  // Store the JSON array as a list of maps
  List<dynamic>? _afspraken;
  int? _elapsedMs;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _afspraken = null;
    });

    final stopwatch = Stopwatch()..start();

    try {
      String host = '127.0.0.1';

      // 2. Make the HTTP GET request
      final url = Uri.parse("http://$host:8080/getAgendaAfspraken");
      final response = await http.get(url);

      stopwatch.stop();
      // 3. Check status code and decode JSON
      if (response.statusCode == 200) {
        setState(() {
          _afspraken = jsonDecode(response.body);
          // (web.HTMLAnchorElement()
          //       ..href = web.URL.createObjectURL(
          //         web.Blob(
          //           [
          //             const Utf8Encoder()
          //                 .convert(
          //                   const JsonEncoder.withIndent(
          //                     '  ',
          //                   ).convert(_afspraken),
          //                 )
          //                 .toJS,
          //           ].toJS,
          //           web.BlobPropertyBag(type: 'application/json'),
          //         ),
          //       )
          //       ..download = 'output.json')
          //     .click();
          _elapsedMs = stopwatch.elapsedMilliseconds;
        });
      } else {
        setState(() {
          _errorMessage = "Server error: ${response.statusCode}";
          _elapsedMs = stopwatch.elapsedMilliseconds;
        });
      }
    } catch (e) {
      stopwatch.stop();
      setState(() {
        _errorMessage = "Network Error: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: _isLoading ? null : _fetchData,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text("Fetch MariaDB Afspraken"),
        ),
        const SizedBox(height: 12),

        // Show Errors
        if (_errorMessage != null)
          Text(_errorMessage!, style: const TextStyle(color: Colors.red)),

        // Show Success Data
        if (_afspraken != null && _elapsedMs != null) ...[
          Text(
            "Found ${_afspraken!.length} records",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            "Time taken: $_elapsedMs ms",
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),

          // Sneak peek at the first record to prove it works
          if (_afspraken!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "First Record:\n"
                "Naam: ${_afspraken![0]['naam'] ?? 'N/A'}\n"
                "Datum: ${_afspraken![0]['agenda_datum_a'] ?? 'N/A'}\n"
                "Kamer: ${_afspraken![0]['agenda_kamer'] ?? 'N/A'}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ],
        ],
      ],
    );
  }
}

class DbGrpcButton extends StatefulWidget {
  const DbGrpcButton({super.key});

  @override
  State<DbGrpcButton> createState() => _DbGrpcButtonState();
}

class _DbGrpcButtonState extends State<DbGrpcButton> {
  // Store the gRPC responses directly
  List<AgendaAfspraak>? _afspraken;
  int? _elapsedMs;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _afspraken = null;
    });

    final stopwatch = Stopwatch()..start();

    try {
      // Execute gRPC call over the persistent open connection
      final afspraken = await AgendaGrpcClient.instance.getAgendaAfspraken(
        paraDatumVanaf: '2026-07-20',
        paraDatumTm: '2026-07-24',
      );

      stopwatch.stop();

      setState(() {
        _afspraken = afspraken;
        _elapsedMs = stopwatch.elapsedMilliseconds;
      });
    } on GrpcError catch (e) {
      stopwatch.stop();
      setState(() {
        _errorMessage = "gRPC Error [${e.codeName}]: ${e.message}";
        _elapsedMs = stopwatch.elapsedMilliseconds;
      });
    } catch (e) {
      stopwatch.stop();
      setState(() {
        _errorMessage = "Network Error: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: _isLoading ? null : _fetchData,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text("Fetch MariaDB via gRPC"),
        ),
        const SizedBox(height: 12),

        // Show Errors
        if (_errorMessage != null)
          Text(_errorMessage!, style: const TextStyle(color: Colors.red)),

        // Show Success Data
        if (_afspraken != null && _elapsedMs != null) ...[
          Text(
            "Found ${_afspraken!.length} records",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            "Time taken: $_elapsedMs ms",
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),

          // Sneak peek at the first record
          if (_afspraken!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "First Record:\n"
                "Naam: ${_afspraken![0].naam.isNotEmpty ? _afspraken![0].naam : 'N/A'}\n"
                "Datum: ${_afspraken![0].hasAgendaDatumA() ? _afspraken![0].agendaDatumA : 'N/A'}\n"
                "Kamer: ${_afspraken![0].hasAgendaKamer() ? _afspraken![0].agendaKamer : 'N/A'}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ],
        ],
      ],
    );
  }
}
