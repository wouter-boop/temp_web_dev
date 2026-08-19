import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Odontium/pages/beveiliging_page.dart';
import 'package:Odontium/pages/contact_page.dart';
import 'package:Odontium/pages/disciplines_page.dart';
import 'package:Odontium/pages/home_page.dart';
import 'package:Odontium/pages/integraties_page.dart';
import 'package:Odontium/pages/klant_verhalen_page.dart';
import 'package:Odontium/pages/mobiele_apps_page.dart';
import 'package:Odontium/pages/not_found_page.dart';
import 'package:Odontium/pages/over_ons_page.dart';
import 'package:Odontium/pages/overstappen_page.dart';
import 'package:Odontium/pages/product_page.dart';
import 'package:Odontium/pages/slimme_functies_page.dart';
import 'package:Odontium/pages/support_page.dart';
import 'package:Odontium/pages/veelgestelde_vragen_page.dart';
import 'package:Odontium/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'connections/grpc_client.dart';
import 'i18n/strings.g.dart';
import 'widgets/general/type_scale.dart';

CustomTransitionPage<void> _slowPageTransition({
  required LocalKey key,
  required Widget child,
  Duration duration = const Duration(milliseconds: 250), // Adjust speed here
}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        child: child,
      );
    },
  );
}

final GoRouter _router = GoRouter(
  errorPageBuilder: (context, state) =>
      _slowPageTransition(key: state.pageKey, child: const NotFoundPage()),
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return CustomRouter(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              _slowPageTransition(key: state.pageKey, child: HomePage()),
        ),
        GoRoute(
          path: '/Odontium',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const ProductPage(),
          ),
        ),
        GoRoute(
          path: '/Odontium/overzicht',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const ProductPage(),
          ),
        ),
        GoRoute(
          path: '/Odontium/slimme-functies',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const SlimmeFunctiesPage(),
          ),
        ),
        GoRoute(
          path: '/Odontium/beveiliging',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const BeveiligingPage(),
          ),
        ),
        GoRoute(
          path: '/Odontium/integraties',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const IntegratiesPage(),
          ),
        ),
        GoRoute(
          path: '/Odontium/mobiele_apps',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const MobieleAppsPage(),
          ),
        ),
        GoRoute(
          path: '/disciplines',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const DisciplinesPage(),
          ),
        ),
        GoRoute(
          path: '/overstappen',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const OverstappenPage(),
          ),
        ),
        GoRoute(
          path: '/over_ons',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const OverOnsPage(),
          ),
        ),
        GoRoute(
          path: '/over_ons/klantverhalen',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const KlantVerhalenPage(),
          ),
        ),
        GoRoute(
          path: '/over_ons/veelgestelde_vragen',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const VeelgesteldeVragenPage(),
          ),
        ),
        GoRoute(
          path: '/contact',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const ContactPage(),
          ),
        ),
        GoRoute(
          path: '/demo',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const ContactPage(),
          ),
        ),
        GoRoute(
          path: '/support',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const SupportPage(),
          ),
        ),
        GoRoute(
          path: '/veelgestelde-vragen',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const VeelgesteldeVragenPage(),
          ),
        ),
      ],
    ),
  ],
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Warm up in the background: awaiting this held the first paint hostage
  // for up to 2 seconds whenever the gRPC backend wasn't reachable.
  AgendaGrpcClient.init(host: '127.0.0.1', port: 50051).warmUpConnection();
  LocaleSettings.useDeviceLocale();
  runApp(TranslationProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: TranslationProvider.of(context).flutterLocale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('nl', 'NL'), Locale('en', 'US')],
      title: 'Odontium',

      debugShowCheckedModeBanner: false,
      //locale: TranslationProvider.of(context).flutterLocale,
      theme: ThemeData(
        fontFamily: "Segoe UI",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      // Grows the whole type scale from the authored 1080p sizes up to the
      // 4K design spec. Wrapping at the MaterialApp level covers popups and
      // dialogs too, not just the routed pages.
      builder: (context, child) => FluidTypeScale(child: child ?? const SizedBox.shrink()),
      routerConfig: _router,
    );
  }
}

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Analytics Content Area', style: TextStyle(fontSize: 22)),
    );
  }
}
