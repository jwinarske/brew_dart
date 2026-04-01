import 'package:flutter/material.dart';

/// Action button that adapts based on package install state.
class InstallButton extends StatelessWidget {
  final bool isInstalled;
  final bool hasUpdate;
  final bool isOperating;
  final VoidCallback? onInstall;
  final VoidCallback? onUninstall;
  final VoidCallback? onUpgrade;

  const InstallButton({
    super.key,
    required this.isInstalled,
    this.hasUpdate = false,
    this.isOperating = false,
    this.onInstall,
    this.onUninstall,
    this.onUpgrade,
  });

  @override
  Widget build(BuildContext context) {
    if (isOperating) {
      return const FilledButton.tonal(
        onPressed: null,
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    if (!isInstalled) {
      return FilledButton.icon(
        onPressed: onInstall,
        icon: const Icon(Icons.download_rounded),
        label: const Text('Install'),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasUpdate)
          FilledButton.icon(
            onPressed: onUpgrade,
            icon: const Icon(Icons.upgrade_rounded),
            label: const Text('Upgrade'),
          ),
        if (hasUpdate) const SizedBox(width: 8),
        OutlinedButton.icon(
          onPressed: onUninstall,
          icon: const Icon(Icons.delete_outline_rounded),
          label: const Text('Uninstall'),
        ),
      ],
    );
  }
}
