import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/general/auto_scroll_view.dart';
import 'package:flutter/material.dart';
import '../widgets/general/type_scale.dart';
import '../widgets/general/content_container.dart';
import 'package:go_router/go_router.dart';

import '../widgets/general/block_container.dart';
import '../widgets/general/demo_cta_banner.dart';
import '../widgets/general/footer.dart';
import '../widgets/general/micro_animations.dart';
import '../widgets/general/reveal_on_scroll.dart';

const _darkTeal = Color(0xFF0F3B3F);
const _teal = Color(0xFF17A8A6);
const _subtext = Color(0xFF616161);
const _cardBorder = Color(0xFFE0E0E0);

const _disciplines = [
  'Tandarts',
  'Mondhygiënist',
  'Tandprotheticus',
  'Tandtechnicus',
  'Praktijkmanager',
  'Overig',
];

const _infoValueStyle = TextStyle(fontSize: 14, color: Color(0xFF222222), height: 1.4);

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String _discipline = _disciplines.first;

  InputDecoration _fieldDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: _subtext, fontSize: 13),
      filled: true,
      fillColor: const Color(0xFFF7F8F9),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: _cardBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: _cardBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: _teal, width: 1.5),
      ),
    );
  }

  Widget _fieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF333333)),
      ),
    );
  }

  Widget _fieldLabelOptional(String main, String suffix) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: main,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF333333)),
            ),
            TextSpan(text: suffix, style: const TextStyle(fontSize: 12, color: _subtext)),
          ],
        ),
      ),
    );
  }

  Widget _fieldRow(bool isMobile, Widget left, Widget right) {
    if (isMobile) {
      return Column(children: [left, const SizedBox(height: 20), right]);
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: left),
        const SizedBox(width: 20),
        Expanded(child: right),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Intentionally a higher, page-local threshold than the shared
    // kMobileBreakpoint/kTabletBreakpoint (700/1000): the info-card+map /
    // form two-column layout below needs more room than the generic mobile
    // cutoff gives it. `isTablet(context) || isMobile(context)` (<1000)
    // would stack this page ~100px earlier than before, visibly changing
    // behavior in the 900-999px range, so the local 900px threshold is kept.
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      body: AutoScrollView(
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
                        "Neem contact met ons op",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppFont.h1(context),
                          fontWeight: FontWeight.bold,
                          color: _darkTeal,
                        ),
                      ),
                      const SizedBox(height: 24),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 640),
                        child: const Text(
                          "Heeft u een vraag over Odontium, wilt u persoonlijk advies of bent u "
                          "benieuwd wat onze software voor uw praktijk kan betekenen? Ons team "
                          "staat voor u klaar.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: _subtext, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 40),
                      _buildTopBoxes(isMobile),
                      const SizedBox(height: 40),
                      Container(width: 320, height: 1, color: const Color(0xFFDDE3E5)),
                    ],
                  ),
                ),
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              child: Center(
                child: ContentContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stuur ons een bericht",
                        style: TextStyle(fontSize: AppFont.h2(context), fontWeight: FontWeight.bold, color: _darkTeal),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Vul het formulier in en wij nemen binnen één werkdag contact met u op.",
                        style: TextStyle(fontSize: 14, color: _subtext),
                      ),
                      const SizedBox(height: 32),
                      _buildContactSection(isMobile),
                    ],
                  ),
                ),
              ),
            ),
            BlockContainer(
              backgroundColor: const Color.fromRGBO(226, 238, 245, 1),
              screenWidthFactor: 1,
              child: Center(
                child: ContentContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bent u al klant?",
                        style: TextStyle(fontSize: AppFont.h2(context), fontWeight: FontWeight.bold, color: _darkTeal),
                      ),
                      const SizedBox(height: 8),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 700),
                        child: const Text(
                          "Voor vragen over een praktijk die al met Odontium werkt, helpt ons "
                          "supportteam u direct verder. U krijgt iemand aan de lijn die de "
                          "software kent.",
                          style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 32),
                      _buildSupportTeasers(isMobile),
                    ],
                  ),
                ),
              ),
            ),
            const DemoCtaBanner(
              heading: "We helpen u graag verder",
              description:
                  "Of u nu een vraag heeft, een demonstratie wilt plannen of meer wilt weten over "
                  "Odontium, wij staan voor u klaar.",
            ),
            WebsiteFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBoxes(bool isMobile) {
    final callBox = Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(226, 238, 245, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "LIEVER BELLEN",
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: _darkTeal, letterSpacing: 0.5),
          ),
          SizedBox(height: 6),
          Text("053 - 477 77 86", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: _darkTeal)),
        ],
      ),
    );

    final hoursBox = Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _cardBorder),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Ma t/m do 08:30 – 17:30", style: TextStyle(fontSize: 13, color: Color(0xFF333333))),
          SizedBox(height: 4),
          Text("Vrijdag 08:30 – 15:00", style: TextStyle(fontSize: 13, color: Color(0xFF333333))),
          SizedBox(height: 4),
          Text("info@odontium.nl", style: TextStyle(fontSize: 13, color: Color(0xFF333333))),
        ],
      ),
    );

    if (isMobile) {
      return Column(children: [callBox, const SizedBox(height: 16), hoursBox]);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [callBox, const SizedBox(width: 20), hoursBox],
    );
  }

  Widget _buildContactSection(bool isMobile) {
    final infoColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoCard(),
        const SizedBox(height: 24),
        _buildMap(),
      ],
    );
    final formColumn = _buildFormCard(isMobile);

    if (isMobile) {
      return Column(children: [infoColumn, const SizedBox(height: 32), formColumn]);
    }

    // Both columns are forced to the same height so the bottom of the map and
    // the bottom of the form card land on the same line. The surplus height no
    // longer shows as dead white space because the message field inside the
    // form expands to take it (see _buildFormCard).
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 4, child: infoColumn),
          const SizedBox(width: 32),
          Expanded(flex: 6, child: formColumn),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _cardBorder),
      ),
      child: Column(
        children: [
          _InfoRow(
            icon: Icons.call_outlined,
            label: "TELEFOON",
            content: const Text("053 - 477 77 86", style: _infoValueStyle),
          ),
          _InfoRow(
            icon: Icons.mail_outline,
            label: "E-MAIL",
            content: const Text("info@odontium.nl", style: _infoValueStyle),
          ),
          _InfoRow(
            icon: Icons.location_on_outlined,
            label: "ADRES",
            content: const Text("Kalimantanstraat 5, 7512 HL\nEnschede, Nederland", style: _infoValueStyle),
          ),
          _InfoRow(
            icon: Icons.access_time,
            label: "OPENINGSTIJDEN",
            showDivider: false,
            content: const Text(
              "Maandag t/m donderdag\n08:30 – 17:30\n\nVrijdag\n08:30 – 15:00",
              style: _infoValueStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMap() {
    final Completer<GoogleMapController> mapcontroller = Completer<GoogleMapController>();
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      // This ratio is the one knob for the whole two-column block. The info
      // column's height sets the row height (both columns are stretched to
      // match), and the form's other content is a fixed ~540px, so the Bericht
      // field gets whatever is left: shortening the map shortens the message
      // box by the same amount. At 1080p, 1.6 gives a ~366px map and a ~263px
      // message box; lower the ratio for a squarer map and a taller Bericht.
      child: AspectRatio(
        aspectRatio: 1.8,
        child: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(target: LatLng(52.211347463377884, 6.893192165738634), zoom: 19),
          onMapCreated: (GoogleMapController controller) {
            mapcontroller.complete(controller);
          },
        ),
      ),
    );
  }

  Widget _buildFormCard(bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Neem contact op",
            style: TextStyle(fontSize: AppFont.h3(context), fontWeight: FontWeight.bold, color: _darkTeal),
          ),
          const SizedBox(height: 20),
          _fieldRow(
            isMobile,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_fieldLabel("Naam"), TextField(decoration: _fieldDecoration("Uw naam"))],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _fieldLabel("Praktijk"),
                TextField(decoration: _fieldDecoration("Naam van uw praktijk")),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _fieldRow(
            isMobile,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _fieldLabelOptional("Functie", " (optioneel)"),
                TextField(decoration: _fieldDecoration("Bijv. praktijkeigenaar")),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _fieldLabel("Discipline"),
                DropdownButtonFormField<String>(
                  initialValue: _discipline,
                  decoration: _fieldDecoration(''),
                  items: _disciplines
                      .map((d) => DropdownMenuItem(value: d, child: Text(d, style: const TextStyle(fontSize: 13))))
                      .toList(),
                  onChanged: (value) => setState(() => _discipline = value ?? _discipline),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _fieldRow(
            isMobile,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _fieldLabel("E-mailadres"),
                TextField(decoration: _fieldDecoration("naam@praktijk.nl")),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _fieldLabel("Telefoonnummer"),
                TextField(decoration: _fieldDecoration("06 - 12345678")),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _fieldLabel("Bericht"),
          // On desktop the message box soaks up whatever height is left over,
          // which is what makes the form card end level with the map beside it.
          // A fixed line count could only ever approximate that.
          //
          // On mobile the card sits in a scrolling column with unbounded
          // height, where a flex child is illegal — so there it gets a fixed
          // size instead. minLines matters as well as maxLines: with maxLines
          // alone an empty field is just one line tall.
          if (isMobile)
            TextField(
              minLines: 6,
              maxLines: 10,
              textAlignVertical: TextAlignVertical.top,
              decoration: _fieldDecoration("Vertel ons waar u naar op zoek bent"),
            )
          else
            Expanded(
              child: TextField(
                expands: true,
                maxLines: null,
                minLines: null,
                textAlignVertical: TextAlignVertical.top,
                decoration: _fieldDecoration("Vertel ons waar u naar op zoek bent"),
              ),
            ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: HoverScale(
              scale: 1.02,
              child: PulseGlow(
                borderRadius: 10,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                  ),
                  child: const Text("Plan mijn Demo", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 12, color: _subtext, height: 1.5),
                children: [
                  const TextSpan(text: "Liever direct contact? Bel ons gerust via "),
                  const TextSpan(
                    text: "053 - 477 77 86",
                    style: TextStyle(color: _teal, fontWeight: FontWeight.w600),
                  ),
                  const TextSpan(text: ". We helpen u graag persoonlijk verder."),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportTeasers(bool isMobile) {
    final cards = [
      _SupportTeaserCard(
        icon: Icons.headset_mic_outlined,
        title: "Supportlijn",
        description: "Heeft u tijdens het werken een vraag? Bel ons rechtstreeks, dan denken we direct met u mee.",
        action: Text("053 - 477 77 86", style: TextStyle(fontSize: AppFont.h3(context), fontWeight: FontWeight.bold, color: _darkTeal)),
      ),
      _SupportTeaserCard(
        icon: Icons.download_outlined,
        title: "Download de TSE Support App",
        description: "Installeer de applicatie zodat wij snel en veilig met u kunnen meekijken.",
        action: _smallOutlineButton("Download de app", () => context.go('/support')),
      ),
      _SupportTeaserCard(
        icon: Icons.menu_book_outlined,
        title: "Handleiding",
        description: "Bekijk de stap-voor-stap uitleg voor het installeren en gebruiken van de app.",
        action: _smallOutlineButton("Bekijk de brochure", () => context.go('/support')),
      ),
    ];

    if (isMobile) {
      return Column(
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            if (i != 0) const SizedBox(height: 20),
            cards[i],
          ],
        ],
      );
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            if (i != 0) const SizedBox(width: 24),
            Expanded(child: cards[i]),
          ],
        ],
      ),
    );
  }

  Widget _smallOutlineButton(String label, VoidCallback onPressed) {
    return Align(
      alignment: Alignment.centerLeft,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: _darkTeal,
          side: const BorderSide(color: Color(0xFFCBD5D8)),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget content;
  final bool showDivider;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.content,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF3F4),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Icon(icon, size: 18, color: _darkTeal),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: _subtext,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    content,
                  ],
                ),
              ),
            ],
          ),
        ),
        if (showDivider) const Divider(height: 1, color: Color(0xFFE7ECEE)),
      ],
    );
  }
}

class _SupportTeaserCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Widget action;

  const _SupportTeaserCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return HoverLift(
      lift: 5,
      borderRadius: 16,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _cardBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Wiggle(
              interval: const Duration(seconds: 7),
              child: Icon(icon, size: 26, color: _darkTeal),
            ),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: _darkTeal)),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 13, color: _subtext, height: 1.5)),
            const SizedBox(height: 16),
            action,
          ],
        ),
      ),
    );
  }
}
