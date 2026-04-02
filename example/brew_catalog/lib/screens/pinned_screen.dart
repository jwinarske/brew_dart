import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/operation_provider.dart';
import '../providers/package_detail_provider.dart';
import '../providers/packages_provider.dart';

class PinnedScreen extends ConsumerWidget {
  const PinnedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinnedAsync = ref.watch(pinnedPackagesProvider);
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text('Pinned Packages', style: theme.textTheme.titleMedium),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: pinnedAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: Text('Error: $err')),
            data: (packages) {
              if (packages.isEmpty) {
                return const Center(child: Text('No pinned packages.'));
              }
              return ListView.builder(
                itemCount: packages.length,
                itemExtent: 56,
                itemBuilder: (context, index) {
                  final name = packages[index];
                  return ListTile(
                    leading: const Icon(Icons.push_pin_rounded, size: 18),
                    title: Text(name),
                    onTap:
                        () =>
                            ref.read(selectedPackageProvider.notifier).state =
                                name,
                    trailing: OutlinedButton(
                      onPressed:
                          () =>
                              ref.read(operationsProvider.notifier).unpin(name),
                      child: const Text('Unpin'),
                    ),
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
