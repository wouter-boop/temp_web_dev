import 'package:flutter/foundation.dart';

/// Whether [BlockContainer] paints its soft edge feather — the short gradient
/// that blends a coloured section into the background colour of the section
/// above or below it, instead of the two meeting on a hard horizontal line.
///
/// Currently **off** by default. The `softTopEdge` / `softBottomEdge` arguments
/// are left in place at every call site, so they still declare *which* colour a
/// section would blend into; this switch only decides whether that blend is
/// drawn. Flipping it back on restores the previous look exactly, with no other
/// edits.
///
/// Three ways to turn it on, in order of convenience:
///
///  1. **By URL** (works in release too, so it is shareable):
///     `https://odontium.nl/?blur=1#/over_ons` — hand a designer that link and
///     `?blur=0` for the comparison. Accepted either before the `#` or inside
///     it, since Flutter web keeps the route in the fragment.
///  2. **At runtime**: `softSectionEdges.value = true;` — every section listens,
///     so the page restyles immediately without a reload.
///  3. **As the new default**: change [_defaultEnabled] below.
final ValueNotifier<bool> softSectionEdges =
    ValueNotifier<bool>(_readInitialSetting());

/// What to use when the URL says nothing. Set to `true` to make the feathered
/// edges the site's normal appearance again.
const bool _defaultEnabled = false;

/// Query parameter that overrides [_defaultEnabled]: `1`/`true`/`on` enables,
/// `0`/`false`/`off` disables.
const String _queryFlag = 'blur';

bool _readInitialSetting() => readSoftEdgeSetting(Uri.base) ?? _defaultEnabled;

/// Extracts the override from [url], or null when it is not present.
///
/// Checks the ordinary query string first, then the query inside the fragment,
/// because hash routing means the visitor may well be on
/// `…/#/over_ons?blur=1` rather than `…/?blur=1#/over_ons`.
@visibleForTesting
bool? readSoftEdgeSetting(Uri url) {
  var raw = url.queryParameters[_queryFlag];

  if (raw == null && url.fragment.isNotEmpty) {
    raw = Uri.tryParse(url.fragment)?.queryParameters[_queryFlag];
  }
  if (raw == null) return null;

  switch (raw.toLowerCase()) {
    case '1':
    case 'true':
    case 'on':
    case 'yes':
      return true;
    case '0':
    case 'false':
    case 'off':
    case 'no':
      return false;
    default:
      return null;
  }
}
