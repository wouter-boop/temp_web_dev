import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'block_container.dart';
import 'content_container.dart';
import 'micro_animations.dart';
import 'responsive.dart';

class WebsiteFooter extends StatelessWidget {
  const WebsiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mobile = isMobile(context);
    final compact = mobile || isTablet(context);

    final columns = [
      _CompanyInfo(theme: theme),
      _QuickLinks(theme: theme),
      _ContactInfo(theme: theme),
      _Certificates(theme: theme),
    ];

    return BlockContainer(
      backgroundColor: const Color(0xFF474747),
      padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 48, vertical: mobile ? 40 : 64),
      screenWidthFactor: 1,
      // Shares the site-wide content column so the footer's columns line up
      // with the content above it instead of running wider on 4K.
      child: ContentContainer(
        child: Column(
        children: [
          compact
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < columns.length; i++) ...[
                      if (i != 0) const SizedBox(height: 32),
                      columns[i],
                    ],
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: columns[0]),
                    const SizedBox(width: 60),
                    Expanded(flex: 2, child: columns[1]),
                    const SizedBox(width: 60),
                    Expanded(flex: 2, child: columns[2]),
                    const SizedBox(width: 60),
                    Expanded(flex: 3, child: columns[3]),
                  ],
                ),

          SizedBox(height: mobile ? 32 : 48),

          Divider(color: Colors.white.withValues(alpha: .15)),

          const SizedBox(height: 24),

          mobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "© 2026 TSE B.V. Alle rechten voorbehouden.",
                      style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      children: [
                        TextButton(onPressed: () {}, child: const Text("Privacy Policy")),
                        TextButton(onPressed: () {}, child: const Text("Cookies")),
                        TextButton(onPressed: () {}, child: const Text("Terms")),
                      ],
                    ),
                  ],
                )
              : Row(
                  children: [
                    const Text(
                      "© 2026 TSE B.V. Alle rechten voorbehouden.",
                      style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(onPressed: () {}, child: const Text("Privacy Policy")),
                    TextButton(onPressed: () {}, child: const Text("Cookies")),
                    TextButton(onPressed: () {}, child: const Text("Terms")),
                  ],
                ),
        ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

/// Footer text link: white70 that brightens (and slides slightly right) on
/// hover, navigating via go_router or launching an external/mailto/tel URI.
class _FooterLink extends StatefulWidget {
  const _FooterLink({required this.text, this.route, this.uri});

  final String text;
  final String? route;
  final Uri? uri;

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        child: GestureDetector(
          onTap: () {
            if (widget.route != null) {
              context.go(widget.route!);
            } else if (widget.uri != null) {
              launchUrl(widget.uri!);
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: EdgeInsets.only(left: _hovering ? 4 : 0),
            child: Text(
              widget.text,
              style: TextStyle(color: _hovering ? Colors.white : Colors.white70),
            ),
          ),
        ),
      ),
    );
  }
}

class _CompanyInfo extends StatelessWidget {
  const _CompanyInfo({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("lib/assets/TSE_LOGO_WIDE.png", height: 140),

        const SizedBox(height: 20),
      ],
    );
  }
}

class _QuickLinks extends StatelessWidget {
  const _QuickLinks({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle("Quick Links"),
        SizedBox(height: 18),

        _FooterLink(text: "Home", route: '/home'),
        _FooterLink(text: "Odontium", route: '/Odontium'),
        _FooterLink(text: "Disciplines", route: '/disciplines'),
        _FooterLink(text: "Overstappen", route: '/overstappen'),
        _FooterLink(text: "Over Ons", route: '/over_ons'),
        _FooterLink(text: "Contact", route: '/contact'),
        _FooterLink(text: "Support", route: '/support'),
        _FooterLink(text: "Veelgestelde vragen", route: '/veelgestelde-vragen'),
      ],
    );
  }
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle("Contact"),

        const SizedBox(height: 18),

        _FooterLink(text: "info@odontium.nl", uri: Uri.parse('mailto:info@odontium.nl')),

        _FooterLink(text: "+31 053 477 7786", uri: Uri.parse('tel:+31534777786')),

        const Text(
          "Kalimantanstraat 5 \n7512 HL \nEnschede",
          style: TextStyle(color: Colors.white70, height: 1.5),
        ),
      ],
    );
  }
}

class _Certificates extends StatelessWidget {
  const _Certificates({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle("Certified"),

        const SizedBox(height: 20),

        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            HoverScale(scale: 1.1, child: Image.asset("lib/assets/Kiwa_ISO_9001_NL-Resize.png", height: 60)),
            HoverScale(scale: 1.1, child: Image.asset("lib/assets/Kiwa_ISO_27001_NL-Resize.png", height: 60)),
            HoverScale(scale: 1.1, child: Image.asset("lib/assets/Kiwa_NEN_7510_NL-Resize.png", height: 60)),
          ],
        ),

        const SizedBox(height: 18),

        const Text(
          "Door KIWA gecertificeerd voor informatiebeveiliging en kwaliteitmanagement.",
          style: TextStyle(color: Colors.white70, height: 1.5),
        ),
      ],
    );
  }
}
