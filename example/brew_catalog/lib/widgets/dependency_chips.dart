import 'package:flutter/material.dart';

/// A wrap of action chips representing package dependencies.
class DependencyChips extends StatelessWidget {
  final List<String> deps;
  final ValueChanged<String>? onTap;

  const DependencyChips({super.key, required this.deps, this.onTap});

  @override
  Widget build(BuildContext context) {
    if (deps.isEmpty) {
      return Text(
        'No dependencies',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children:
          deps.map((dep) {
            return ActionChip(
              label: Text(dep),
              labelStyle: Theme.of(context).textTheme.labelSmall,
              visualDensity: VisualDensity.compact,
              onPressed: onTap != null ? () => onTap!(dep) : null,
            );
          }).toList(),
    );
  }
}
