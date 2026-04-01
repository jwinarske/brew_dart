import 'package:flutter/material.dart';

import 'package:brew_catalog/theme/colors.dart';

/// Small colored badge indicating package status.
class StatusBadge extends StatelessWidget {
  final String label;
  final Color color;

  const StatusBadge._({
    required this.label,
    required this.color,
  });

  /// Green badge for installed packages.
  const StatusBadge.installed({super.key})
      : label = 'Installed',
        color = AppColors.installed;

  /// Amber badge for packages with available updates.
  const StatusBadge.update({super.key})
      : label = 'Update',
        color = AppColors.outdated;

  /// Purple badge for pinned packages.
  const StatusBadge.pinned({super.key})
      : label = 'Pinned',
        color = AppColors.pinned;

  /// Blue badge for cask packages.
  const StatusBadge.cask({super.key})
      : label = 'Cask',
        color = AppColors.cask;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
