import 'package:Odontium/widgets/general/type_scale.dart';
import 'package:flutter_test/flutter_test.dart';

/// The design spec, and the sizes the widgets are authored at (the 1080p tier).
const _spec = {'H1': 64.0, 'H2': 50.0, 'H3': 30.0, 'Text 1': 25.0, 'Text 2': 20.0};
const _authored = {'H1': 52.0, 'H2': 40.0, 'H3': 24.0, 'Text 1': 20.0, 'Text 2': 16.0};

void main() {
  test('1080p and below renders the authored sizes unscaled', () {
    expect(typeScaleFactor(1920), 1.0);
    expect(typeScaleFactor(1440), 1.0);
    expect(typeScaleFactor(375), 1.0);
  });

  test('4K reaches the design spec', () {
    final factor = typeScaleFactor(3840);
    expect(factor, kTypeScaleMax);

    // Every role lands on its specified 4K size (H1 is 65 vs a specified 64,
    // the one rounding difference in the scale).
    for (final role in _spec.keys) {
      expect(_authored[role]! * factor, closeTo(_spec[role]!, 1.01),
          reason: '$role should reach ${_spec[role]} at 4K');
    }
  });

  test('between 1080p and 4K it ramps smoothly, and clamps beyond', () {
    // 1440p sits halfway, so roughly halfway up the ramp.
    expect(typeScaleFactor(2880), closeTo(1.125, 0.001));
    expect(16 * typeScaleFactor(2880), closeTo(18, 0.02));

    // Monotonic across the ramp.
    var previous = 0.0;
    for (var w = 1920.0; w <= 3840; w += 240) {
      final f = typeScaleFactor(w);
      expect(f, greaterThanOrEqualTo(previous));
      previous = f;
    }

    // Ultra-wide stays at the spec rather than growing without bound.
    expect(typeScaleFactor(5120), kTypeScaleMax);
    expect(typeScaleFactor(7680), kTypeScaleMax);
  });
}
