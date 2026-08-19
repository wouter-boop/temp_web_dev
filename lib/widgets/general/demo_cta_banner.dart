import 'package:flutter/material.dart';
import 'type_scale.dart';
import 'package:go_router/go_router.dart';

import 'block_container.dart';
import 'micro_animations.dart';
import 'responsive.dart';
import 'reveal_on_scroll.dart';

class DemoCtaBanner extends StatelessWidget {
  final String heading;
  final String description;
  final VoidCallback? onDemoPressed;
  final Widget? secondaryAction;

  const DemoCtaBanner({
    super.key,
    required this.heading,
    required this.description,
    this.onDemoPressed,
    this.secondaryAction,
  });

  @override
  Widget build(BuildContext context) {
    return BlockContainer(
      padding: EdgeInsets.zero,
      hasHorizontalPadding: false,
      screenWidthFactor: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Scales with the available width so the banner keeps sensible
          // proportions from a 1080p viewport up through 4K, instead of
          // rendering frame.png at its native pixel size.
          final mobile = isMobile(context);
          final height = (constraints.maxWidth * (mobile ? 0.55 : 0.28)).clamp(mobile ? 320.0 : 420.0, 620.0);
          return SizedBox(
            width: double.infinity,
            height: height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset("lib/assets/frame.png", fit: BoxFit.cover),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 24),
                  child: RevealOnScroll(
                    offset: const Offset(0, 24),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        heading,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: AppFont.h2(context),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 750),
                        child: Text(
                          description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mobile ? 15 : 20,
                            fontWeight: FontWeight.w100,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: mobile ? 32 : 64),
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 16,
                        runSpacing: 12,
                        children: [
                          HoverScale(
                            scale: 1.06,
                            child: Wiggle(
                              angle: 0.02,
                              interval: const Duration(seconds: 7),
                              child: PulseGlow(
                                color: Colors.white,
                                borderRadius: 30,
                                child: ElevatedButton(
                                  onPressed: onDemoPressed ?? () => context.go('/contact'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: const Color.fromRGBO(37, 106, 130, 1),
                                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    elevation: 0,
                                  ),
                                  child: const Text('Plan een Demo', style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                          ?secondaryAction,
                        ],
                      ),
                    ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
