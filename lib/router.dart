import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:odontium_website/widgets/general/custom_web_header.dart';

class CustomRouter extends StatelessWidget {
  final Widget child;

  const CustomRouter({super.key, required this.child});

  // Hoofdroutes gekoppeld aan de navigatie-index
  static const List<String> _hoofdRoutes = [
    '/home',
    '/product',
    '/disciplines',
    '/overstappen',
    '/over_ons',
    '/contact',
    '/demo',
    '/support',
  ];

  static const Map<int, List<String>> _subRouteMaps = {
    1: ['/product/odontium-overzicht', '/product/slimme-functies', '/product/beveiliging', '/product/updates'],
    2: ['/disciplines/algemeen', '/disciplines/orthodontie', '/disciplines/implantaten', '/disciplines/kindertandheelkunde'],
    4: ['/over_ons/team', '/over_ons/vacatures', '/over_ons/pers'],
    7: ['/support/documentatie', '/support/helpcenter', '/support/status'],
  };

  int _berekenGeselecteerdeIndex(BuildContext context) {
    final String locatie = GoRouterState.of(context).uri.toString();

    for (int i = 0; i < _hoofdRoutes.length; i++) {
      if (locatie.startsWith(_hoofdRoutes[i])) {
        return i;
      }
    }
    return 0;
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