import 'package:url_launcher/url_launcher.dart';

/// Folder, relative to the site root, that downloadable files are served from.
///
/// These are plain static files served alongside the built site, *not* Flutter
/// assets: put them in the project's `web/downloads/` folder and Flutter copies
/// them verbatim into `build/web/downloads/` at build time, which is what ends
/// up in the server's wwwroot.
const String kDownloadsFolder = 'downloads';

/// Absolute URL for a file in [kDownloadsFolder], resolved against [base]
/// (defaults to the current page).
///
/// Uses [Uri.resolve] deliberately: it percent-encodes the file name — so names
/// containing spaces such as `TSE Support.exe` work — and, being a root-relative
/// reference, it drops the current route's fragment. `Uri.replace` would instead
/// carry `#/support` over into the download URL, which makes the server miss the
/// file and serve the SPA fallback (the app then reboots at its initial route).
Uri downloadUrlFor(String fileName, {Uri? base}) {
  return (base ?? Uri.base).resolve('/$kDownloadsFolder/$fileName');
}

/// Starts a browser download of a file in [kDownloadsFolder].
///
/// Opened with `_self` so the download starts in place rather than flashing an
/// empty tab; because installers are served as `application/octet-stream` the
/// page itself does not navigate away.
Future<bool> startDownload(String fileName) {
  return launchUrl(downloadUrlFor(fileName), webOnlyWindowName: '_self');
}
