import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/view_models.dart';
import '../providers/package_detail_provider.dart';
import '../providers/packages_provider.dart';
import '../widgets/package_list.dart';
import '../widgets/search_bar.dart' as app;

class CatalogScreen extends ConsumerWidget {
  final bool casksOnly;

  const CatalogScreen({this.casksOnly = false, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResults = ref.watch(searchResultsProvider);
    final installedNames = ref.watch(installedNamesProvider);
    final outdatedNames = ref.watch(outdatedNamesProvider);
    final selectedPkg = ref.watch(selectedPackageProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text(
                casksOnly ? 'Casks' : 'Browse All',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 16),
              const Expanded(child: app.PackageSearchBar()),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: searchResults.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: Text('Error: $err')),
            data: (results) {
              final names = casksOnly ? results.casks : [
                ...results.formulae,
                ...results.casks,
              ];
              if (names.isEmpty) {
                return const Center(
                  child: Text('Type to search for packages...'),
                );
              }
              final installed = installedNames.valueOrNull ?? {};
              final outdated = outdatedNames.valueOrNull ?? {};
              final items = names.map((name) {
                return PackageListItem(
                  name: name,
                  version: '',
                  description: '',
                  isInstalled: installed.contains(name),
                  hasUpdate: outdated.contains(name),
                );
              }).toList();

              return PackageList(
                packages: items,
                selectedName: selectedPkg,
                onSelect: (name) => ref
                    .read(selectedPackageProvider.notifier)
                    .state = name,
              );
            },
          ),
        ),
      ],
    );
  }
}
