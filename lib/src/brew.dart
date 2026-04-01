import 'cli/brew_cli.dart';
import 'exceptions.dart';
import 'models/brew_config.dart';
import 'models/doctor_report.dart';
import 'models/installed_package.dart';
import 'models/outdated_package.dart';
import 'models/package_info.dart';
import 'models/search_result.dart';
import 'parsers/config_parser.dart';
import 'parsers/doctor_parser.dart';
import 'parsers/json_v2_parser.dart';
import 'parsers/search_parser.dart';

/// Unified facade for interacting with Homebrew.
///
/// Provides a single entry point for all brew operations:
/// ```dart
/// final brew = Brew();
/// if (await brew.isInstalled()) {
///   final version = await brew.version();
///   print('Homebrew $version');
/// }
/// ```
class Brew {
  final BrewCli _cli;
  final ConfigParser _configParser;
  final DoctorParser _doctorParser;
  final JsonV2Parser _jsonV2Parser;
  final SearchParser _searchParser;

  Brew({
    BrewCli? cli,
    ConfigParser configParser = const ConfigParser(),
    DoctorParser doctorParser = const DoctorParser(),
    JsonV2Parser jsonV2Parser = const JsonV2Parser(),
    SearchParser searchParser = const SearchParser(),
  })  : _cli = cli ?? BrewCli(),
        _configParser = configParser,
        _doctorParser = doctorParser,
        _jsonV2Parser = jsonV2Parser,
        _searchParser = searchParser;

  /// The underlying CLI runner, exposed for advanced use cases.
  BrewCli get cli => _cli;

  /// Check if brew is installed and accessible.
  Future<bool> isInstalled() async {
    try {
      final result = await _cli.run(
        ['--version'],
        timeout: const Duration(seconds: 10),
      );
      return result.isSuccess;
    } on BrewNotInstalledException {
      return false;
    } on Exception {
      return false;
    }
  }

  /// Get the brew version string (e.g. "4.2.0").
  ///
  /// Throws [BrewNotInstalledException] if brew is not available.
  Future<String> version() async {
    final result = await _cli.run(
      ['--version'],
      timeout: const Duration(seconds: 10),
    );
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    // Output is like "Homebrew 4.2.0\nHomebrew/homebrew-core ..."
    // Extract just the version number from the first line.
    final firstLine = result.stdout.split('\n').first.trim();
    final match = RegExp(r'Homebrew\s+(\S+)').firstMatch(firstLine);
    return match?.group(1) ?? firstLine;
  }

  /// Parsed `brew config` output.
  ///
  /// Returns a [BrewConfig] with structured access to Homebrew's
  /// configuration, including prefix, cellar path, and version info.
  Future<BrewConfig> config() async {
    final result = await _cli.run(['config']);
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    return _configParser.parse(result.stdout);
  }

  /// Parsed `brew doctor` output — list of warnings/errors.
  ///
  /// Returns a [DoctorReport] indicating whether the system is healthy
  /// and listing any diagnostics found.
  ///
  /// Note: `brew doctor` returns exit code 1 when there are warnings,
  /// so we don't throw on non-zero exit code here.
  Future<DoctorReport> doctor() async {
    final result = await _cli.run(
      ['doctor'],
      timeout: const Duration(minutes: 2),
    );
    // brew doctor returns exit code 1 for warnings, which is normal.
    return _doctorParser.parse(result.stdout);
  }

  /// Homebrew prefix path (e.g. `/opt/homebrew`, `/usr/local`).
  Future<String> prefix() async {
    final result = await _cli.run(
      ['--prefix'],
      timeout: const Duration(seconds: 10),
    );
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    return result.stdout.trim();
  }

  /// Homebrew Cellar path (e.g. `/opt/homebrew/Cellar`).
  Future<String> cellarPath() async {
    final result = await _cli.run(
      ['--cellar'],
      timeout: const Duration(seconds: 10),
    );
    if (!result.isSuccess) {
      throw BrewCommandException.fromResult(result);
    }
    return result.stdout.trim();
  }

  // ---------------------------------------------------------------------------
  // Phase 2: Query & Info
  // ---------------------------------------------------------------------------

  /// Get detailed info for a single formula or cask.
  ///
  /// Uses `brew info --json=v2 <name>`.
  /// Throws [PackageNotFoundException] if the package is not found.
  Future<PackageInfo> info(String name) async {
    final results = await infoMultiple([name]);
    if (results.isEmpty) {
      throw PackageNotFoundException(name);
    }
    return results.first;
  }

  /// Get detailed info for one or more formulae/casks.
  ///
  /// Uses `brew info --json=v2 <names...>`.
  Future<List<PackageInfo>> infoMultiple(List<String> names) async {
    final json = await _cli.runJson(['info', ...names]);
    return _jsonV2Parser.parseInfo(json);
  }

  /// Get info for ALL installed packages.
  ///
  /// Uses `brew info --json=v2 --installed`.
  Future<List<InstalledPackage>> installed() async {
    final json = await _cli.runJson(['info', '--installed']);
    return _jsonV2Parser.parseInstalled(json);
  }

  /// Get outdated packages with old/new version info.
  ///
  /// Uses `brew outdated --json=v2`.
  Future<List<OutdatedPackage>> outdated({
    bool cask = false,
    bool greedy = false,
  }) async {
    final args = <String>[
      'outdated',
      if (cask) '--cask',
      if (greedy) '--greedy',
    ];
    final json = await _cli.runJson(args);
    return _jsonV2Parser.parseOutdated(json);
  }

  /// Search for packages by name.
  ///
  /// Uses `brew search <query>`. This command does not support `--json`,
  /// so the text output is parsed.
  Future<SearchResult> search(
    String query, {
    bool formulae = true,
    bool casks = true,
  }) async {
    final args = <String>[
      'search',
      if (!formulae) '--cask',
      if (!casks) '--formula',
      query,
    ];
    final result = await _cli.run(args);
    if (!result.isSuccess) {
      // brew search returns exit code 1 when nothing is found
      if (result.stderr.contains('No formulae or casks found')) {
        return const SearchResult();
      }
      throw BrewCommandException.fromResult(result);
    }
    return _searchParser.parse(result.stdout);
  }
}
