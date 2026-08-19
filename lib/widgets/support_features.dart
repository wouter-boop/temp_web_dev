import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'general/type_scale.dart';

import 'general/micro_animations.dart';

const _compactBreakpoint = 800.0;

/// Content for a single step in [OverstapSection]'s process timeline.
class OverstapStepData {
  final int number;
  final String title;
  final String description;

  const OverstapStepData({
    required this.number,
    required this.title,
    required this.description,
  });
}

/// Content for a single support-feature card in [OverstapSection].
class SupportFeatureData {
  final IconData icon;
  final String title;
  final String description;

  const SupportFeatureData({
    required this.icon,
    required this.title,
    required this.description,
  });
}

/// The "Samen zorgen we voor een soepele OVERSTAP" panel: heading, a 5-step
/// process timeline with connected diamond badges, a support sub-heading,
/// three feature cards and a CTA button. The timeline and card grid switch
/// to a stacked layout below [_compactBreakpoint].
class OverstapSection extends StatelessWidget {
  final VoidCallback? onOverstappenPressed;

  const OverstapSection({super.key, this.onOverstappenPressed});

  static const _steps = [
    OverstapStepData(
      number: 1,
      title: 'Gratis Demo',
      description:
          'Maak vrijblijvend kennis met Odontium. We laten zien hoe de software aansluit '
          'op uw praktijk en beantwoorden al uw vragen.',
    ),
    OverstapStepData(
      number: 2,
      title: 'Voorstel',
      description:
          'U ontvangt een voorstel dat past bij uw praktijk, met de keuze of cloud of '
          'lokale installatie en het gewenste aantal gebruikers.',
    ),
    OverstapStepData(
      number: 3,
      title: 'Datamigratie',
      description:
          'Wij zetten uw gegevens veilig en zorgvuldig over, zodat u snel verder kunt '
          'werken in uw nieuwe omgeving.',
    ),
    OverstapStepData(
      number: 4,
      title: 'Inrichten',
      description:
          'Samen richten we Odontium in zoals uw praktijk werkt. Tijdens de eerste '
          'periode staan wij klaar voor vragen en ondersteuning.',
    ),
    OverstapStepData(
      number: 5,
      title: 'Livegang',
      description:
          'Zodra alles klaarstaat kunt u live. Ook daarna blijft ons supportteam '
          'bereikbaar om u snel verder te helpen.',
    ),
  ];

  static const _supportFeatures = [
    SupportFeatureData(
      icon: Icons.call_outlined,
      title: 'Telefonische support',
      description:
          'Bel 053 - 477 77 86 en u krijgt direct iemand aan de lijn die u verder kan '
          'helpen — geen keuzemenu, geen wachtrij.',
    ),
    SupportFeatureData(
      icon: Icons.person_outline,
      title: 'Persoonlijke begeleiding',
      description:
          'Van implementatie tot dagelijks gebruik: wij begeleiden u persoonlijk en '
          'denken met u mee wanneer dat nodig is.',
    ),
    SupportFeatureData(
      icon: Icons.support_agent_outlined,
      title: 'Direct contact',
      description:
          'U hoeft geen tickets in te dienen of lang op een reactie te wachten. U krijgt '
          'direct contact met ons supportteam.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFDCEEF3), Colors.white],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text.rich (unlike RichText) inherits the theme's Segoe UI.
          Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: AppFont.h2(context),
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade900,
                height: 1.35,
              ),
              children: [
                const TextSpan(text: 'Samen zorgen we voor een\nsoepele '),
                TextSpan(
                  text: 'OVERSTAP',
                  style: TextStyle(color: Colors.teal.shade600),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              'Een nieuw softwaresysteem kiezen is een belangrijke stap. Daarom begeleiden wij u '
              'persoonlijk tijdens het hele traject – van de eerste demo tot de livegang en ook '
              'daarna. Zo kunt u met vertrouwen overstappen, zonder onnodige onderbrekingen in uw praktijk.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.blueGrey.shade700,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 48),
          // On mobile the 0.6 width factor left an unusably narrow column;
          // use the full available width there and only narrow on desktop.
          SizedBox(
            width: MediaQuery.of(context).size.width *
                (MediaQuery.of(context).size.width < _compactBreakpoint ? 1.0 : 0.6),
            child: _ProcessSteps(steps: _steps),
          ),
          const SizedBox(height: 56),
          Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: AppFont.h2(context),
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade900,
                height: 1.4,
              ),
              children: [
                const TextSpan(text: 'Tijdens iedere stap staat ons\n'),
                TextSpan(
                  text: 'supportteam',
                  style: TextStyle(color: Colors.teal.shade600),
                ),
                const TextSpan(text: ' voor u klaar.'),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          _SupportFeaturesGrid(features: _supportFeatures),
          const SizedBox(height: 32),
          HoverScale(
            child: OutlinedButton(
              onPressed: onOverstappenPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blueGrey.shade900,
                side: BorderSide(color: Colors.blueGrey.shade900),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Meer over overstappen',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProcessSteps extends StatelessWidget {
  final List<OverstapStepData> steps;

  const _ProcessSteps({required this.steps});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < _compactBreakpoint) {
          return Column(
            children: [
              for (var i = 0; i < steps.length; i++) ...[
                if (i != 0) const _VerticalDottedLine(),
                _VerticalStep(step: steps[i]),
              ],
            ],
          );
        }
        final columnWidth = constraints.maxWidth / steps.length;
        return Stack(
          children: [
            Positioned(
              top: 17,
              left: columnWidth / 2,
              right: columnWidth / 2,
              child: const _DottedLine(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final step in steps)
                  Expanded(
                    child: Column(
                      children: [
                        _StepBadge(number: step.number),
                        const SizedBox(height: 16),
                        Text(
                          step.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            step.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.5,
                              color: Colors.blueGrey.shade600,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _VerticalStep extends StatelessWidget {
  final OverstapStepData step;

  const _VerticalStep({required this.step});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StepBadge(number: step.number),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                step.title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                step.description,
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.blueGrey.shade600,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StepBadge extends StatelessWidget {
  final int number;

  const _StepBadge({required this.number});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: math.pi / 4,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.teal.shade300, Colors.teal.shade700],
          ),
        ),
        child: Center(
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Text(
              '$number',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DottedLine extends StatelessWidget {
  const _DottedLine();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2,
      child: CustomPaint(painter: _DottedLinePainter()),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.teal.shade200
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    const dashWidth = 5.0;
    const gapWidth = 5.0;
    final y = size.height / 2;
    var x = 0.0;
    while (x < size.width) {
      canvas.drawLine(Offset(x, y), Offset(x + dashWidth, y), paint);
      x += dashWidth + gapWidth;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _VerticalDottedLine extends StatelessWidget {
  const _VerticalDottedLine();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
      child: SizedBox(
        width: 2,
        height: 24,
        child: CustomPaint(painter: _VerticalDottedLinePainter()),
      ),
    );
  }
}

class _VerticalDottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.teal.shade200
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    const dashHeight = 5.0;
    const gapHeight = 5.0;
    final x = size.width / 2;
    var y = 0.0;
    while (y < size.height) {
      canvas.drawLine(Offset(x, y), Offset(x, y + dashHeight), paint);
      y += dashHeight + gapHeight;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SupportFeaturesGrid extends StatelessWidget {
  final List<SupportFeatureData> features;

  const _SupportFeaturesGrid({required this.features});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < _compactBreakpoint) {
          return Column(
            children: [
              for (var i = 0; i < features.length; i++) ...[
                if (i != 0) const SizedBox(height: 16),
                _SupportCard(data: features[i], fullWidth: true),
              ],
            ],
          );
        }
        return Wrap(
          spacing: 24,
          runSpacing: 24,
          alignment: WrapAlignment.center,
          children: [
            for (final feature in features) _SupportCard(data: feature),
          ],
        );
      },
    );
  }
}

class _SupportCard extends StatelessWidget {
  final SupportFeatureData data;
  final bool fullWidth;

  const _SupportCard({required this.data, this.fullWidth = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth ? double.infinity : 260,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.teal.shade100),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(data.icon, color: Colors.teal.shade600, size: 20),
          ),
          const SizedBox(height: 16),
          Text(
            data.title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.description,
            style: TextStyle(
              fontSize: 13,
              color: Colors.blueGrey.shade600,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
