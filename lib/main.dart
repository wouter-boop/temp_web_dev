import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:odontium_website/pages/home_page.dart';
import 'package:odontium_website/pages/not_found_page.dart';
import 'package:odontium_website/pages/product_page.dart';
import 'package:odontium_website/pages/settings_page.dart';
import 'package:odontium_website/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'connections/grpc_client.dart';
import 'i18n/strings.g.dart';

CustomTransitionPage<void> _slowPageTransition({
  required LocalKey key,
  required Widget child,
  Duration duration = const Duration(milliseconds: 50), // Adjust speed here
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
          path: '/product',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const ProductPage(),
          ),
        ),
        GoRoute(
          path: '/product/odontium-overzicht',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const ProductPage(),
          ),
        ),
        GoRoute(
          path: '/product/unieke-features',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const ProductPage(),
          ),
        ),
        GoRoute(
          path: '/disciplines',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const SettingsPage(),
          ),
        ),
        GoRoute(
          path: '/overstappen',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const SettingsPage(),
          ),
        ),
        GoRoute(
          path: '/over_ons',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const SettingsPage(),
          ),
        ),
        GoRoute(
          path: '/contact',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const SettingsPage(),
          ),
        ),
        GoRoute(
          path: '/demo',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const SettingsPage(),
          ),
        ),
        GoRoute(
          path: '/support',
          pageBuilder: (context, state) => _slowPageTransition(
            key: state.pageKey,
            child: const SettingsPage(),
          ),
        ),
      ],
    ),
  ],
);

void main() async {
  final grpcClient = AgendaGrpcClient.init(host: '127.0.0.1', port: 50051);
  await grpcClient.warmUpConnection();
  WidgetsFlutterBinding.ensureInitialized();
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
        //useMaterial3: true,
        textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Segoe UI'),
      ),
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
