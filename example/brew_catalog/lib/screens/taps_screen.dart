import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/brew_provider.dart';
import '../providers/services_provider.dart';

class TapsScreen extends ConsumerStatefulWidget {
  const TapsScreen({super.key});

  @override
  ConsumerState<TapsScreen> createState() => _TapsScreenState();
}

class _TapsScreenState extends ConsumerState<TapsScreen> {
  final _tapController = TextEditingController();

  @override
  void dispose() {
    _tapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taps = ref.watch(tapsProvider);
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Taps', style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              TextField(
                controller: _tapController,
                decoration: InputDecoration(
                  hintText: 'user/repo',
                  isDense: true,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add, size: 18),
                    onPressed: _addTap,
                  ),
                ),
                onSubmitted: (_) => _addTap(),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: taps.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: Text('Error: $err')),
            data: (tapList) {
              if (tapList.isEmpty) {
                return const Center(child: Text('No taps configured.'));
              }
              return ListView.builder(
                itemCount: tapList.length,
                itemBuilder: (context, index) {
                  final tap = tapList[index];
                  return ListTile(
                    leading: Icon(
                      tap.official == true
                          ? Icons.verified
                          : Icons.folder_outlined,
                    ),
                    title: Text(tap.name),
                    subtitle: Text(
                      '${tap.formulaCount ?? 0} formulae, '
                      '${tap.caskCount ?? 0} casks',
                    ),
                    trailing:
                        tap.official != true
                            ? IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () => _removeTap(tap.name),
                            )
                            : null,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _addTap() async {
    final name = _tapController.text.trim();
    if (name.isEmpty) return;

    final connState = await ref.read(brewConnectionProvider.future);
    final brew = getBrewOrThrow(connState);

    try {
      await brew.tap(name);
      _tapController.clear();
      ref.invalidate(tapsProvider);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to add tap: $e')));
      }
    }
  }

  Future<void> _removeTap(String name) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Remove Tap'),
            content: Text('Remove $name?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Remove'),
              ),
            ],
          ),
    );
    if (confirmed != true) return;

    final connState = await ref.read(brewConnectionProvider.future);
    final brew = getBrewOrThrow(connState);

    try {
      await brew.untap(name);
      ref.invalidate(tapsProvider);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to remove tap: $e')));
      }
    }
  }
}
