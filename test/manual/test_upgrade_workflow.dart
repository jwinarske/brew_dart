// Run: dart test/manual/test_upgrade_workflow.dart
//
// Tests the pin/outdated/upgrade/unpin workflow.
// Only reports — does not actually upgrade anything unless outdated packages exist.

import 'package:brew_dart/brew_dart.dart';

void main() async {
  final brew = Brew();

  if (!await brew.isInstalled()) {
    print('Homebrew is not installed.');
    return;
  }

  print('=== Currently pinned formulae ===');
  final pinned = await brew.pinned();
  if (pinned.isEmpty) {
    print('  (none)');
  } else {
    for (final p in pinned) {
      print('  $p');
    }
  }

  print('\n=== Outdated packages ===');
  final outdated = await brew.outdated();
  if (outdated.isEmpty) {
    print('  Everything is up to date.');
    print('\nUpgrade workflow test complete (nothing to upgrade).');
    return;
  }

  for (final pkg in outdated) {
    print(
      '  ${pkg.name}: ${pkg.currentVersion} -> ${pkg.latestVersion}'
      '${pkg.pinned ? ' [pinned]' : ''}',
    );
  }

  // Pin the first outdated formula if it's not already pinned
  final target = outdated.firstWhere(
    (p) => !p.pinned && !p.isCask,
    orElse: () => outdated.first,
  );

  if (!target.pinned && !target.isCask) {
    print('\n=== Pinning ${target.name} ===');
    await brew.pin(target.name);

    final pinnedAfter = await brew.pinned();
    assert(
      pinnedAfter.contains(target.name),
      'Expected ${target.name} to be pinned',
    );
    print('  Pinned.');

    print('\n=== Unpinning ${target.name} ===');
    await brew.unpin(target.name);
    print('  Unpinned.');
  }

  print('\nUpgrade workflow test complete.');
  print('To actually upgrade, run: brew upgrade');
}
