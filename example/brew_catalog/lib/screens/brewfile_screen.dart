import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/brew_provider.dart';
import '../providers/packages_provider.dart';

class BrewfileScreen extends ConsumerStatefulWidget {
  const BrewfileScreen({super.key});

  @override
  ConsumerState<BrewfileScreen> createState() => _BrewfileScreenState();
}

class _BrewfileScreenState extends ConsumerState<BrewfileScreen> {
  String? _brewfileContent;
  String? _checkOutput;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text('Brewfile', style: theme.textTheme.titleMedium),
              const Spacer(),
              OutlinedButton.icon(
                onPressed: _isLoading ? null : _dumpBrewfile,
                icon: const Icon(Icons.download, size: 18),
                label: const Text('Export'),
              ),
              const SizedBox(width: 8),
              FilledButton.icon(
                onPressed: _isLoading ? null : _checkBrewfile,
                icon: const Icon(Icons.check_circle_outline, size: 18),
                label: const Text('Check'),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        if (_isLoading)
          const LinearProgressIndicator()
        else
          const SizedBox(height: 4),
        Expanded(
          child: _brewfileContent != null
              ? SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_checkOutput != null) ...[
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _checkOutput!,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      SelectableText(
                        _brewfileContent!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.description_outlined,
                        size: 48,
                        color: theme.colorScheme.outline,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Export your Brewfile or check its status.',
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> _dumpBrewfile() async {
    setState(() => _isLoading = true);
    try {
      final connState = await ref.read(brewConnectionProvider.future);
      final brew = getBrewOrThrow(connState);
      final content = await brew.bundleDump();
      setState(() {
        _brewfileContent = content;
        _checkOutput = null;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Export failed: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _checkBrewfile() async {
    setState(() => _isLoading = true);
    try {
      final connState = await ref.read(brewConnectionProvider.future);
      final brew = getBrewOrThrow(connState);
      final result = await brew.bundleCheck();
      setState(() {
        _checkOutput = result.satisfied
            ? 'All Brewfile dependencies are satisfied.'
            : 'Missing entries:\n${result.missingEntries.join('\n')}';
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Check failed: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }
}
