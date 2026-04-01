// Run: dart test/manual/test_link_conflicts.dart
//
// Tests keg-only formula linking scenarios.
// Uses openssl@3 which is keg-only by default.

import 'package:brew_dart/brew_dart.dart';

void main() async {
  final brew = Brew();

  if (!await brew.isInstalled()) {
    print('Homebrew is not installed.');
    return;
  }

  const formula = 'openssl@3';

  if (!await brew.isPackageInstalled(formula)) {
    print('$formula is not installed. Installing...');
    final result = await brew.install(formula);
    if (!result.success) {
      print('Failed to install $formula: ${result.errorMessage}');
      return;
    }
  }

  print('=== Getting info for $formula ===');
  final info = await brew.info(formula);
  print('  keg_only: ${info.formula?.kegOnly}');

  print('\n=== Attempting to link $formula (force) ===');
  try {
    await brew.link(formula, force: true);
    print('  Linked successfully.');
  } catch (e) {
    print('  Link failed (expected for some keg-only): $e');
  }

  print('\n=== Unlinking $formula ===');
  try {
    await brew.unlink(formula);
    print('  Unlinked successfully.');
  } catch (e) {
    print('  Unlink failed: $e');
  }

  print('\nLink conflicts test complete.');
}
