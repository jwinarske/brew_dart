import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

import '../test_helpers.dart';

void main() {
  const parser = ListParser();

  test('parses formula names (one per line)', () {
    final output = loadGoldenText('list_formulae.txt');
    final names = parser.parseNames(output);

    expect(names, isNotEmpty);
    expect(names, contains('git'));
    expect(names, contains('node'));
    expect(names, contains('openssl@3'));
  });

  test('parses cask names', () {
    final output = loadGoldenText('list_casks.txt');
    final names = parser.parseNames(output);

    expect(names, isNotEmpty);
    expect(names, contains('docker'));
    expect(names, contains('visual-studio-code'));
  });

  test('parses list --versions format (takes only name)', () {
    final output = loadGoldenText('list_versions.txt');
    final names = parser.parseNames(output);

    expect(names, isNotEmpty);
    expect(names, contains('git'));
    expect(names, contains('node'));
    // Should not contain version numbers
    for (final name in names) {
      expect(name, isNot(contains(' ')));
    }
  });

  test('handles empty output', () {
    final names = parser.parseNames('');
    expect(names, isEmpty);
  });

  test('handles whitespace-only output', () {
    final names = parser.parseNames('  \n  \n  ');
    expect(names, isEmpty);
  });
}
