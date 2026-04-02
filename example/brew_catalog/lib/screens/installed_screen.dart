import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/view_models.dart';
import '../providers/package_detail_provider.dart';
import '../providers/packages_provider.dart';
import '../widgets/package_list.dart';

class InstalledScreen extends ConsumerWidget {
  const InstalledScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final installed = ref.watch(installedPackagesProvider);
    final outdatedNames = ref.watch(outdatedNamesProvider);
    final selectedPkg = ref.watch(selectedPackageProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  'Installed Packages',
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              installed
                      .whenData((list) => Text('${list.length} packages'))
                      .valueOrNull ??
                  const SizedBox.shrink(),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: installed.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: Text('Error: $err')),
            data: (packages) {
              if (packages.isEmpty) {
                return const Center(child: Text('No packages installed.'));
              }
              final outdated = outdatedNames.valueOrNull ?? {};
              final items =
                  packages.map((pkg) {
                      return PackageListItem(
                        name: pkg.name,
                        version: pkg.installedVersion,
                        description:
                            pkg.isFormula
                                ? (pkg.formula?.desc ?? '')
                                : (pkg.cask?.desc ?? ''),
                        isInstalled: true,
                        hasUpdate: outdated.contains(pkg.name),
                        isCask: pkg.isCask,
                      );
                    }).toList()
                    ..sort((a, b) => a.name.compareTo(b.name));

              return PackageList(
                packages: items,
                selectedName: selectedPkg,
                onSelect:
                    (name) =>
                        ref.read(selectedPackageProvider.notifier).state = name,
              );
            },
          ),
        ),
      ],
    );
  }
}
