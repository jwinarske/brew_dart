import '../models/brew_config.dart';

/// Parses the text output of `brew config` into a [BrewConfig].
///
/// Each line of `brew config` output is a `KEY: value` pair.
class ConfigParser {
  const ConfigParser();

  BrewConfig parse(String output) {
    final raw = <String, String>{};

    for (final line in output.split('\n')) {
      final colonIndex = line.indexOf(':');
      if (colonIndex == -1) continue;
      final key = line.substring(0, colonIndex).trim();
      final value = line.substring(colonIndex + 1).trim();
      if (key.isNotEmpty) {
        raw[key] = value;
      }
    }

    return BrewConfig(
      homebrewVersion: raw['HOMEBREW_VERSION'] ?? '',
      origin: raw['ORIGIN'] ?? '',
      coreOrigin: raw['Core tap origin'] ?? raw['CORE_TAP_ORIGIN'] ?? '',
      prefix: raw['HOMEBREW_PREFIX'] ?? '',
      cellar: raw['HOMEBREW_CELLAR'] ?? '',
      caskroom: raw['HOMEBREW_CASKROOM'] ?? '',
      head: raw['HEAD'],
      homebrewRubyVersion: raw['Homebrew Ruby'] ?? raw['HOMEBREW_RUBY'],
      cpu: raw['CPU'],
      os: raw['OS'],
      macosVersion: raw['macOS'],
      xcode: raw['Xcode'],
      clt: raw['CLT'],
      rosetta2: raw['Rosetta 2'],
      raw: raw,
    );
  }
}
