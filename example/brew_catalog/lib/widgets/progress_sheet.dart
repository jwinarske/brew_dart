import 'package:flutter/material.dart';

import 'package:brew_catalog/models/view_models.dart';

/// Bottom bar shown during active brew operations.
class ProgressSheet extends StatelessWidget {
  final List<BrewOperation> operations;

  const ProgressSheet({
    super.key,
    required this.operations,
  });

  @override
  Widget build(BuildContext context) {
    if (operations.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final current = operations.first;
    final queuedCount = operations.length - 1;

    return Material(
      elevation: 8,
      color: colorScheme.surfaceContainerHigh,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2.5),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${current.type.label} ${current.package}...',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (queuedCount > 0)
                      Text(
                        '$queuedCount operation${queuedCount == 1 ? '' : 's'} queued',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.expand_less_rounded),
                tooltip: 'Show details',
                onPressed: () => _showOperationLog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showOperationLog(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        final theme = Theme.of(context);
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Column(
              children: [
                // Handle bar
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    width: 32,
                    height: 4,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onSurfaceVariant
                          .withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Text(
                        'Operations',
                        style: theme.textTheme.titleMedium,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: operations.length,
                    itemBuilder: (context, index) {
                      final op = operations[index];
                      return _OperationTile(operation: op);
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _OperationTile extends StatelessWidget {
  final BrewOperation operation;

  const _OperationTile({required this.operation});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final statusIcon = switch (operation.status) {
      OperationStatus.pending => Icon(Icons.schedule_rounded,
          size: 20, color: colorScheme.onSurfaceVariant),
      OperationStatus.running => const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      OperationStatus.completed =>
        Icon(Icons.check_circle_rounded, size: 20, color: colorScheme.primary),
      OperationStatus.failed =>
        Icon(Icons.error_rounded, size: 20, color: colorScheme.error),
    };

    return ExpansionTile(
      leading: statusIcon,
      title: Text(
        '${operation.type.label} ${operation.package}',
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        operation.status.name,
        style: theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      children: [
        if (operation.progress.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SelectableText(
              operation.progress,
              style: theme.textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
                fontSize: 11,
              ),
            ),
          ),
        if (operation.error != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              operation.error!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.error,
              ),
            ),
          ),
        const SizedBox(height: 8),
      ],
    );
  }
}
