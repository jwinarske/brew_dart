import '../models/brewfile.dart';

/// Parses a Brewfile into a [Brewfile] model.
///
/// Brewfile format (Ruby DSL, but simple enough to regex-parse):
/// ```
/// tap "homebrew/cask"
/// brew "git"
/// brew "openssl@3", args: ["force"]
/// cask "docker"
/// mas "Xcode", id: 497799835
/// vscode "ms-python.python"
/// ```
///
/// Lines starting with `#` are comments. Blank lines are ignored.
class BrewfileParser {
  const BrewfileParser();

  static final _entryPattern = RegExp(
    r'''^(tap|brew|cask|mas|whalebrew|vscode)\s+["']([^"']+)["'](.*)$''',
  );

  Brewfile parse(String content) {
    final entries = <BrewfileEntry>[];

    for (final line in content.split('\n')) {
      final trimmed = line.trim();
      if (trimmed.isEmpty || trimmed.startsWith('#')) continue;

      final match = _entryPattern.firstMatch(trimmed);
      if (match == null) continue;

      final typeStr = match.group(1)!;
      final name = match.group(2)!;
      final rest = match.group(3)?.trim() ?? '';

      final type = _parseType(typeStr);
      final options = _parseOptions(rest);

      entries.add(BrewfileEntry(
        type: type,
        name: name,
        options: options,
      ));
    }

    return Brewfile(entries: entries);
  }

  BrewfileEntryType _parseType(String value) {
    return switch (value) {
      'tap' => BrewfileEntryType.tap,
      'brew' => BrewfileEntryType.brew,
      'cask' => BrewfileEntryType.cask,
      'mas' => BrewfileEntryType.mas,
      'whalebrew' => BrewfileEntryType.whalebrew,
      'vscode' => BrewfileEntryType.vscode,
      _ => BrewfileEntryType.brew,
    };
  }

  /// Parse the comma-separated options after the package name.
  ///
  /// Examples:
  /// - `, args: ["with-openssl", "force"]` -> `{args: ["with-openssl", "force"]}`
  /// - `, restart_service: :changed` -> `{restart_service: "changed"}`
  /// - `, id: 497799835` -> `{id: 497799835}`
  Map<String, dynamic> _parseOptions(String rest) {
    if (rest.isEmpty) return {};

    final options = <String, dynamic>{};
    // Remove leading comma
    final cleaned = rest.startsWith(',') ? rest.substring(1).trim() : rest;
    if (cleaned.isEmpty) return {};

    // Match key: value pairs
    final pairPattern = RegExp(
      r'''(\w+):\s*(.+?)(?=,\s*\w+:|$)''',
    );

    for (final match in pairPattern.allMatches(cleaned)) {
      final key = match.group(1)!;
      final rawValue = match.group(2)!.trim();
      options[key] = _parseValue(rawValue);
    }

    return options;
  }

  dynamic _parseValue(String raw) {
    // Array: ["a", "b"]
    if (raw.startsWith('[') && raw.endsWith(']')) {
      final inner = raw.substring(1, raw.length - 1);
      return inner
          .split(',')
          .map((s) => s.trim().replaceAll(RegExp(r'''["']'''), ''))
          .where((s) => s.isNotEmpty)
          .toList();
    }
    // Ruby symbol: :foo
    if (raw.startsWith(':')) {
      return raw.substring(1);
    }
    // Number
    final number = int.tryParse(raw);
    if (number != null) return number;
    // Boolean
    if (raw == 'true') return true;
    if (raw == 'false') return false;
    // Quoted string
    if ((raw.startsWith('"') && raw.endsWith('"')) ||
        (raw.startsWith("'") && raw.endsWith("'"))) {
      return raw.substring(1, raw.length - 1);
    }
    return raw;
  }
}
