import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Odontium/widgets/general/custom_web_header.dart';

class CustomRouter extends StatelessWidget {
  final Widget child;

  const CustomRouter({super.key, required this.child});

  // Hoofdroutes gekoppeld aan de navigatie-index
  static const List<String> _hoofdRoutes = [
    '/home',
    '/Odontium',
    '/disciplines',
    '/overstappen',
    '/over_ons',
    '/contact',
    '/demo',
    '/support',
  ];

  static const Map<int, List<String>> _subRouteMaps = {
    1: ['/Odontium/overzicht', '/Odontium/slimme-functies', '/Odontium/beveiliging', '/Odontium/integraties', '/Odontium/mobiele_apps'],
    2: ['/disciplines/algemeen', '/disciplines/orthodontie', '/disciplines/implantaten', '/disciplines/kindertandheelkunde'],
    4: ['/over_ons', '/over_ons/klantverhalen', '/veelgestelde-vragen'],
    7: ['/support/documentatie', '/support/helpcenter', '/support/status'],
  };

  /// Every URL prefix a nav section owns.
  ///
  /// A section can span more than one prefix, so one entry per index is not
  /// enough: Product's landing page is '/Odontium' while its sub-pages are
  /// '/over_ons' and '/veelgestelde-vragen' are one section, for instance.
  /// Matching only a section's landing route meant '/veelgestelde-vragen'
  /// fell through to Home, so the Over Ons dropdown never marked it active.
  ///
  /// Keep in sync with [_hoofdRoutes], which supplies the click target for
  /// each index; this map only decides which section a location belongs to.
  static const Map<int, List<String>> _sectiePrefixen = {
    0: ['/home'],
    1: ['/Odontium'],
    2: ['/disciplines'],
    3: ['/overstappen'],
    4: ['/over_ons', '/veelgestelde-vragen'],
    5: ['/contact'],
    6: ['/demo'],
    7: ['/support'],
  };

  /// Locations that render the same page as a sub-route, so the dropdown
  /// item still lights up when you land on the bare parent route.
  static const Map<String, String> _routeAliassen = {
    '/Odontium': '/Odontium/overzicht',
    '/over_ons/veelgestelde_vragen': '/veelgestelde-vragen',
  };

  /// Which nav section the current location sits in. The longest matching
  /// prefix wins, so a more specific prefix is never shadowed by a shorter one
  /// belonging to another section.
  int _berekenGeselecteerdeIndex(BuildContext context) {
    final String locatie = GoRouterState.of(context).uri.toString();

    var beste = 0;
    var besteLengte = 0;
    _sectiePrefixen.forEach((index, prefixen) {
      for (final prefix in prefixen) {
        if (locatie.startsWith(prefix) && prefix.length > besteLengte) {
          beste = index;
          besteLengte = prefix.length;
        }
      }
    });
    return beste;
  }

  /// Which dropdown item under [hoofdIndex] the current location belongs to,
  /// or null when none does. An exact match always wins; otherwise the
  /// longest matching prefix does, so '/over_ons/klantverhalen' isn't
  /// claimed by the shorter '/over_ons' entry.
  int? _berekenSubIndex(BuildContext context, int hoofdIndex) {
    final subRoutes = _subRouteMaps[hoofdIndex];
    if (subRoutes == null) return null;

    var locatie = GoRouterState.of(context).uri.toString();
    locatie = _routeAliassen[locatie] ?? locatie;

    int? beste;
    var besteLengte = 0;
    for (var i = 0; i < subRoutes.length; i++) {
      final route = subRoutes[i];
      if (locatie == route) return i;
      if (locatie.startsWith(route) && route.length > besteLengte) {
        beste = i;
        besteLengte = route.length;
      }
    }
    return beste;
  }

  void _opItemGeklikt(int index, int? subIndex, BuildContext context) {
    if (subIndex != null && _subRouteMaps.containsKey(index)) {
      final subRoutes = _subRouteMaps[index]!;
      if (subIndex >= 0 && subIndex < subRoutes.length) {
        context.go(subRoutes[subIndex]);
        return;
      }
    }

    if (index >= 0 && index < _hoofdRoutes.length) {
      context.go(_hoofdRoutes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final int geselecteerdeIndex = _berekenGeselecteerdeIndex(context);
    final int? geselecteerdeSubIndex = _berekenSubIndex(context, geselecteerdeIndex);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          child,
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomWebHeader(
              selectedIndex: geselecteerdeIndex,
              selectedSubIndex: geselecteerdeSubIndex,
              onDestinationSelected: (index, {subIndex}) {
                _opItemGeklikt(index, subIndex, context);
              },
            ),
          ),
        ],
      ),
    );
  }
}