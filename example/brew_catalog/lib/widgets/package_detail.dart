import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:brew_catalog/providers/package_detail_provider.dart';
import 'package:brew_catalog/providers/packages_provider.dart';
import 'package:brew_catalog/providers/operation_provider.dart';

import 'dependency_chips.dart';
import 'install_button.dart';
import 'stat_card.dart';
import 'status_badge.dart';

/// Detail view for a single package.
class PackageDetail extends ConsumerWidget {
  final String name;

  const PackageDetail({super.key, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(packageDetailProvider(name));
    final installedNames = ref.watch(installedNamesProvider);
    final outdatedNames = ref.watch(outdatedNamesProvider);
    final operations = ref.watch(operationsProvider);

    return detailAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error:
          (error, _) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  size: 48,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text(
                  'Failed to load package info',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                Text('$error', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
      data: (info) {
        final isInstalled = installedNames.valueOrNull?.contains(name) ?? false;
        final hasUpdate = outdatedNames.valueOrNull?.contains(name) ?? false;
        final isOperating = operations.any(
          (op) => op.package == name && op.status.name == 'running',
        );

        final version =
            info.isFormula
                ? info.formula!.versions.stable
                : info.cask?.version ?? '';
        final license = info.formula?.license ?? 'N/A';
        final tap = info.formula?.tap ?? info.cask?.tap ?? 'N/A';
        final homepage = info.homepage;
        final deps = info.isFormula ? info.formula!.dependencies : <String>[];

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  if (info.isCask) ...[
                    const StatusBadge.cask(),
                    const SizedBox(width: 8),
                  ],
                  if (isInstalled) ...[
                    const StatusBadge.installed(),
                    const SizedBox(width: 8),
                  ],
                  if (hasUpdate) const StatusBadge.update(),
                ],
              ),
              const SizedBox(height: 8),

              // Description
              Text(
                info.desc,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),

              // Stats grid
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  SizedBox(
                    width: 160,
                    child: StatCard(label: 'Version', value: version),
                  ),
                  SizedBox(
                    width: 160,
                    child: StatCard(label: 'License', value: license),
                  ),
                  SizedBox(
                    width: 160,
                    child: StatCard(label: 'Tap', value: tap),
                  ),
                  SizedBox(
                    width: 160,
                    child: StatCard(
                      label: 'Homepage',
                      value: _shortenUrl(homepage),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (homepage.isNotEmpty)
                TextButton.icon(
                  onPressed: () => _launchUrl(homepage),
                  icon: const Icon(Icons.open_in_new_rounded, size: 16),
                  label: const Text('Open homepage'),
                ),
              const SizedBox(height: 24),

              // Dependencies
              Text(
                'Dependencies',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              DependencyChips(
                deps: deps,
                onTap: (dep) {
                  ref.read(selectedPackageProvider.notifier).state = dep;
                },
              ),
              const SizedBox(height: 32),

              // Action buttons
              InstallButton(
                isInstalled: isInstalled,
                hasUpdate: hasUpdate,
                isOperating: isOperating,
                onInstall:
                    () => ref
                        .read(operationsProvider.notifier)
                        .install(name, cask: info.isCask),
                onUninstall:
                    () => ref
                        .read(operationsProvider.notifier)
                        .uninstall(name, cask: info.isCask),
                onUpgrade:
                    () => ref
                        .read(operationsProvider.notifier)
                        .upgrade(name, cask: info.isCask),
              ),
            ],
          ),
        );
      },
    );
  }

  String _shortenUrl(String url) {
    return url
        .replaceFirst('https://', '')
        .replaceFirst('http://', '')
        .replaceFirst(RegExp(r'/$'), '');
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
