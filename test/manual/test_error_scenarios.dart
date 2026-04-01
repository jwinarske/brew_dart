// Run: dart test/manual/test_error_scenarios.dart
//
// Tests various error scenarios to verify exception handling.

import 'package:brew_dart/brew_dart.dart';

void main() async {
  final brew = Brew();

  if (!await brew.isInstalled()) {
    print('Homebrew is not installed.');
    return;
  }

  // Test 1: Install nonexistent package
  print('=== Test 1: Install nonexistent package ===');
  final result = await brew.install('this_package_does_not_exist_xyz_123');
  print('  Success: ${result.success}');
  print('  Exit code: ${result.exitCode}');
  print('  Error: ${result.errorMessage?.split('\n').first}');
  assert(!result.success, 'Expected install to fail');

  // Test 2: Info for nonexistent package
  print('\n=== Test 2: Info for nonexistent package ===');
  try {
    await brew.info('this_package_does_not_exist_xyz_123');
    print('  ERROR: Expected an exception!');
  } on BrewException catch (e) {
    print('  Caught expected exception: ${e.runtimeType}');
    print('  Message: ${e.message}');
  }

  // Test 3: Uninstall package that isn't installed
  print('\n=== Test 3: Uninstall non-installed package ===');
  final uninstallResult = await brew.uninstall(
    'this_package_does_not_exist_xyz_123',
  );
  print('  Success: ${uninstallResult.success}');
  print('  Exit code: ${uninstallResult.exitCode}');
  assert(!uninstallResult.success, 'Expected uninstall to fail');

  // Test 4: Uninstall with dependency conflict
  print('\n=== Test 4: Dependency conflict check ===');
  final deps = await brew.deps('git');
  print('  git dependencies: ${deps.join(', ')}');
  if (deps.isNotEmpty) {
    final dep = deps.first;
    print('  Attempting to uninstall $dep (should fail due to deps)...');
    final depResult = await brew.uninstall(dep);
    print('  Success: ${depResult.success}');
    if (!depResult.success) {
      print('  Error: ${depResult.errorMessage?.split('\n').first}');
    }
  }

  // Test 5: BrewCli with invalid brew path
  print('\n=== Test 5: Invalid brew path ===');
  final badBrew = Brew(cli: BrewCli(brewPath: '/nonexistent/brew'));
  final installed = await badBrew.isInstalled();
  print('  isInstalled with bad path: $installed');
  assert(!installed, 'Expected isInstalled to return false');

  // Test 6: Missing dependencies
  print('\n=== Test 6: Missing dependencies ===');
  final missing = await brew.missing();
  if (missing.isEmpty) {
    print('  No missing dependencies (system is clean).');
  } else {
    for (final m in missing) {
      print('  ${m.formula}: ${m.missingDeps.join(', ')}');
    }
  }

  print('\nError scenarios test complete.');
}
