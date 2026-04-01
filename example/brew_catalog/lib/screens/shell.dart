import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/brew_provider.dart';
import '../providers/operation_provider.dart';
import '../providers/package_detail_provider.dart';
import '../providers/packages_provider.dart';
import '../widgets/package_detail.dart';
import '../widgets/progress_sheet.dart';
import '../widgets/sidebar.dart';

class AppShell extends ConsumerWidget {
  final Widget child;

  const AppShell({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connection = ref.watch(brewConnectionProvider);
    final activeOps = ref.watch(activeOperationsProvider);
    final selectedPkg = ref.watch(selectedPackageProvider);
    final currentRoute =
        GoRouterState.of(context).uri.toString();

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 220,
            child: Sidebar(
              brewVersion: connection.whenData((c) {
                if (c is BrewConnectedState) return c.version;
                return '?';
              }),
              installedCount: ref
                  .watch(installedPackagesProvider)
                  .whenData((list) => list.length),
              outdatedCount: ref
                  .watch(outdatedPackagesProvider)
                  .whenData((list) => list.length),
              currentRoute: currentRoute,
              onNavigate: (route) => context.go(route),
            ),
          ),
          const VerticalDivider(width: 1),
          Expanded(child: child),
          if (selectedPkg != null) ...[
            const VerticalDivider(width: 1),
            SizedBox(
              width: 320,
              child: PackageDetailPanel(name: selectedPkg),
            ),
          ],
        ],
      ),
      bottomSheet: activeOps.isNotEmpty
          ? ProgressSheet(operations: activeOps)
          : null,
    );
  }
}
