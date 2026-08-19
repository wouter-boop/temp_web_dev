import '../widgets/general/auto_scroll_view.dart';
import 'package:flutter/material.dart';
import '../widgets/general/type_scale.dart';
import '../widgets/general/content_container.dart';
import 'package:go_router/go_router.dart';
import 'package:Odontium/widgets/general/footer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/general/block_container.dart';
import '../widgets/general/demo_cta_banner.dart';
import '../widgets/general/micro_animations.dart';
import '../widgets/general/responsive.dart';

const _darkTeal = Color(0xFF0F3B3F);
const _teal = Color(0xFF17A8A6);
const _subtext = Color(0xFF616161);

class MobieleAppsPage extends StatelessWidget {
  const MobieleAppsPage({super.key});

  static const List<_AppShowcase> _showcases = [
    _AppShowcase(
      badgeLabel: "ODONTIUM APP",
      badgeIcon: Icons.diamond_outlined,
      accentColor: Color(0xFFB9E0EA),
      title: "Blijf verbonden met uw team",
      description:
          "Communiceer eenvoudig met collega's, ontvang taken en reminders en blijf op de hoogte "
          "van belangrijke meldingen.",
      bullets: ["Chat met collega's", "Taken bekijken", "Reminders ontvangen"],
      imagePath: "lib/assets/app_odontium_login.png",
      playUrl: "",
      appUrl: "",
      imageOnLeft: true,
    ),
    _AppShowcase(
      badgeLabel: "TSE Mobile",
      accentColor: _teal,
      title: "Altijd voorbereid, onderweg of thuis",
      description: "Bekijk onderweg of thuis uw agenda en patiëntgegevens zodat u altijd voorbereid bent.",
      bullets: ["Agenda altijd beschikbaar", "Patiëntgegevens raadplegen", "Direct contact opnemen"],
      imagePath: "lib/assets/tse_mobile.png",
      imageOnLeft: false,
      playUrl: "https://play.google.com/store/apps/details?id=com.TSE.Mobile&hl=nl",
      appUrl: "https://apps.apple.com/nl/app/tse-mobile/id1204833179",
    ),
    _AppShowcase(
      badgeLabel: "TSE Camera",
      accentColor: Color(0xFFB39DDB),
      title: "Foto's, direct op de juiste kaart",
      description:
          "Maak foto's met uw smartphone en upload ze direct via een QR-code naar de juiste "
          "patiëntenkaart in Odontium.",
      bullets: ["Direct uploaden", "Geen kabels nodig", "Altijd gekoppeld aan de juiste patiënt"],
      imagePath: "lib/assets/tse_camera.png",
      imageOnLeft: true,
      playUrl: "https://play.google.com/store/apps/details?id=com.TSE.Camera&hl=nl",
      appUrl: "https://apps.apple.com/nl/app/tse-camera/id1186675650",
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
              child: Column(
                children: [
                  Text(
                    "Eén softwareplatform.\nDrie slimme apps.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppFont.h1(context),
                      fontWeight: FontWeight.bold,
                      color: _darkTeal,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 650),
                    child: const Text(
                      "Met de mobiele apps van Odontium heeft u belangrijke informatie altijd bij de "
                      "hand. Bekijk uw agenda, communiceer met collega's, upload foto's en volg "
                      "werkstukken – waar u ook bent.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: _subtext, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => context.go('/contact'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 0,
                    ),
                    child: const Text("Plan een demo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  ),
                  const SizedBox(height: 28),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 24,
                    runSpacing: 12,
                    children: const [
                      _CheckBadge("Beschikbaar voor iOS"),
                      _CheckBadge("Beschikbaar voor Android"),
                      _CheckBadge("Veilig verbonden"),
                      _CheckBadge("Automatisch gesynchroniseerd"),
                    ],
                  ),
                ],
              ),
            ),
            BlockContainer(
              screenWidthFactor: 1,
              child: Center(
                child: ContentContainer(
                  child: Column(
                    children: [
                      for (var i = 0; i < _showcases.length; i++) ...[
                        if (i != 0) ...[
                          const SizedBox(height: 40),
                          const Divider(color: Color(0xFFE0E0E0)),
                          const SizedBox(height: 40),
                        ],
                        _AppShowcaseRow(data: _showcases[i]),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            const DemoCtaBanner(
              heading: "Ontdek wat Odontium\nmobiel voor u kan doen",
              description:
                  "Plan een persoonlijke demonstratie en ervaar hoe onze mobiele apps uw dagelijkse "
                  "werkzaamheden nog eenvoudiger maken.",
            ),
            WebsiteFooter()
          ],
        ),
      ),
    );
  }
}

class _CheckBadge extends StatelessWidget {
  final String label;

  const _CheckBadge(this.label);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(color: _teal, borderRadius: BorderRadius.circular(5)),
          child: const Icon(Icons.check, size: 12, color: Colors.white),
        ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: _darkTeal)),
      ],
    );
  }
}

class _AppShowcase {
  final String badgeLabel;
  final IconData? badgeIcon;
  final Color accentColor;
  final String title;
  final String description;
  final List<String> bullets;
  final String imagePath;
  final bool imageOnLeft;
  final String playUrl;
  final String appUrl;

  const _AppShowcase({
    required this.badgeLabel,
    this.badgeIcon,
    required this.accentColor,
    required this.title,
    required this.description,
    required this.bullets,
    required this.imagePath,
    required this.imageOnLeft, required this.playUrl, required this.appUrl,

  });
}

class _AppShowcaseRow extends StatelessWidget {
  final _AppShowcase data;

  const _AppShowcaseRow({required this.data});

  @override
  Widget build(BuildContext context) {
    final phone = Floating(
      amplitude: 8,
      duration: const Duration(milliseconds: 3800),
      phase: data.imageOnLeft ? 0.0 : 0.5,
      child: _PhonePlaceholder(imagePath: data.imagePath, accentColor: data.accentColor),
    );
    final contentColumn = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(color: data.accentColor, borderRadius: BorderRadius.circular(8)),
                alignment: Alignment.center,
                child: data.badgeIcon != null
                    ? Icon(data.badgeIcon, size: 15, color: Colors.white)
                    : const Text(
                        "TSE",
                        style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
              ),
              const SizedBox(width: 8),
              Text(
                data.badgeLabel,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: _teal, letterSpacing: 0.5),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            data.title,
            style: TextStyle(fontSize: AppFont.h3(context), fontWeight: FontWeight.bold, color: _darkTeal),
          ),
          const SizedBox(height: 8),
          Text(
            data.description,
            style: const TextStyle(fontSize: 14, color: _subtext, height: 1.5),
          ),
          const SizedBox(height: 16),
          for (final bullet in data.bullets)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
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
          const SizedBox(height: 16),
          // Only render badges that actually have a store URL; the Odontium
          // app isn't published yet, so it gets a "coming soon" chip instead.
          if (data.playUrl.isEmpty && data.appUrl.isEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: _teal.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Binnenkort beschikbaar in de app stores",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: _darkTeal),
              ),
            )
          else
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                if (data.playUrl.isNotEmpty)
                  _StoreBadge(icon: Icons.play_arrow, line1: "Available on the", line2: "Google Play", url: data.playUrl),
                if (data.appUrl.isNotEmpty)
                  _StoreBadge(icon: Icons.phone_iphone, line1: "Download on the", line2: "App Store", url: data.appUrl),
              ],
            ),
        ],
      );

    if (isMobile(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          phone,
          const SizedBox(height: 24),
          contentColumn,
        ],
      );
    }

    final content = Expanded(child: contentColumn);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 128.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: data.imageOnLeft
            ? [phone, const SizedBox(width: 48), content]
            : [content, const SizedBox(width: 48), phone],
      ),
    );
  }
}

class _StoreBadge extends StatelessWidget {
  final IconData icon;
  final String line1;
  final String line2;
  final String url;

  const _StoreBadge({required this.icon, required this.line1, required this.line2, required this.url});

  @override
  Widget build(BuildContext context) {
    return HoverScale(
      scale: 1.07,
      child: InkWell(
      onTap: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFDADADA)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: _darkTeal),
            const SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(line1, style: const TextStyle(fontSize: 8, color: _subtext)),
                Text(line2, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: _darkTeal)),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}

class _PhonePlaceholder extends StatelessWidget {
  final String imagePath;
  final Color accentColor;

  const _PhonePlaceholder({required this.imagePath, required this.accentColor});

  @override
  Widget build(BuildContext context) {
    // Base size is tuned for desktop/4K (capped at maxWidth 900 by the
    // parent, so it never grows on ultra-wide screens); shrink proportionally
    // on mobile so the frame doesn't dominate a narrow, stacked layout.
    final width = responsiveValue(context, desktop: 220.0, mobile: 170.0);
    final scale = width / 220.0;
    final height = 320.0 * scale;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: 0.15,
            child: Container(
              width: 190 * scale,
              height: 190 * scale,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(32 * scale),
              ),
            ),
          ),
          // Image.asset does no clipping of its own, so the rounded corners
          // only ever existed on the errorBuilder placeholder below and
          // disappeared as soon as the real screenshots were added.
          //
          // Sized by *height* rather than width, for two reasons. The clip
          // needs the widget box to be exactly the painted bitmap: giving both
          // a width and a height with BoxFit.contain letterboxes the bitmap
          // inside a wider box, so the radius would round transparent margin
          // instead of the image. And at width 190 these render 421 and 343
          // tall against a 320 frame, so the Stack (which clips by default)
          // was already cropping their tops and bottoms.
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28 * scale),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.10),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28 * scale),
              child: Image.asset(
                imagePath,
                height: 300 * scale,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 180 * scale,
                  height: 300 * scale,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28 * scale),
                    border: Border.all(color: const Color(0xFFDADADA), width: 2),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.smartphone_outlined, size: 48 * scale, color: accentColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
