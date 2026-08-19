import 'package:Odontium/widgets/general/content_container.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('default (no extra inset)', () {
    test('mobile fills the width the section gutters leave', () {
      // 375px phone, minus BlockContainer's 20px gutters.
      final m = contentColumnMetrics(available: 335, limit: double.infinity, padding: 0);
      expect(m.inset, 0);
      expect(m.width, 335);
    });

    test('desktop is capped by the column limit', () {
      final m = contentColumnMetrics(available: 1824, limit: 1497.6, padding: 0);
      expect(m.width, closeTo(1497.6, 0.1));
    });
  });

  group('a large inset degrades instead of collapsing the column', () {
    test('a 400px inset cannot erase a phone-width column', () {
      final m = contentColumnMetrics(available: 335, limit: double.infinity, padding: 400);
      // Would have been 335 - 800 = negative, i.e. the 10px-column bug.
      expect(m.width, greaterThanOrEqualTo(kMinContentWidth));
      expect(m.inset, lessThan(400));
      expect(m.width, kMinContentWidth);
    });

    test('never yields a negative or zero width at any narrow size', () {
      for (final available in [200.0, 280.0, 335.0, 500.0, 900.0]) {
        for (final padding in [0.0, 24.0, 400.0, 5000.0]) {
          final m = contentColumnMetrics(
              available: available, limit: double.infinity, padding: padding);
          expect(m.width, greaterThan(0),
              reason: 'available=$available padding=$padding');
          expect(m.inset * 2 + m.width, lessThanOrEqualTo(available + 0.01),
              reason: 'must fit: available=$available padding=$padding');
        }
      }
    });

    test('a modest inset is honoured where there is room', () {
      final m = contentColumnMetrics(available: 1824, limit: 1497.6, padding: 24);
      expect(m.inset, 24);
      expect(m.width, closeTo(1497.6, 0.1));
    });
  });
}
