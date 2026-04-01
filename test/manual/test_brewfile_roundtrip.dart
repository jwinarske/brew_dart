// Run: dart test/manual/test_brewfile_roundtrip.dart
//
// Tests the Brewfile workflow: dump current state, parse it, check it.

import 'dart:io';

import 'package:brew_dart/brew_dart.dart';

void main() async {
  final brew = Brew();

  if (!await brew.isInstalled()) {
    print('Homebrew is not installed.');
    return;
  }

  final tmpFile = '${Directory.systemTemp.path}/brew_dart_test_Brewfile';

  print('=== Dumping Brewfile to $tmpFile ===');
  await brew.bundleDump(file: tmpFile, force: true);

  final content = await File(tmpFile).readAsString();
  final lines = content.split('\n').where((l) => l.trim().isNotEmpty).length;
  print('  Generated $lines entries.');
  print('  First 10 lines:');
  for (final line in content.split('\n').take(10)) {
    print('    $line');
  }

  print('\n=== Parsing Brewfile ===');
  final brewfile = await brew.readBrewfile(tmpFile);
  print('  Parsed ${brewfile.entries.length} entries:');
  final typeCounts = <String, int>{};
  for (final entry in brewfile.entries) {
    typeCounts[entry.type.name] = (typeCounts[entry.type.name] ?? 0) + 1;
  }
  for (final entry in typeCounts.entries) {
    print('    ${entry.key}: ${entry.value}');
  }

  print('\n=== Checking Brewfile ===');
  final check = await brew.bundleCheck(file: tmpFile);
  print('  Satisfied: ${check.satisfied}');
  if (!check.satisfied) {
    print('  Missing entries:');
    for (final entry in check.missingEntries) {
      print('    $entry');
    }
  }

  // Cleanup
  await File(tmpFile).delete();
  print('\nBrewfile roundtrip test complete.');
}
