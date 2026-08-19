import 'package:Odontium/widgets/general/content_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Measures the width [ContentContainer] gives its child at a given viewport.
Future<double> measure(WidgetTester tester, Size screen) async {
  tester.view.physicalSize = screen;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  final key = GlobalKey();
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: ContentContainer(
          child: Container(key: key, height: 10),
        ),
      ),
    ),
  );
  return tester.getSize(find.byKey(key)).width;
}

void main() {
  testWidgets('desktop widths are 78% of viewport, capped at 1760', (tester) async {
    // 1080p: 78% of 1920 = 1497.6, under the cap.
    expect(await measure(tester, const Size(1920, 1080)), closeTo(1497.6, 0.1));

    // 1440p: 78% of 2560 = 1996.8, so the 1760 cap binds (~69% of viewport).
    expect(await measure(tester, const Size(2560, 1440)), 1760);

    // 4K: capped as well (~46% of viewport), keeping line lengths readable.
    expect(await measure(tester, const Size(3840, 2160)), 1760);

    // Just above the desktop breakpoint the factor still applies.
    expect(await measure(tester, const Size(1280, 800)), closeTo(998.4, 0.1));
  });

  testWidgets('below the desktop breakpoint it fills the available width', (tester) async {
    // Tablet and mobile fill their parent; the section's own padding supplies
    // the gutter, so content is never squeezed to a fraction of a small screen.
    expect(await measure(tester, const Size(800, 1000)), 800);
    expect(await measure(tester, const Size(375, 812)), 375);
  });

  testWidgets('contentWidthFactor matches ContentContainer width', (tester) async {
    for (final screen in const [Size(1920, 1080), Size(2560, 1440), Size(3840, 2160)]) {
      tester.view.physicalSize = screen;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      late double factor;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              factor = contentWidthFactor(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(screen.width * factor, closeTo(await measure(tester, screen), 0.1),
          reason: 'factor should reproduce the shell width at ${screen.width}px');
    }
  });
}
