import 'package:brew_dart/brew_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/brew_provider.dart';
import '../providers/services_provider.dart';
import '../theme/colors.dart';

class ServicesScreen extends ConsumerWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(servicesProvider);
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text('Services', style: theme.textTheme.titleMedium),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () => ref.invalidate(servicesProvider),
                tooltip: 'Refresh',
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: services.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: Text('Error: $err')),
            data: (serviceList) {
              if (serviceList.isEmpty) {
                return const Center(child: Text('No services found.'));
              }
              return ListView.builder(
                itemCount: serviceList.length,
                itemBuilder: (context, index) {
                  final svc = serviceList[index];
                  return ListTile(
                    leading: _statusIcon(svc.status),
                    title: Text(svc.name),
                    subtitle: Text(
                      '${svc.status.name}'
                      '${svc.user != null ? ' (${svc.user})' : ''}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (svc.status == ServiceStatus.started)
                          IconButton(
                            icon: const Icon(Icons.stop),
                            tooltip: 'Stop',
                            onPressed:
                                () => _serviceAction(ref, svc.name, 'stop'),
                          )
                        else
                          IconButton(
                            icon: const Icon(Icons.play_arrow),
                            tooltip: 'Start',
                            onPressed:
                                () => _serviceAction(ref, svc.name, 'start'),
                          ),
                        IconButton(
                          icon: const Icon(Icons.restart_alt),
                          tooltip: 'Restart',
                          onPressed:
                              () => _serviceAction(ref, svc.name, 'restart'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _statusIcon(ServiceStatus status) {
    return switch (status) {
      ServiceStatus.started => const Icon(
        Icons.circle,
        color: AppColors.installed,
        size: 12,
      ),
      ServiceStatus.stopped => const Icon(Icons.circle_outlined, size: 12),
      ServiceStatus.error => const Icon(
        Icons.error,
        color: AppColors.error,
        size: 12,
      ),
      _ => const Icon(Icons.help_outline, size: 12),
    };
  }

  Future<void> _serviceAction(WidgetRef ref, String name, String action) async {
    final connState = await ref.read(brewConnectionProvider.future);
    final brew = getBrewOrThrow(connState);

    switch (action) {
      case 'start':
        await brew.startService(name);
      case 'stop':
        await brew.stopService(name);
      case 'restart':
        await brew.restartService(name);
    }
    ref.invalidate(servicesProvider);
  }
}
