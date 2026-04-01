// Run: dart test/manual/test_cleanup.dart
//
// Tests brew cleanup with --dry-run to see what would be removed.

import 'package:brew_dart/brew_dart.dart';

void main() async {
  final brew = Brew();

  if (!await brew.isInstalled()) {
    print('Homebrew is not installed.');
    return;
  }

  print('=== Cleanup dry run ===');
  final dryRun = await brew.cleanup(dryRun: true);
  print('  Success: ${dryRun.success}');
  print('  Exit code: ${dryRun.exitCode}');
  if (dryRun.output.trim().isNotEmpty) {
    final lines = dryRun.output.split('\n').where((l) => l.trim().isNotEmpty);
    print('  Would remove ${lines.length} item(s):');
    for (final line in lines.take(20)) {
      print('    $line');
    }
    if (lines.length > 20) {
      print('    ... and ${lines.length - 20} more');
    }
  } else {
    print('  Nothing to clean up.');
  }

  print('\n=== Cleanup dry run (scrub) ===');
  final scrub = await brew.cleanup(dryRun: true, scrub: true);
  if (scrub.output.trim().isNotEmpty) {
    final lines = scrub.output.split('\n').where((l) => l.trim().isNotEmpty);
    print('  Would remove ${lines.length} item(s) with scrub.');
  } else {
    print('  Nothing to scrub.');
  }

  print('\nCleanup test complete (dry-run only, nothing was deleted).');
}
