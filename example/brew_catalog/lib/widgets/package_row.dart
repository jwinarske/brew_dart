import 'package:flutter/material.dart';

import 'status_badge.dart';

/// A single row in the package list showing name, version, description,
/// and status indicators.
class PackageRow extends StatelessWidget {
  final String name;
  final String version;
  final String description;
  final bool isInstalled;
  final bool hasUpdate;
  final String? installCount;
  final bool isSelected;
  final VoidCallback? onTap;

  const PackageRow({
    super.key,
    required this.name,
    required this.version,
    required this.description,
    this.isInstalled = false,
    this.hasUpdate = false,
    this.installCount,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color:
            isSelected
                ? colorScheme.primaryContainer.withValues(alpha: 0.3)
                : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: name,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '  $version',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                if (isInstalled) const StatusBadge.installed(),
                if (hasUpdate) ...[
                  const SizedBox(width: 4),
                  const StatusBadge.update(),
                ],
              ],
            ),
            const SizedBox(height: 2),
            Text(
              description,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
