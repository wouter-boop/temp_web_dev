import 'package:flutter/material.dart';

import 'block_container.dart';


class WebsiteFooter extends StatelessWidget {
  const WebsiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlockContainer(
      backgroundColor: const Color(0xFF474747),
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 64),
      screenWidthFactor: 0.8,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: _CompanyInfo(theme: theme)),
              const SizedBox(width: 60),
              Expanded(flex: 2, child: _QuickLinks(theme: theme)),
              const SizedBox(width: 60),
              Expanded(flex: 2, child: _ContactInfo(theme: theme)),
              const SizedBox(width: 60),
              Expanded(flex: 3, child: _Certificates(theme: theme)),
            ],
          ),

          const SizedBox(height: 48),

          Divider(color: Colors.white.withValues(alpha: .15)),

          const SizedBox(height: 24),

          Row(
            children: [
              Text(
                "© 2026 Your Company Name. All rights reserved.",
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

class _CompanyInfo extends StatelessWidget {
  const _CompanyInfo({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/logo.png", height: 55),

        const SizedBox(height: 20),

        const Text(
          "Professional inspection, certification and engineering services with a strong focus on quality and safety.",
          style: TextStyle(color: Colors.white70, height: 1.6),
        ),
      ],
    );
  }
}

class _QuickLinks extends StatelessWidget {
  const _QuickLinks({required this.theme});

  final ThemeData theme;

  Widget link(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {},
        child: Text(text, style: const TextStyle(color: Colors.white70)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle("Quick Links"),
        const SizedBox(height: 18),

        link("Home"),
        link("Services"),
        link("Projects"),
        link("About"),
        link("Contact"),
      ],
    );
  }
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle("Contact"),

        SizedBox(height: 18),

        Text("info@company.com", style: TextStyle(color: Colors.white70)),

        SizedBox(height: 8),

        Text("+31 (0)123 456 789", style: TextStyle(color: Colors.white70)),

        SizedBox(height: 8),

        Text(
          "Street 1\n1234 AB City\nThe Netherlands",
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
            Image.asset("assets/certificates/kiwa_iso9001.png", height: 60),
            Image.asset("assets/certificates/kiwa_vca.png", height: 60),
            Image.asset("assets/certificates/kiwa_iso14001.png", height: 60),
          ],
        ),

        const SizedBox(height: 18),

        const Text(
          "Certified by KIWA for quality management and safety.",
          style: TextStyle(color: Colors.white70, height: 1.5),
        ),
      ],
    );
  }
}
