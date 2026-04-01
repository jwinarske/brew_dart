import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'screens/brewfile_screen.dart';
import 'screens/catalog_screen.dart';
import 'screens/installed_screen.dart';
import 'screens/outdated_screen.dart';
import 'screens/services_screen.dart';
import 'screens/shell.dart';
import 'screens/taps_screen.dart';
import 'theme/app_theme.dart';

final _router = GoRouter(
  initialLocation: '/installed',
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/catalog',
          builder: (context, state) => const CatalogScreen(),
        ),
        GoRoute(
          path: '/catalog/casks',
          builder: (context, state) => const CatalogScreen(casksOnly: true),
        ),
        GoRoute(
          path: '/installed',
          builder: (context, state) => const InstalledScreen(),
        ),
        GoRoute(
          path: '/outdated',
          builder: (context, state) => const OutdatedScreen(),
        ),
        GoRoute(
          path: '/taps',
          builder: (context, state) => const TapsScreen(),
        ),
        GoRoute(
          path: '/services',
          builder: (context, state) => const ServicesScreen(),
        ),
        GoRoute(
          path: '/brewfile',
          builder: (context, state) => const BrewfileScreen(),
        ),
      ],
    ),
  ],
);

class BrewCatalogApp extends ConsumerWidget {
  const BrewCatalogApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Brew Catalog',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
