import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Sidebar navigation for the brew catalog app.
class Sidebar extends ConsumerWidget {
  final AsyncValue<String>? brewVersion;
  final AsyncValue<int>? installedCount;
  final AsyncValue<int>? outdatedCount;
  final String currentRoute;
  final ValueChanged<String> onNavigate;

  const Sidebar({
    super.key,
    this.brewVersion,
    this.installedCount,
    this.outdatedCount,
    required this.currentRoute,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: 220,
      child: Material(
        color: colorScheme.surfaceContainerLow,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  const _SectionHeader(title: 'Browse'),
                  _NavItem(
                    icon: Icons.apps_rounded,
                    label: 'All',
                    route: '/catalog',
                    currentRoute: currentRoute,
                    onNavigate: onNavigate,
                  ),
                  _NavItem(
                    icon: Icons.desktop_mac_rounded,
                    label: 'Casks',
                    route: '/catalog/casks',
                    currentRoute: currentRoute,
                    onNavigate: onNavigate,
                  ),
                  const SizedBox(height: 8),
                  const _SectionHeader(title: 'Local'),
                  _NavItem(
                    icon: Icons.inventory_2_rounded,
                    label: 'Installed',
                    route: '/installed',
                    currentRoute: currentRoute,
                    onNavigate: onNavigate,
                    trailing: _countBadge(context, installedCount),
                  ),
                  _NavItem(
                    icon: Icons.update_rounded,
                    label: 'Outdated',
                    route: '/outdated',
                    currentRoute: currentRoute,
                    onNavigate: onNavigate,
                    trailing: _countBadge(context, outdatedCount),
                  ),
                  _NavItem(
                    icon: Icons.push_pin_rounded,
                    label: 'Pinned',
                    route: '/pinned',
                    currentRoute: currentRoute,
                    onNavigate: onNavigate,
                  ),
                  const SizedBox(height: 8),
                  const _SectionHeader(title: 'Manage'),
                  _NavItem(
                    icon: Icons.source_rounded,
                    label: 'Taps',
                    route: '/taps',
                    currentRoute: currentRoute,
                    onNavigate: onNavigate,
                  ),
                  _NavItem(
                    icon: Icons.miscellaneous_services_rounded,
                    label: 'Services',
                    route: '/services',
                    currentRoute: currentRoute,
                    onNavigate: onNavigate,
                  ),
                  _NavItem(
                    icon: Icons.description_rounded,
                    label: 'Brewfile',
                    route: '/brewfile',
                    currentRoute: currentRoute,
                    onNavigate: onNavigate,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child:
                  brewVersion?.when(
                    data:
                        (version) => Text(
                          'brew $version',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                    loading:
                        () => const SizedBox(
                          width: 12,
                          height: 12,
                          child: CircularProgressIndicator(strokeWidth: 1.5),
                        ),
                    error:
                        (_, __) => Text(
                          'brew unavailable',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.error,
                          ),
                        ),
                  ) ??
                  const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget? _countBadge(BuildContext context, AsyncValue<int>? count) {
    if (count == null) return null;
    return count.when(
      data: (value) {
        if (value == 0) return null;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$value',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        );
      },
      loading:
          () => const SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(strokeWidth: 1.5),
          ),
      error: (_, __) => null,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;
  final String currentRoute;
  final ValueChanged<String> onNavigate;
  final Widget? trailing;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.currentRoute,
    required this.onNavigate,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentRoute == route;
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: Icon(
        icon,
        size: 20,
        color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: isSelected ? colorScheme.primary : colorScheme.onSurface,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      trailing: trailing,
      selected: isSelected,
      selectedTileColor: colorScheme.primaryContainer.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: () => onNavigate(route),
    );
  }
}
