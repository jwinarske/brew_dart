import 'package:flutter/material.dart';

import 'package:brew_catalog/models/view_models.dart';

import 'package_row.dart';

/// A scrollable list of packages with fixed item extent for smooth scrolling.
class PackageList extends StatelessWidget {
  final List<PackageListItem> packages;
  final String? selectedName;
  final ValueChanged<String> onSelect;

  const PackageList({
    super.key,
    required this.packages,
    this.selectedName,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    if (packages.isEmpty) {
      return Center(
        child: Text(
          'No packages found',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      );
    }

    return ListView.builder(
      itemExtent: 64,
      itemCount: packages.length,
      itemBuilder: (context, index) {
        final pkg = packages[index];
        return PackageRow(
          name: pkg.name,
          version: pkg.version,
          description: pkg.description,
          isInstalled: pkg.isInstalled,
          hasUpdate: pkg.hasUpdate,
          installCount: pkg.installCount,
          isSelected: pkg.name == selectedName,
          onTap: () => onSelect(pkg.name),
        );
      },
    );
  }
}
