// Run: dart test/manual/test_tap_lifecycle.dart
//
// Tests the full tap lifecycle: list taps, add a tap, verify, remove it.
// Uses homebrew/command-not-found as a safe test tap.

import 'package:brew_dart/brew_dart.dart';

void main() async {
  final brew = Brew();

  if (!await brew.isInstalled()) {
    print('Homebrew is not installed.');
    return;
  }

  const testTap = 'homebrew/command-not-found';

  print('=== Current taps ===');
  final taps = await brew.taps();
  for (final t in taps) {
    print(
      '  ${t.name} (formulae: ${t.formulaCount ?? 0}, '
      'casks: ${t.caskCount ?? 0})',
    );
  }

  final alreadyTapped = taps.any((t) => t.name == testTap);

  if (!alreadyTapped) {
    print('\n=== Tapping $testTap ===');
    await brew.tap(testTap);
    print('Tapped.');

    print('\n=== Taps after adding ===');
    final after = await brew.taps();
    final added = after.any((t) => t.name == testTap);
    assert(added, 'Expected $testTap to appear in tap list');
    print('  Verified $testTap is present.');
  } else {
    print('\n$testTap is already tapped.');
  }

  print('\n=== Untapping $testTap ===');
  await brew.untap(testTap);
  print('Untapped.');

  print('\n=== Taps after removing ===');
  final afterRemove = await brew.taps();
  final removed = !afterRemove.any((t) => t.name == testTap);
  assert(removed, 'Expected $testTap to be removed');
  print('  Verified $testTap is gone.');

  print('\nTap lifecycle test complete.');
}
