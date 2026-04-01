import 'dart:io';

import 'package:brew_dart/brew_dart.dart';

void main() async {
  final brew = Brew();

  // Check brew is available
  if (!await brew.isInstalled()) {
    print('Homebrew is not installed.');
    return;
  }
  print('Homebrew ${await brew.version()}');

  // Search for packages (text-parsed, but simple and stable)
  final results = await brew.search('node');
  print('Formulae: ${results.formulae.join(', ')}');
  print('Casks: ${results.casks.join(', ')}');

  // Get detailed info (JSON-backed — reliable)
  final nodeInfo = await brew.info('node');
  if (nodeInfo.isFormula) {
    print('Latest: ${nodeInfo.formula!.versions.stable}');
    print('Dependencies: ${nodeInfo.formula!.dependencies.join(', ')}');
  }

  // See what's installed (JSON-backed)
  final installed = await brew.installed();
  print('${installed.length} packages installed');

  // Batch install with progress callback
  final result = await brew.installAll(
    ['ripgrep', 'fd', 'bat', 'eza'],
    parallel: true,
    concurrency: 2,
    onEach: (pkg, res) {
      final icon = res.success ? '+' : 'x';
      print('  $icon $pkg (${res.elapsed.inSeconds}s)');
    },
  );
  print('Installed ${result.succeeded}/${result.total}');
  if (result.failed > 0) {
    print('Failed: ${result.failedPackages.join(', ')}');
  }

  // Stream a single install in real-time
  await for (final output in brew.installStream('ffmpeg')) {
    stdout.write(output.line);
    stdout.write('\n');
  }

  // Check what's outdated and upgrade (JSON-backed)
  final outdated = await brew.outdated();
  for (final pkg in outdated) {
    print('${pkg.name}: ${pkg.currentVersion} -> ${pkg.latestVersion}');
  }
  if (outdated.isNotEmpty) {
    await brew.upgradeAll(onEach: (pkg, res) {
      print('Upgraded $pkg: ${res.success ? 'ok' : 'failed'}');
    });
  }

  // Cleanup old versions (dry run)
  final cleanup = await brew.cleanup(dryRun: true);
  print(cleanup.output);

  // Brewfile workflow
  await brew.bundleDump(file: 'Brewfile', force: true);
  await brew.bundle(file: 'Brewfile');
  final check = await brew.bundleCheck(file: 'Brewfile');
  print('Brewfile satisfied: ${check.satisfied}');
}
