import 'package:Odontium/widgets/general/section_edges.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('reads the flag from an ordinary query string', () {
    expect(readSoftEdgeSetting(Uri.parse('https://odontium.nl/?blur=1#/over_ons')), isTrue);
    expect(readSoftEdgeSetting(Uri.parse('https://odontium.nl/?blur=0#/over_ons')), isFalse);
  });

  test('also reads it from inside the hash-routed fragment', () {
    expect(readSoftEdgeSetting(Uri.parse('https://odontium.nl/#/over_ons?blur=1')), isTrue);
    expect(readSoftEdgeSetting(Uri.parse('https://odontium.nl/#/over_ons?blur=off')), isFalse);
  });

  test('accepts the usual spellings, case-insensitively', () {
    for (final on in ['1', 'true', 'TRUE', 'on', 'On', 'yes']) {
      expect(readSoftEdgeSetting(Uri.parse('https://x/?blur=$on')), isTrue, reason: on);
    }
    for (final off in ['0', 'false', 'FALSE', 'off', 'no']) {
      expect(readSoftEdgeSetting(Uri.parse('https://x/?blur=$off')), isFalse, reason: off);
    }
  });

  test('falls back to the default when absent or unparseable', () {
    expect(readSoftEdgeSetting(Uri.parse('https://odontium.nl/#/over_ons')), isNull);
    expect(readSoftEdgeSetting(Uri.parse('https://odontium.nl/')), isNull);
    expect(readSoftEdgeSetting(Uri.parse('https://odontium.nl/?blur=maybe')), isNull);
    expect(readSoftEdgeSetting(Uri.parse('https://odontium.nl/?other=1')), isNull);
  });

  test('defaults to off, so the feather is not drawn unless asked for', () {
    expect(softSectionEdges.value, isFalse);
  });
}
