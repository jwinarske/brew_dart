// Run: dart test/manual/test_batch_install.dart
//
// Tests parallel batch install of small packages, then cleans up.

import 'package:brew_dart/brew_dart.dart';

void main() async {
  final brew = Brew();

  if (!await brew.isInstalled()) {
    print('Homebrew is not installed.');
    return;
  }

  const packages = ['hello', 'cowsay', 'fortune', 'sl', 'figlet'];

  // Uninstall any that are already installed
  print('=== Cleaning up pre-existing installs ===');
  for (final pkg in packages) {
    if (await brew.isPackageInstalled(pkg)) {
      print('  Removing $pkg...');
      await brew.uninstall(pkg);
    }
  }

  print(
    '\n=== Batch installing ${packages.length} packages (parallel, concurrency=2) ===',
  );
  final result = await brew.installAll(
    packages,
    parallel: true,
    concurrency: 2,
    onEach: (pkg, res) {
      final icon = res.success ? '+' : 'x';
      print('  [$icon] $pkg (${res.elapsed.inSeconds}s)');
    },
  );

  print('\n=== Results ===');
  print('  Total: ${result.total}');
  print('  Succeeded: ${result.succeeded}');
  print('  Failed: ${result.failed}');
  print('  Elapsed: ${result.elapsed.inSeconds}s');
  if (result.failedPackages.isNotEmpty) {
    print('  Failed packages: ${result.failedPackages.join(', ')}');
  }

  assert(result.allSucceeded, 'Expected all installs to succeed');

  // Cleanup
  print('\n=== Cleaning up ===');
  final uninstallResult = await brew.uninstallAll(
    packages,
    onEach: (pkg, res) {
      print('  Removed $pkg: ${res.success ? 'ok' : 'failed'}');
    },
  );
  assert(uninstallResult.allSucceeded, 'Expected all uninstalls to succeed');

  print('\nBatch install test complete.');
}
