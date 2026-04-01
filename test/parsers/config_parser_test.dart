import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

import '../test_helpers.dart';

void main() {
  const parser = ConfigParser();

  test('parses brew config output', () {
    final output = loadGoldenText('config.txt');
    final config = parser.parse(output);

    expect(config.homebrewVersion, '4.4.23');
    expect(config.origin, 'https://github.com/Homebrew/brew');
    expect(config.prefix, '/opt/homebrew');
    expect(config.cellar, '/opt/homebrew/Cellar');
    expect(config.caskroom, '/opt/homebrew/Caskroom');
    expect(config.head, isNotNull);
    expect(config.os, isNotNull);
    expect(config.cpu, isNotNull);
  });

  test('raw map contains all key-value pairs', () {
    final output = loadGoldenText('config.txt');
    final config = parser.parse(output);

    expect(config.raw, isNotEmpty);
    expect(config.raw['HOMEBREW_VERSION'], '4.4.23');
    expect(config.raw['HOMEBREW_PREFIX'], '/opt/homebrew');
  });

  test('handles missing optional fields gracefully', () {
    const minimal = 'HOMEBREW_VERSION: 4.0.0\n'
        'HOMEBREW_PREFIX: /usr/local\n'
        'HOMEBREW_CELLAR: /usr/local/Cellar\n'
        'HOMEBREW_CASKROOM: /usr/local/Caskroom\n';
    final config = parser.parse(minimal);

    expect(config.homebrewVersion, '4.0.0');
    expect(config.prefix, '/usr/local');
    expect(config.macosVersion, isNull);
    expect(config.xcode, isNull);
    expect(config.rosetta2, isNull);
  });

  test('handles empty output', () {
    final config = parser.parse('');
    expect(config.homebrewVersion, isEmpty);
    expect(config.raw, isEmpty);
  });
}
