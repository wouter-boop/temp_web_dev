import 'package:Odontium/widgets/general/download.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Flutter web uses hash routing, so the page URL carries the route in the
  // fragment. The download URL must not inherit it.
  final onSupportRoute = Uri.parse('http://localhost:52127/#/support');

  test('drops the current route fragment', () {
    final url = downloadUrlFor('installer.exe', base: onSupportRoute);
    expect(url.fragment, isEmpty);
    expect(url.toString(), 'http://localhost:52127/downloads/installer.exe');
  });

  test('percent-encodes spaces in the file name', () {
    final url = downloadUrlFor('TSE Support.exe', base: onSupportRoute);
    expect(url.toString(), 'http://localhost:52127/downloads/TSE%20Support.exe');
    // pathSegments are decoded, and are what the server looks for on disk.
    expect(url.pathSegments, ['downloads', 'TSE Support.exe']);
  });

  test('is route-independent and keeps host and port', () {
    for (final route in ['#/home', '#/support', '#/product/beveiliging', '']) {
      final url = downloadUrlFor('TSE Support.exe',
          base: Uri.parse('https://odontium.nl/$route'));
      expect(url.toString(), 'https://odontium.nl/downloads/TSE%20Support.exe',
          reason: 'route "$route" must not affect the download URL');
    }
  });
}
