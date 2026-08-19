import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../general/micro_animations.dart';
import '../general/responsive.dart';
import '../general/reveal_on_scroll.dart';

class SidekickHero extends StatelessWidget {
  const SidekickHero({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mobile = isMobile(context);

    return Padding(
      // The old fixed 72px side padding ate most of a phone's width.
      padding: EdgeInsets.symmetric(horizontal: mobile ? 16 : 72, vertical: mobile ? 32 : 56),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: RevealOnScroll(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("lib/assets/Odontium.png", width: 72),
              Text(
                "Odontium",
                textAlign: TextAlign.center,
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF083844),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Odontium is de complete praktijksoftware voor de moderne mondzorg.",
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF083844),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                "Met één gebruiksvriendelijk platform beheert u afspraken, patiëntendossiers, behandelingen, declaraties en communicatie. Dankzij verschillende werkomgevingen sluit Odontium naadloos aan op de dagelijkse processen van iedere discipline.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.black87,
                  height: 1.65,
                ),
              ),
              const SizedBox(height: 32),
              // Wrap instead of Row so the two buttons stack on narrow screens
              // instead of overflowing.
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 12,
                children: [
                  HoverScale(
                    child: PulseGlow(
                      color: const Color(0xFF11B8BE),
                      borderRadius: 30,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFF11B8BE),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 18,
                          ),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () => context.go('/contact'),
                        child: const Text("Plan een Demo"),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF083844),
                      side: const BorderSide(color: Color(0xFF083844)),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 18,
                      ),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () => context.go('/Odontium/slimme-functies'),
                    child: const Text("Bekijk de functionaliteiten"),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Image.asset(
                "lib/assets/scherm_odontium.png",
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
