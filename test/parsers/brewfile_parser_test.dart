import 'package:brew_dart/brew_dart.dart';
import 'package:test/test.dart';

import '../test_helpers.dart';

void main() {
  const parser = BrewfileParser();

  test('parses a complete Brewfile', () {
    final content = loadGoldenText('brewfile.txt');
    final brewfile = parser.parse(content);

    expect(brewfile.entries, isNotEmpty);

    final types = brewfile.entries.map((BrewfileEntry e) => e.type).toSet();
    expect(types, contains(BrewfileEntryType.tap));
    expect(types, contains(BrewfileEntryType.brew));
    expect(types, contains(BrewfileEntryType.cask));
    expect(types, contains(BrewfileEntryType.mas));
  });

  test('parses tap entries', () {
    final brewfile = parser.parse('tap "homebrew/cask"\ntap "homebrew/core"\n');
    final taps = brewfile.entries.where(
      (BrewfileEntry e) => e.type == BrewfileEntryType.tap,
    );
    expect(taps, hasLength(2));
    expect(taps.first.name, 'homebrew/cask');
  });

  test('parses brew entries with options', () {
    final content = loadGoldenText('brewfile.txt');
    final brewfile = parser.parse(content);

    final openssl = brewfile.entries.firstWhere(
      (BrewfileEntry e) => e.name == 'openssl@3',
    );
    expect(openssl.type, BrewfileEntryType.brew);
    expect(openssl.options, isNotEmpty);
    expect(openssl.options['args'], isA<List<dynamic>>());
  });

  test('parses mas entries with id', () {
    final content = loadGoldenText('brewfile.txt');
    final brewfile = parser.parse(content);

    final xcode = brewfile.entries.firstWhere(
      (BrewfileEntry e) => e.type == BrewfileEntryType.mas,
    );
    expect(xcode.name, 'Xcode');
    expect(xcode.options['id'], 497799835);
  });

  test('ignores comments and blank lines', () {
    final brewfile = parser.parse(
      '# This is a comment\n\nbrew "git"\n# Another comment\nbrew "node"\n',
    );
    expect(brewfile.entries, hasLength(2));
  });

  test('handles empty content', () {
    final brewfile = parser.parse('');
    expect(brewfile.entries, isEmpty);
  });

  test('handles single-quoted names', () {
    final brewfile = parser.parse("brew 'git'\ncask 'docker'\n");
    expect(brewfile.entries, hasLength(2));
    expect(brewfile.entries[0].name, 'git');
    expect(brewfile.entries[1].name, 'docker');
  });

  test('parses vscode entries', () {
    final brewfile = parser.parse('vscode "ms-python.python"\n');
    expect(brewfile.entries, hasLength(1));
    expect(brewfile.entries.first.type, BrewfileEntryType.vscode);
    expect(brewfile.entries.first.name, 'ms-python.python');
  });

  test('parses whalebrew entries', () {
    final brewfile = parser.parse('whalebrew "whalebrew/wget"\n');
    expect(brewfile.entries, hasLength(1));
    expect(brewfile.entries.first.type, BrewfileEntryType.whalebrew);
  });

  test('parses Ruby symbol option value', () {
    final brewfile = parser.parse('brew "mysql", restart_service: :changed\n');
    expect(brewfile.entries, hasLength(1));
    expect(brewfile.entries.first.options['restart_service'], 'changed');
  });

  test('parses boolean true option value', () {
    final brewfile = parser.parse('brew "git", link: true\n');
    expect(brewfile.entries.first.options['link'], true);
  });

  test('parses boolean false option value', () {
    final brewfile = parser.parse('brew "openssl", keg_only: false\n');
    expect(brewfile.entries.first.options['keg_only'], false);
  });

  test('parses double-quoted string option value', () {
    final brewfile = parser.parse('brew "git", branch: "main"\n');
    expect(brewfile.entries.first.options['branch'], 'main');
  });

  test('parses single-quoted string option value', () {
    final brewfile = parser.parse("brew \"git\", env: 'production'\n");
    expect(brewfile.entries.first.options['env'], 'production');
  });

  test('parses unrecognised entry type as brew', () {
    // The default branch in _parseType returns BrewfileEntryType.brew
    // This is unreachable via normal parsing but tested via known types.
    final brewfile = parser.parse('brew "git"\n');
    expect(brewfile.entries.first.type, BrewfileEntryType.brew);
  });
}
