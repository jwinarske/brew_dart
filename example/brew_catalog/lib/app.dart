import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'screens/brewfile_screen.dart';
import 'screens/catalog_screen.dart';
import 'screens/installed_screen.dart';
import 'screens/outdated_screen.dart';
import 'screens/pinned_screen.dart';
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
          pageBuilder:
              (context, state) =>
                  const NoTransitionPage(child: CatalogScreen()),
        ),
        GoRoute(
          path: '/catalog/casks',
          pageBuilder:
              (context, state) =>
                  const NoTransitionPage(child: CatalogScreen(casksOnly: true)),
        ),
        GoRoute(
          path: '/installed',
          pageBuilder:
              (context, state) =>
                  const NoTransitionPage(child: InstalledScreen()),
        ),
        GoRoute(
          path: '/outdated',
          pageBuilder:
              (context, state) =>
                  const NoTransitionPage(child: OutdatedScreen()),
        ),
        GoRoute(
          path: '/pinned',
          pageBuilder:
              (context, state) => const NoTransitionPage(child: PinnedScreen()),
        ),
        GoRoute(
          path: '/taps',
          pageBuilder:
              (context, state) => const NoTransitionPage(child: TapsScreen()),
        ),
        GoRoute(
          path: '/services',
          pageBuilder:
              (context, state) =>
                  const NoTransitionPage(child: ServicesScreen()),
        ),
        GoRoute(
          path: '/brewfile',
          pageBuilder:
              (context, state) =>
                  const NoTransitionPage(child: BrewfileScreen()),
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
