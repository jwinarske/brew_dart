import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/operation_provider.dart';
import '../providers/package_detail_provider.dart';
import '../providers/packages_provider.dart';

class OutdatedScreen extends ConsumerWidget {
  const OutdatedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outdated = ref.watch(outdatedPackagesProvider);
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text('Outdated Packages', style: theme.textTheme.titleMedium),
              const Spacer(),
              outdated.whenOrNull(
                    data: (list) => list.isNotEmpty
                        ? FilledButton.icon(
                            onPressed: () => ref
                                .read(operationsProvider.notifier)
                                .upgradeAll(),
                            icon: const Icon(Icons.system_update_alt, size: 18),
                            label: const Text('Upgrade All'),
                          )
                        : null,
                  ) ??
                  const SizedBox.shrink(),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: outdated.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: Text('Error: $err')),
            data: (packages) {
              if (packages.isEmpty) {
                return const Center(
                  child: Text('Everything is up to date!'),
                );
              }
              return ListView.builder(
                itemCount: packages.length,
                itemExtent: 72,
                itemBuilder: (context, index) {
                  final pkg = packages[index];
                  return ListTile(
                    title: Text(pkg.name),
                    subtitle: Text(
                      '${pkg.currentVersion} -> ${pkg.latestVersion}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (pkg.pinned)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Chip(
                              label: const Text('Pinned'),
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        OutlinedButton(
                          onPressed: pkg.pinned
                              ? null
                              : () => ref
                                  .read(operationsProvider.notifier)
                                  .upgrade(pkg.name, cask: pkg.isCask),
                          child: const Text('Upgrade'),
                        ),
                      ],
                    ),
                    onTap: () => ref
                        .read(selectedPackageProvider.notifier)
                        .state = pkg.name,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
